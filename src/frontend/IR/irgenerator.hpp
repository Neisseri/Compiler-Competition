#pragma once

#include "../../common/common.hpp"

#include "../../common/ir.hpp"

#include "../ast/tree.hpp"
#include "../ast/astVisitor.hpp"
#include "CFGbuilder.hpp"

class IRGenerator{
public:
    ir::Program ir_program;
    int reg_num = 0;
    int label_num = 0;

    std::set<std::string> var_name_set; // set of variable names
    std::set<std::string> global_var_table; // set of global variable names
    std::unordered_map<std::string, std::set<std::shared_ptr<ir::BasicBlock>>> Defs; // bbs where the var defined
    std::unordered_map<std::string, ir::Reg> var_ptr_table; // the table of var ptr
    std::unordered_map<std::string, Type> var_type_table; // the table of var type
    std::unordered_map<std::string, int> const_val_table; // the table of const val(int)

    std::vector<std::shared_ptr<ir::BasicBlock>> break_to_stack;
    std::vector<std::shared_ptr<ir::BasicBlock>> continue_to_stack;

    ir::Reg get_new_reg(int type){
        return ir::Reg(type, ++reg_num);
    }

    ir::BasicBlock* get_new_bb_ptr(ir::Function *func){
        return new ir::BasicBlock(label_num++, func);
    }

    ir::Reg visitIndex(LValue *lvalue, std::shared_ptr<ir::BasicBlock> &ir_bb){ // get index of array.
        std::cerr << "visitIndex" << std::endl;
        assert(lvalue->has_index);

        ir::Reg dst_adr_ptr;
        std::string name = lvalue->ident->name;
        ir::Reg dst_ptr;
        if (global_var_table.find(name) != global_var_table.end()){
            dst_ptr = get_new_reg(lvalue->var_type->type);
            std::unique_ptr<ir::LoadAddr> loadaddr_instr(new ir::LoadAddr(dst_ptr, name));
            ir_bb->instrs.push_back(std::move(loadaddr_instr));
        } else {
            dst_ptr = var_ptr_table[lvalue->ident->name];
        }
        ir::Reg block_size = get_new_reg(lvalue->var_type->type);
        std::unique_ptr<ir::LoadInt> loadone_instr(new ir::LoadInt(block_size, 4));
        ir_bb->instrs.push_back(std::move(loadone_instr));
        for (int i = lvalue->indices.size() - 1; i >= 0; i --)
        {
            ir::Reg idx = visitExpression(lvalue->indices[i], ir_bb);
            ir::Reg offset = get_new_reg(lvalue->var_type->type);
            std::unique_ptr<ir::Binary> muloffset_instr(new ir::Binary(offset, BinaryOpEnum::MUL, idx, block_size));
            dst_adr_ptr = get_new_reg(lvalue->var_type->type);
            std::unique_ptr<ir::Binary> addoffset_instr(new ir::Binary(dst_adr_ptr, BinaryOpEnum::ADD, dst_ptr, offset));
            dst_ptr = dst_adr_ptr;
            ir_bb->instrs.push_back(std::move(muloffset_instr));
            ir_bb->instrs.push_back(std::move(addoffset_instr));

            if (i > 0){
                std::cerr << "visitIndex calc blocksize " << i << std::endl;
                ir::Reg dim_size = get_new_reg(lvalue->var_type->type);
                std::unique_ptr<ir::LoadInt> loaddim_instr(new ir::LoadInt(dim_size, var_type_table[lvalue->ident->name].dim[i]));
                ir::Reg old_block_size = block_size;
                block_size = get_new_reg(lvalue->var_type->type);
                std::unique_ptr<ir::Binary> muldim_instr(new ir::Binary(block_size, BinaryOpEnum::MUL, old_block_size, dim_size));
                ir_bb->instrs.push_back(std::move(loaddim_instr));
                ir_bb->instrs.push_back(std::move(muldim_instr));
            }
        }
        return dst_adr_ptr;
    }

    void visitPromgram(ast::Program * ast_program){
        std::cerr << "visitProgram" << std::endl;
        std::unique_ptr<ir::Program> ir_program(new ir::Program);
        for (auto &i : ast_program->children){
            if (auto child = dynamic_cast<ast::Declaration *>(i.get())){
                visitDeclaration(*child);
            } else if (auto child = dynamic_cast<ast::Function *>(i.get())){
                visitFunction(*child);
            } else {
                assert(false);
            }
        }
    }

    std::vector<int> visit_global_init(ast::Declaration *decl, ast::Expression *exp, int dim_len, int dim, int ele_start){
        std::cerr << "visit_global_init" << std::endl;
        
        int ele_cnt = 0;
        auto assignment = dynamic_cast<ast::Assignment *>(exp);
        std::vector<int> ret_vals;
        assert(assignment);
        if (assignment->value != nullptr) {
            ret_vals.push_back(visitExpressionVal(assignment->value));
            return ret_vals;
        }
        for (auto &i : assignment->values){
            if (auto sub_assignment = dynamic_cast<ast::Assignment *>(i.get())){
                if (sub_assignment->value == nullptr){
                    int sub_dim_len = dim_len / decl->var_type->dim[dim];
                    std::vector<int> sub_vals = visit_global_init(decl, i.get(), sub_dim_len, dim + 1, ele_cnt);
                    ret_vals.insert(ret_vals.end(), sub_vals.begin(), sub_vals.end());
                    ele_cnt += sub_dim_len;
                    continue;
                }
            }
            int init_val = visitExpressionVal(i);
            ret_vals.push_back(init_val);
            ele_cnt ++;
        }
        while (ele_cnt < dim_len){
            ret_vals.push_back(0);
            ele_cnt ++;
        }
        return ret_vals;
    }

    void visitDeclaration(ast::Declaration &declaration){
        ast::Declaration *decl = &declaration;
        // TODO:consider the const val
        if (decl->var_type->is_array){ // 数组
            std::cerr << "visit decl global array" << std::endl;
            for (auto &exp: decl->indices->children) {
                decl->var_type->dim.push_back(visitExpressionVal(exp));
            }
            std::cerr << "global array size: " << decl->var_type->get_array_size() << std::endl;
            std::vector<int> init_vals;
            if (decl->has_init) {
                init_vals = visit_global_init(decl, decl->init_expr.get(), decl->var_type->get_array_size(), 0, 0);
            }
            ir::GlobalDef* globaldef_instr(new ir::GlobalDef(decl->ident->name, *decl->var_type, init_vals, decl->has_init, 1));
            std::string temp_name3 = decl->ident->name;
            ir_program.global_defs.push_back(std::move(globaldef_instr));
            std::string temp_name = decl->ident->name;
            global_var_table.insert(std::move(temp_name));
            Type array_type = *decl->var_type;
            std::string temp_name2 = decl->ident->name;
            var_type_table.insert(std::make_pair<std::string, Type>(std::move(temp_name2), std::move(array_type)));
            std::cerr << "visit decl global array done" << std::endl;
        } else {
            std::cerr << "visit decl global var" << std::endl;
            std::vector<int> init_vals;
            if (decl->has_init) {
                init_vals = visit_global_init(decl, decl->init_expr.get(), decl->var_type->get_array_size(), 0, 0);
            }
            ir::GlobalDef* globaldef_instr(new ir::GlobalDef(decl->ident->name, *decl->var_type, init_vals, decl->has_init, 0));
            std::string temp_name3 = decl->ident->name;
            ir_program.global_defs.push_back(std::move(globaldef_instr));
            global_var_table.insert(decl->ident->name);
            Type var_type = *decl->var_type;
            std::string temp_name2 = decl->ident->name;
            var_type_table.insert(std::make_pair<std::string, Type>(std::move(temp_name2), std::move(var_type)));
            if (decl->is_const){
                std::string temp_name = decl->ident->name;
                const_val_table.insert(std::make_pair<std::string, int>(std::move(temp_name), visitExpressionVal(decl->init_expr)));
            }
            std::cerr << "visit decl global var done" << std::endl;
        }
    }

    void visitFunction(ast::Function &func){
        std::cerr << "visitFunction " << func.ident->name << std::endl;

        reg_num = 0;
        ir::Function ir_function;
        ir_function.name = func.ident->name;
        ir_function.ret_type = *(func.ret_type.get());

        for (auto& i : func.params->children){
            ir_function.param_types.push_back(*(i->var_type.get()));
        }

        std::shared_ptr<ir::BasicBlock> ir_bb(get_new_bb_ptr(&ir_function));
        ir_function.bbs.push_back(ir_bb);

        for (auto &i : func.params->children){
            ir::Reg init_reg = get_new_reg(i->var_type->type);
        }
        int param_id = 0;
        for (auto &i : func.params->children){
            std::cerr << "visitFunction param decl: " << i->ident->name << std::endl;
            ir::Reg init_reg(i->var_type->type, ++param_id);
            if (i->is_array){ // 传入的是数组指针
                std::cerr << "visitFunction param decl array" << std::endl;
                for (auto &exp: i->indices->children) {
                    int dim = visitExpressionVal(exp);
                    if (dim == 0) {
                        dim = 1;
                    }
                    i->var_type->dim.push_back(dim);
                }
                std::string tem_name = i->ident->name;
                ir::Reg temp_reg = init_reg;
                var_ptr_table.insert(std::make_pair<std::string, ir::Reg>(std::move(tem_name), std::move(temp_reg)));
                Type array_type = *i->var_type;
                std::string temp_name2 = i->ident->name;
                var_type_table.insert(std::make_pair<std::string, Type>(std::move(temp_name2), std::move(array_type)));
            } else {
                ir::Reg dst_ptr = get_new_reg(i->var_type->type);
                std::unique_ptr<ir::Alloca> alloca_instr(new ir::Alloca(dst_ptr, *i->var_type ,4));
                alloca_instr->is_local_var = 1;
                ir_bb->instrs.push_back(std::move(alloca_instr));
                var_name_set.insert(i->ident->name);
                std::string tem_name = i->ident->name;
                ir::Reg temp_reg = dst_ptr;
                var_ptr_table.insert(std::make_pair<std::string, ir::Reg>(std::move(tem_name), std::move(temp_reg)));
                Type var_type = *i->var_type;
                std::string temp_name2 = i->ident->name;
                var_type_table.insert(std::make_pair<std::string, Type>(std::move(temp_name2), std::move(var_type)));
                std::unique_ptr<ir::Store> store_instr(new ir::Store(i->var_type->type, init_reg, dst_ptr, i->ident->name));
                store_instr->is_local_var = 1;
                Defs[i->ident->name].insert(ir_bb);
                ir_bb->instrs.push_back(std::move(store_instr));
            }
        }

        visitBlock(*(func.body.get()), ir_bb);

        ir_function.num_regs = reg_num;

        std::cerr << "function " << ir_function.name << " has " << ir_function.num_regs << " regs" << std::endl;

        CFGbuilder cfg_builder(&ir_function);
        cfg_builder.CFG_build();
        cfg_builder.CFG_print(std::cerr, 0);
        cfg_builder.remove_unreachable_bb();
        cfg_builder.CFG_print(std::cerr, 0);
        cfg_builder.build_dominator_tree();
        cfg_builder.compute_dom_fro();
        cfg_builder.dom_tree_print(std::cerr, 0);
        cfg_builder.dom_fro_print(std::cerr, 0);

        std::string temp_name = func.ident->name;
        ir_program.functions.insert(std::make_pair<std::string, ir::Function>(std::move(temp_name), std::move(ir_function)));
    }

    int visitBinaryVal(BinaryOpEnum binaryop, int lhs, int rhs) {
        switch (binaryop)
        {
        case BinaryOpEnum::ADD:
            return lhs + rhs;
            break;
        case BinaryOpEnum::SUB:
            return lhs - rhs;
            break;
        case BinaryOpEnum::MUL:
            return lhs * rhs;
            break;
        case BinaryOpEnum::DIV:
            return lhs * rhs;
            break;
        case BinaryOpEnum::MOD:
            return lhs % rhs;
            break;
        case BinaryOpEnum::AND:
            return lhs & rhs;
            break;
        case BinaryOpEnum::OR:
            return lhs | rhs;
            break;
        case BinaryOpEnum::XOR:
            return lhs ^ rhs;
            break;
        case BinaryOpEnum::SGT:
            return lhs > rhs;
            break;
        case BinaryOpEnum::SLT:
            return lhs < rhs;
            break;
        case BinaryOpEnum::SGE:
            return lhs >= rhs;
            break;
        case BinaryOpEnum::SLE:
            return lhs <= rhs;
            break;
        case BinaryOpEnum::EQ:
            return lhs == rhs;
            break;
        case BinaryOpEnum::NE:
            return lhs != rhs;
            break;
        case BinaryOpEnum::SHL:
            return lhs << rhs;
            break;
        default: // TODO:no support for shr
            assert(false);
            return -1;
            break;
        }
    }

    int visitExpressionVal(std::unique_ptr<ast::Expression> &expr){ // only int type (for decl of array type)
        std::cerr << "visitExpressionVal" << std::endl;

        if (auto binary = dynamic_cast<ast::Binary *>(expr.get())){
            int lhs = visitExpressionVal(binary->lhs);
            int rhs = visitExpressionVal(binary->rhs);
            int dst = visitBinaryVal(static_cast<BinaryOpEnum>(binary->op->binary_op_type), lhs, rhs);
            return dst;
        }
        else if (auto unary = dynamic_cast<ast::Unary *>(expr.get())){
            int oprand = visitExpressionVal(unary->oprand);
            if (unary->op->unary_op_type == static_cast<int>(UnaryOpEnum::POS)){
                return oprand;
            }
            else if (unary->op->unary_op_type == static_cast<int>(UnaryOpEnum::NEG)){
                return -oprand;
            }
            else if (unary->op->unary_op_type == static_cast<int>(UnaryOpEnum::NOT)){
                return oprand == 0;
            }
            else {
                assert(false);
            }
        }
        else if (auto intliteral = dynamic_cast<ast::IntLiteral *>(expr.get())){
            return intliteral->value;
        }
        else if (auto assignment = dynamic_cast<ast::Assignment *>(expr.get())){
            return visitExpressionVal(assignment->value);
        }
        else if (auto lvalue = dynamic_cast<ast::LValue *>(expr.get())){ // TODO:consider the case of const array
            std::string name = lvalue->ident->name;
            int ret = const_val_table[name];
            return ret;
        }
        // else if (auto call = dynamic_cast<ast::Call *>(expr.get())){ // no case of func call
        //     std::string name = call->ident->name;
        //     Type ret_type = ir_program.functions[name].ret_type;
        //     ir::Reg ret = get_new_reg(ret_type.type);
        //     std::vector<ir::Reg> params;
        //     for (auto &i : call->argument_list->children) {
        //         params.push_back(visitExpression(i, ir_bb));
        //     }
        //     std::unique_ptr<ir::Call> call_instr(new ir::Call(ret, name, std::move(params)));
        //     ir_bb->instrs.push_back(std::move(call_instr));
        //     return ret;
        // }
        else{
            expr->print(std::cerr,0);
            assert(false);
        }
    }

    ir::Reg visitExpression(std::unique_ptr<ast::Expression> &expr, std::shared_ptr<ir::BasicBlock> &ir_bb){
        std::cerr << "visitExpression" << std::endl;

        if (auto binary = dynamic_cast<ast::Binary *>(expr.get())){
            ir::Reg lhs = visitExpression(binary->lhs, ir_bb);
            ir::Reg rhs = visitExpression(binary->rhs, ir_bb);
            ir::Reg dst = get_new_reg(lhs.type); // TODO: change of type
            std::unique_ptr<ir::Binary> add_instr(new ir::Binary(dst, static_cast<BinaryOpEnum>(binary->op->binary_op_type), lhs, rhs));
            ir_bb->instrs.push_back(std::move(add_instr));
            return dst;
        }
        else if (auto unary = dynamic_cast<ast::Unary *>(expr.get())){
            ir::Reg oprand = visitExpression(unary->oprand, ir_bb);
            if (unary->op->unary_op_type == static_cast<int>(UnaryOpEnum::POS)){
                return oprand;
            }
            else if (unary->op->unary_op_type == static_cast<int>(UnaryOpEnum::NEG)){
                ir::Reg dst = get_new_reg(oprand.type); // TODO: change of type
                ir::Reg zero = get_new_reg(static_cast<int>(TypeEnum::INT)); // TODO: float.
                std::unique_ptr<ir::LoadInt> loadint_instr(new ir::LoadInt(zero, 0));
                ir_bb->instrs.push_back(std::move(loadint_instr));
                std::unique_ptr<ir::Binary> sub_instr(new ir::Binary(dst, BinaryOpEnum::SUB, zero, oprand));
                ir_bb->instrs.push_back(std::move(sub_instr));
                return dst;
            }
            else if (unary->op->unary_op_type == static_cast<int>(UnaryOpEnum::NOT)){
                ir::Reg dst = get_new_reg(oprand.type); // TODO: change of type
                ir::Reg zero = get_new_reg(static_cast<int>(TypeEnum::INT)); // TODO: float.
                std::unique_ptr<ir::LoadInt> loadint_instr(new ir::LoadInt(zero, 0));
                ir_bb->instrs.push_back(std::move(loadint_instr));
                std::unique_ptr<ir::Binary> eq_instr(new ir::Binary(dst, BinaryOpEnum::EQ, zero, oprand));
                ir_bb->instrs.push_back(std::move(eq_instr));
                return dst;
            }
            else {
                assert(false);
            }
        }
        else if (auto intliteral = dynamic_cast<ast::IntLiteral *>(expr.get())){
            std::cerr << "visitExpressionintliteral" << std::endl;
            ir::Reg ret = get_new_reg(static_cast<int>(TypeEnum::INT));
            std::unique_ptr<ir::LoadInt> loadint_instr(new ir::LoadInt(ret, intliteral->value));
            ir_bb->instrs.push_back(std::move(loadint_instr));
            std::cerr << "visitExpressionintliteral done" << std::endl;
            return ret;
        }
        else if (auto assignment = dynamic_cast<ast::Assignment *>(expr.get())){
            return visitExpression(assignment->value, ir_bb);
        }
        else if (auto lvalue = dynamic_cast<ast::LValue *>(expr.get())){
            std::cerr << "visitExpressionLValue " << lvalue->ident->name << std::endl;
            std::string name = lvalue->ident->name;
            ir::Reg val_ptr;
            if (lvalue->has_index) {
                val_ptr = visitIndex(lvalue, ir_bb);
            } else {
                if (global_var_table.find(name) != global_var_table.end()){
                    val_ptr = get_new_reg(lvalue->var_type->type);
                    std::unique_ptr<ir::LoadAddr> loadaddr_instr(new ir::LoadAddr(val_ptr, name));
                    ir_bb->instrs.push_back(std::move(loadaddr_instr));
                } else {
                    val_ptr = var_ptr_table[name];
                }
            }
            ir::Reg ret;
            if (!lvalue->has_index && var_type_table[name].is_array){
                std::cerr << "visitExpressionLValue array ptr pass" << std::endl;
                ret = val_ptr;
            } else {
                ret = get_new_reg(lvalue->var_type->type);
                std::unique_ptr<ir::Load> load_instr(new ir::Load(ret, lvalue->var_type->type, val_ptr, name));
                if (!lvalue->has_index && global_var_table.find(name) == global_var_table.end()){
                    load_instr->is_local_var = 1;
                }
                ir_bb->instrs.push_back(std::move(load_instr));
            }
            return ret;
        }
        else if (auto call = dynamic_cast<ast::Call *>(expr.get())){
            std::string name = call->ident->name;
            int ret_type;
            if (ir_program.functions.find(name) != ir_program.functions.end()){
                ret_type = ir_program.functions[name].ret_type.type;
            } else {
                ret_type = 1;;
            }
            ir::Reg ret = get_new_reg(ret_type);
            std::vector<ir::Reg> params;
            for (auto &i : call->argument_list->children) {
                params.push_back(visitExpression(i, ir_bb));
            }
            std::unique_ptr<ir::Call> call_instr(new ir::Call(ret, name, std::move(params)));
            ir_bb->instrs.push_back(std::move(call_instr));
            return ret;
        }
        else{
            expr->print(std::cerr,0);
            assert(false);
        }
    }

    void visit_array_init(ast::Declaration *decl, std::shared_ptr<ir::BasicBlock> &ir_bb, ir::Reg dst_ptr, ast::Expression *exp, int dim_len, int dim, int ele_start){
        int ele_cnt = 0;
        auto assignment = dynamic_cast<ast::Assignment *>(exp);
        assert(assignment);
        for (auto &i : assignment->values){
            if (auto sub_assignment = dynamic_cast<ast::Assignment *>(i.get())){
                if (sub_assignment->value == nullptr){
                    int sub_dim_len = dim_len / decl->var_type->dim[dim];
                    visit_array_init(decl, ir_bb, dst_ptr, i.get(), sub_dim_len, dim + 1, ele_cnt);
                    ele_cnt += sub_dim_len;
                    continue;
                }
            }
            ir::Reg init_reg = visitExpression(i, ir_bb);
            ir::Reg dst_adr_ptr = get_new_reg(decl->var_type->type);
            ir::Reg offset = get_new_reg(decl->var_type->type);
            std::unique_ptr<ir::LoadInt> loadint_instr(new ir::LoadInt(offset, (ele_start + ele_cnt++) * 4));
            std::unique_ptr<ir::Binary> add_instr(new ir::Binary(dst_adr_ptr, BinaryOpEnum::ADD, dst_ptr, offset));
            std::unique_ptr<ir::Store> store_instr(new ir::Store(decl->var_type->type, init_reg, dst_adr_ptr, decl->ident->name));
            ir_bb->instrs.push_back(std::move(loadint_instr));
            ir_bb->instrs.push_back(std::move(add_instr));
            ir_bb->instrs.push_back(std::move(store_instr));
        }
        while (ele_cnt < dim_len){
            ir::Reg init_reg = get_new_reg(decl->var_type->type);
            ir::Reg dst_adr_ptr = get_new_reg(decl->var_type->type);
            ir::Reg offset = get_new_reg(decl->var_type->type);
            std::unique_ptr<ir::LoadInt> loadzero_instr(new ir::LoadInt(init_reg, 0));
            std::unique_ptr<ir::LoadInt> loadint_instr(new ir::LoadInt(offset, (ele_start + ele_cnt++) * 4));
            std::unique_ptr<ir::Binary> add_instr(new ir::Binary(dst_adr_ptr, BinaryOpEnum::ADD, dst_ptr, offset));
            std::unique_ptr<ir::Store> store_instr(new ir::Store(decl->var_type->type, init_reg, dst_adr_ptr, decl->ident->name));
            ir_bb->instrs.push_back(std::move(loadzero_instr));
            ir_bb->instrs.push_back(std::move(loadint_instr));
            ir_bb->instrs.push_back(std::move(add_instr));
            ir_bb->instrs.push_back(std::move(store_instr));
        }
    }

    void visitStatement(ast::Statement * statement, std::shared_ptr<ir::BasicBlock> &ir_bb){
        std::cerr << "visitStatement" << std::endl;
        if (auto assign = dynamic_cast<ast::Assign *>(statement)){
            ir::Reg src = visitExpression(assign->expr, ir_bb);
            ir::Reg dst_ptr;
            std::string name = assign->lvalue->ident->name;
            if (global_var_table.find(name) != global_var_table.end()){
                dst_ptr = get_new_reg(assign->lvalue->var_type->type);
                std::unique_ptr<ir::LoadAddr> loadaddr_instr(new ir::LoadAddr(dst_ptr, name));
                ir_bb->instrs.push_back(std::move(loadaddr_instr));
            } else {
                dst_ptr = var_ptr_table[assign->lvalue->ident->name];
            }

            if (assign->lvalue->has_index) { // 数组
                dst_ptr = visitIndex(assign->lvalue.get(), ir_bb);
            }else {
                if (global_var_table.find(name) == global_var_table.end()){
                    Defs[assign->lvalue->ident->name].insert(ir_bb);
                }
            }
            std::unique_ptr<ir::Store> store_instr(new ir::Store(assign->lvalue->var_type->type, src, dst_ptr, assign->lvalue->ident->name));
            if (!assign->lvalue->has_index && global_var_table.find(name) == global_var_table.end()){
                store_instr->is_local_var = 1;
            }
            ir_bb->instrs.push_back(std::move(store_instr));
        }
        else if (auto ret = dynamic_cast<ast::Return *>(statement)){
            ir::Reg ret_val = visitExpression(ret->expr, ir_bb);
            std::unique_ptr<ir::Return> ret_instr(new ir::Return(ret_val));
            ir_bb->instrs.push_back(std::move(ret_instr));
            std::shared_ptr<ir::BasicBlock> ir_new_bb(get_new_bb_ptr(ir_bb->func));
            ir_bb->func->bbs.push_back(ir_new_bb);
            ir_bb = ir_new_bb;
        }
        else if (auto ifelse = dynamic_cast<ast::IfElse *>(statement)){
            std::shared_ptr<ir::BasicBlock> bb_cond(get_new_bb_ptr(ir_bb->func));
            std::unique_ptr<ir::Branch> br_instr(new ir::Branch(bb_cond));
            ir_bb->instrs.push_back(std::move(br_instr));
            ir::Reg cond = visitExpression(ifelse->cond, bb_cond);
            ir_bb->func->bbs.push_back(bb_cond);
            if(auto other = dynamic_cast<ast::Statement *>(ifelse->other.get())){
                std::shared_ptr<ir::BasicBlock> bb_true(get_new_bb_ptr(ir_bb->func));
                std::shared_ptr<ir::BasicBlock> bb_false(get_new_bb_ptr(ir_bb->func));
                std::unique_ptr<ir::CondBranch> condbr_instr(new ir::CondBranch(cond, bb_true, bb_false));
                bb_cond->instrs.push_back(std::move(condbr_instr));

                ir_bb->func->bbs.push_back(bb_true);
                ir_bb->func->bbs.push_back(bb_false);

                std::shared_ptr<ir::BasicBlock> ir_new_bb(get_new_bb_ptr(ir_bb->func));
                ir_bb->func->bbs.push_back(ir_new_bb);
                ir_bb = ir_new_bb;

                auto then = dynamic_cast<ast::Statement *>(ifelse->then.get());
                assert(then);
                visitStatement(then, bb_true);
                std::unique_ptr<ir::Branch> br_true_instr(new ir::Branch(ir_new_bb));
                bb_true->instrs.push_back(std::move(br_true_instr));
                visitStatement(other, bb_false);
                std::unique_ptr<ir::Branch> br_false_instr(new ir::Branch(ir_new_bb));
                bb_false->instrs.push_back(std::move(br_false_instr));
            }
            else {
                std::shared_ptr<ir::BasicBlock> bb_true(get_new_bb_ptr(ir_bb->func));
                ir_bb->func->bbs.push_back(bb_true);

                std::shared_ptr<ir::BasicBlock> ir_new_bb(get_new_bb_ptr(ir_bb->func));
                ir_bb->func->bbs.push_back(ir_new_bb);
                ir_bb = ir_new_bb;

                std::unique_ptr<ir::CondBranch> condbr_instr(new ir::CondBranch(cond, bb_true, ir_new_bb));
                bb_cond->instrs.push_back(std::move(condbr_instr));

                auto then = dynamic_cast<ast::Statement *>(ifelse->then.get());
                assert(then);
                visitStatement(then, bb_true);
                std::unique_ptr<ir::Branch> br_instr(new ir::Branch(ir_new_bb));
                bb_true->instrs.push_back(std::move(br_instr));
            }
        }
        else if (auto whileloop = dynamic_cast<ast::While *>(statement)){
            std::shared_ptr<ir::BasicBlock> bb_cond(get_new_bb_ptr(ir_bb->func));
            std::shared_ptr<ir::BasicBlock> bb_body(get_new_bb_ptr(ir_bb->func));
            std::shared_ptr<ir::BasicBlock> ir_new_bb(get_new_bb_ptr(ir_bb->func));
            ir_bb->func->bbs.push_back(bb_cond);
            ir_bb->func->bbs.push_back(bb_body);
            ir_bb->func->bbs.push_back(ir_new_bb);

            break_to_stack.push_back(ir_new_bb);
            continue_to_stack.push_back(bb_cond);

            std::unique_ptr<ir::Branch> br_instr(new ir::Branch(bb_cond));
            ir_bb->instrs.push_back(std::move(br_instr));
            ir_bb = ir_new_bb;

            ir::Reg cond_reg = visitExpression(whileloop->cond, bb_cond);
            std::unique_ptr<ir::CondBranch> condbr_instr(new ir::CondBranch(cond_reg, bb_body, ir_new_bb));
            bb_cond->instrs.push_back(std::move(condbr_instr));

            auto body = dynamic_cast<ast::Statement *>(whileloop->body.get());
            assert(body);
            visitStatement(body, bb_body);
            std::unique_ptr<ir::Branch> br_back_instr(new ir::Branch(bb_cond));
            bb_body->instrs.push_back(std::move(br_back_instr));

            break_to_stack.pop_back();
            continue_to_stack.pop_back();
        }
        else if (auto break_stmt = dynamic_cast<ast::Break *>(statement)){
            std::unique_ptr<ir::Branch> br_instr(new ir::Branch(break_to_stack.back()));
            ir_bb->instrs.push_back(std::move(br_instr));
            std::shared_ptr<ir::BasicBlock> ir_new_bb(get_new_bb_ptr(ir_bb->func));
            ir_bb->func->bbs.push_back(ir_new_bb);
            ir_bb = ir_new_bb;
        }
        else if (auto continue_stmt = dynamic_cast<ast::Continue *>(statement)){
            std::unique_ptr<ir::Branch> br_instr(new ir::Branch(continue_to_stack.back()));
            ir_bb->instrs.push_back(std::move(br_instr));
            std::shared_ptr<ir::BasicBlock> ir_new_bb(get_new_bb_ptr(ir_bb->func));
            ir_bb->func->bbs.push_back(ir_new_bb);
            ir_bb = ir_new_bb;
        }
        else if (auto block = dynamic_cast<ast::Block *>(statement)){
            visitBlock(*block, ir_bb);
        }
        else if (auto exprstmt = dynamic_cast<ast::ExprStmt *>(statement)){
            visitExpression(exprstmt->expr, ir_bb);
        }
        else {
            assert(false);
        }
    }

    void visitBlock(const ast::Block &block, std::shared_ptr<ir::BasicBlock> &ir_bb){
        std::cerr << "visitBlock " << std::endl;

        for (auto &child : block.children){
            if (auto stmt = dynamic_cast<ast::Statement *>(child.get())){
                visitStatement(stmt, ir_bb);
            }
            else if (auto decl = dynamic_cast<ast::Declaration *>(child.get())){ // TODO:consider the const val
                ir::Reg dst_ptr = get_new_reg(decl->var_type->type);
                if (decl->var_type->is_array){ // 数组
                    std::cerr << "visit decl array" << std::endl;
                    for (auto &exp: decl->indices->children) {
                        decl->var_type->dim.push_back(visitExpressionVal(exp));
                    }
                    std::unique_ptr<ir::Alloca> alloca_instr(new ir::Alloca(dst_ptr, *decl->var_type, decl->var_type->get_size()));
                    ir_bb->instrs.push_back(std::move(alloca_instr));
                    std::string temp_name = decl->ident->name;
                    ir::Reg temp_reg = dst_ptr;
                    var_ptr_table.insert(std::make_pair<std::string, ir::Reg>(std::move(temp_name), std::move(temp_reg)));
                    Type array_type = *decl->var_type;
                    std::string temp_name2 = decl->ident->name;
                    var_type_table.insert(std::make_pair<std::string, Type>(std::move(temp_name2), std::move(array_type)));
                    if (decl->has_init){
                        visit_array_init(decl, ir_bb, dst_ptr, decl->init_expr.get(), decl->var_type->get_array_size(), 0, 0);
                    }
                    std::cerr << "visit decl array store type done " << decl->ident->name << " " << var_type_table[decl->ident->name].is_array << std::endl;
                    std::cerr << "visit decl array done" << std::endl;
                } else {
                    std::unique_ptr<ir::Alloca> alloca_instr(new ir::Alloca(dst_ptr, *decl->var_type ,4));
                    alloca_instr->is_local_var = 1;
                    ir_bb->instrs.push_back(std::move(alloca_instr));
                    var_name_set.insert(decl->ident->name);
                    std::string temp_name = decl->ident->name;
                    ir::Reg temp_reg = dst_ptr;
                    var_ptr_table.insert(std::make_pair<std::string, ir::Reg>(std::move(temp_name), std::move(temp_reg)));
                    Type var_type = *decl->var_type;
                    std::string temp_name2 = decl->ident->name;
                    var_type_table.insert(std::make_pair<std::string, Type>(std::move(temp_name2), std::move(var_type)));
                    if (decl->has_init){
                        ir::Reg init_reg = visitExpression(decl->init_expr, ir_bb);
                        std::unique_ptr<ir::Store> store_instr(new ir::Store(decl->var_type->type, init_reg, dst_ptr, decl->ident->name));
                        store_instr->is_local_var = 1;
                        Defs[decl->ident->name].insert(ir_bb);
                        ir_bb->instrs.push_back(std::move(store_instr));
                    }
                    if (decl->is_const){
                        std::string temp_name = decl->ident->name;
                        const_val_table.insert(std::make_pair<std::string, int>(std::move(temp_name), visitExpressionVal(decl->init_expr)));
                    }
                }
            }
            else {
                assert(false);
            }
        }
    }
};