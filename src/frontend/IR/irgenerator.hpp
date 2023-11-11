#pragma once

#include "../../common/common.hpp"

#include "../../common/ir.hpp"

#include "../ast/tree.hpp"
#include "../ast/astVisitor.hpp"

class IRGenerator{
public:
    ir::Program ir_program;
    int reg_num = 0;

    std::unordered_map<std::string, ir::Reg> var_table;

    ir::Reg get_new_reg(int type){
        return ir::Reg(type, ++reg_num);
    }

    void visitPromgram(ast::Program * ast_program){
        std::cout << "visitProgram" << std::endl;

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

    void visitDeclaration(ast::Declaration &decl){
//TODO
    }

    void visitFunction(ast::Function &func){
        std::cout << "visitFunction " << func.ident->name << std::endl;

        reg_num = 0;
        ir::Function ir_function;
        ir_function.name = func.ident->name;
        ir_function.ret_type = *(func.ret_type.get());

        for (auto& i : func.params->children){
            ir_function.param_types.push_back(*(i->var_type.get()));
        }

        ir_function.instrs.push_back(std::unique_ptr<ir::Mark>(new ir::Mark(ir_function.name)));
        visitBlock(*(func.body.get()), ir_function);

        ir_program.functions.insert(std::make_pair<std::string, ir::Function>(std::move(func.ident->name), std::move(ir_function)));
    }

    ir::Reg visitExpression(std::unique_ptr<ast::Expression> &expr, ir::Function &ir_function){
        if (auto binary = dynamic_cast<ast::Binary *>(expr.get())){
            ir::Reg lhs = visitExpression(binary->lhs, ir_function);
            ir::Reg rhs = visitExpression(binary->rhs, ir_function);
            ir::Reg dst = get_new_reg(lhs.type); // TODO: change of type
            std::unique_ptr<ir::Binary> add_instr(new ir::Binary(dst, static_cast<BinaryOpEnum>(binary->op->binary_op_type), lhs, rhs));
            ir_function.instrs.push_back(std::move(add_instr));
            return dst;
            // switch(binary->op->binary_op_type){
            // case static_cast<int>(BinaryOpEnum::ADD):{
            //     break;
            // }
            // case static_cast<int>(BinaryOpEnum::SUB):
            //     break;
            // case static_cast<int>(BinaryOpEnum::MUL):
            //     break;
            // case static_cast<int>(BinaryOpEnum::DIV):
            //     break;
            // case static_cast<int>(BinaryOpEnum::MOD):
            //     break;
            // case static_cast<int>(BinaryOpEnum::AND):
            //     break;
            // case static_cast<int>(BinaryOpEnum::OR):
            //     break;
            // case static_cast<int>(BinaryOpEnum::SGT):
            //     break;
            // case static_cast<int>(BinaryOpEnum::SLT):
            //     break;
            // case static_cast<int>(BinaryOpEnum::SGE):
            //     break;
            // case static_cast<int>(BinaryOpEnum::SLE):
            //     break;
            // case static_cast<int>(BinaryOpEnum::EQ):
            //     break;
            // case static_cast<int>(BinaryOpEnum::NE):
            //     break;
            // default:
            //     assert(false);
            //     break;
            // }
        }
        else if (auto intliteral = dynamic_cast<ast::IntLiteral *>(expr.get())){
            ir::Reg ret = get_new_reg(static_cast<int>(TypeEnum::INT));
            std::unique_ptr<ir::LoadInt> loadint_instr(new ir::LoadInt(ret, intliteral->value));
            ir_function.instrs.push_back(std::move(loadint_instr));
            return ret;
        }
        else if (auto assignment = dynamic_cast<ast::Assignment *>(expr.get())){
            return visitExpression(assignment->value, ir_function);
        }
        else if (auto lvalue = dynamic_cast<ast::LValue *>(expr.get())){
            std::string name = lvalue->ident->name;
            ir::Reg ret = var_table[name];
            return ret;
        }
        else{
            expr->print(std::cout,0);
            assert(false);
        }
    }

    ir::Reg visitLValue(std::unique_ptr<ast::LValue> &lvalue){
        std::string name = lvalue->ident->name;
        int type = lvalue->var_type->type;
        ir::Reg ret = get_new_reg(type);
        var_table[name] = ret;
        return ret;
    }

    void visitBlock(const ast::Block &block, ir::Function &ir_function){
        std::cout << "visitBlock " << std::endl;

        for (auto &child : block.children){
            if (auto stmt = dynamic_cast<ast::Statement *>(child.get())){
                if (auto assign = dynamic_cast<ast::Assign *>(child.get())){
                    ir::Reg dst = visitLValue(assign->lvalue);
                    ir::Reg src = visitExpression(assign->expr, ir_function);
                    std::unique_ptr<ir::Assign> assign_instr(new ir::Assign(dst, src));
                    ir_function.instrs.push_back(std::move(assign_instr));
                }
                else if (auto ret = dynamic_cast<ast::Return *>(child.get())){
                    ir::Reg ret_val = visitExpression(ret->expr, ir_function);
                    std::unique_ptr<ir::Return> ret_instr(new ir::Return(ret_val));
                    ir_function.instrs.push_back(std::move(ret_instr));
                }
            }
            else if (auto decl = dynamic_cast<ast::Declaration *>(child.get())){
                ir::Reg dst = get_new_reg(decl->var_type->type);
                var_table.insert(std::make_pair<std::string, ir::Reg>(std::move(decl->ident->name), std::move(dst)));
                if (decl->has_init){
                    ir::Reg init_reg = visitExpression(decl->init_expr, ir_function);
                    std::unique_ptr<ir::Assign> assign_instr(new ir::Assign(dst, init_reg));
                    ir_function.instrs.push_back(std::move(assign_instr));
                }
            }
        }
    }
};