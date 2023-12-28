#pragma once

#include "../common/common.hpp"

#include "../common/ir.hpp"

#include "../frontend/ast/tree.hpp"
#include "../frontend/ast/astVisitor.hpp"
#include "../frontend/IR/CFGbuilder.hpp"

#include "../frontend/IR/irgenerator.hpp"

class IROptimizer{
public:
    IRGenerator *ir_generator;
    std::unordered_map<std::string, ir::Reg> reaching_def;

    IROptimizer(IRGenerator *ir_generator) : ir_generator(ir_generator){}

    void visit_rename_regs(std::shared_ptr<ir::BasicBlock> ir_bb){
    int test_id = 0;
        ir_bb->visited = 1;
        std::vector<std::pair<std::string, ir::Reg>> restore_stack;
        for (auto it = ir_bb->instrs.begin(); it != ir_bb->instrs.end();){
            auto &instr = *it;
            if (auto alloca = dynamic_cast<ir::Alloca *>(instr.get())){
                if (!alloca->is_local_var){
                    it ++;
                    continue;
                }
                it = ir_bb->instrs.erase(it);
            }
            else if (auto load = dynamic_cast<ir::Load *>(instr.get())){
                if (!load->is_local_var){
                    it ++;
                    continue;
                }
                ir::Reg used = load->ret_val;
                std::string name = load->var_name;
                ir::Reg new_used = reaching_def[name];
                for (auto later = it; later != ir_bb->instrs.end(); later ++){
                    auto &later_instr = *later;
                    if (auto store = dynamic_cast<ir::Store *>(later_instr.get())){
                        if (store->ptr.id == used.id){
                            store->ptr = new_used;
                        }
                        if (store->src_val.id == used.id){
                            store->src_val = new_used;
                        }
                    }
                    else if (auto load = dynamic_cast<ir::Load *>(later_instr.get())){
                        if (load->ptr.id == used.id){
                            load->ptr = new_used;
                        }
                    }
                    else if (auto binary = dynamic_cast<ir::Binary *>(later_instr.get())){
                        if (binary->src1.id == used.id){
                            binary->src1 = new_used;
                        }
                        if (binary->src2.id == used.id){
                            binary->src2 = new_used;
                        }
                    }
                    else if (auto assign = dynamic_cast<ir::Assign *>(later_instr.get())){
                        if (assign->src.id == used.id){
                            assign->src = new_used;
                        }
                    }
                    else if (auto ret = dynamic_cast<ir::Return *>(later_instr.get())){
                        if (ret->ret_val.id == used.id){
                            ret->ret_val = new_used;
                        }
                    }
                    else if (auto call = dynamic_cast<ir::Call *>(later_instr.get())){
                        for (auto &param : call->params){
                            if (param.id == used.id){
                                param = new_used;
                            }
                        }
                    }
                    else if (auto condbranch = dynamic_cast<ir::CondBranch *>(later_instr.get())){
                        if (condbranch->cond.id == used.id){
                            condbranch->cond = new_used;
                        }
                    }
                }
                it = ir_bb->instrs.erase(it);
            }
            else if (auto store = dynamic_cast<ir::Store *>(instr.get())){
                if (!store->is_local_var){
                    it ++;
                    continue;
                }
                std::string res_name = store->var_name;
                ir::Reg res_reg = reaching_def[store->var_name];
                restore_stack.push_back(std::make_pair<std::string, ir::Reg>(std::move(res_name), std::move(res_reg)));
                reaching_def[store->var_name] = store->src_val;
                it = ir_bb->instrs.erase(it);
            }
            else {
                it ++;
            }
        }
        for (auto it = ir_bb->instrs.begin(); it != ir_bb->instrs.end(); it ++){
            auto &instr = *it;
            if (auto phi = dynamic_cast<ir::Phi *>(instr.get())){
                std::string name = phi->var_name;
                ir::Reg used = reaching_def[name];
                ir::Reg new_used = ir_generator->get_new_reg(used.type);
                phi->dst = new_used;
                
                std::string res_name = phi->var_name;
                ir::Reg res_reg = reaching_def[phi->var_name];
                restore_stack.push_back(std::make_pair<std::string, ir::Reg>(std::move(res_name), std::move(res_reg)));
                reaching_def[phi->var_name] = phi->dst;
                for (auto later = it; later != ir_bb->instrs.end(); later ++){
                    auto &later_instr = *later;
                    if (auto store = dynamic_cast<ir::Store *>(later_instr.get())){
                        if (store->ptr.id == used.id){
                            store->ptr = new_used;
                        }
                        if (store->src_val.id == used.id){
                            store->src_val = new_used;
                        }
                    }
                    else if (auto load = dynamic_cast<ir::Load *>(later_instr.get())){
                        if (load->ptr.id == used.id){
                            load->ptr = new_used;
                        }
                    }
                    else if (auto binary = dynamic_cast<ir::Binary *>(later_instr.get())){
                        if (binary->src1.id == used.id){
                            binary->src1 = new_used;
                        }
                        if (binary->src2.id == used.id){
                            binary->src2 = new_used;
                        }
                    }
                    else if (auto assign = dynamic_cast<ir::Assign *>(later_instr.get())){
                        if (assign->src.id == used.id){
                            assign->src = new_used;
                        }
                    }
                    else if (auto ret = dynamic_cast<ir::Return *>(later_instr.get())){
                        if (ret->ret_val.id == used.id){
                            ret->ret_val = new_used;
                        }
                    }
                    else if (auto call = dynamic_cast<ir::Call *>(later_instr.get())){
                        for (auto &param : call->params){
                            if (param.id == used.id){
                                param = new_used;
                            }
                        }
                    }
                    else if (auto condbranch = dynamic_cast<ir::CondBranch *>(later_instr.get())){
                        if (condbranch->cond.id == used.id){
                            condbranch->cond = new_used;
                        }
                    }
                }
            }
            else {
                break;
            }
        }
        for (auto succ : ir_bb->succs){
            for (auto &instr : succ->instrs){
                if (auto phi = dynamic_cast<ir::Phi *>(instr.get())){
                    ir::Reg temp_reg = reaching_def[phi->var_name];
                    std::shared_ptr<ir::BasicBlock> temp_bb = ir_bb;
                    phi->srcs.push_back(std::make_pair<ir::Reg, std::shared_ptr<ir::BasicBlock>>(std::move(temp_reg), std::move(temp_bb)));
                }else {
                    break;
                }
            }
        }
        for (auto domto : ir_bb->doms){
            if (!domto->visited){
                visit_rename_regs(domto);
            }
        }
        for (auto rit = restore_stack.rbegin(); rit != restore_stack.rend(); rit ++){
            reaching_def[rit->first] = rit->second;
        }
    }

    void mem_to_reg(){
        for (std::string var_name : ir_generator->var_name_set){
            std::set<std::shared_ptr<ir::BasicBlock>> F;
            std::set<std::shared_ptr<ir::BasicBlock>> W;
            for (auto d : ir_generator->Defs[var_name]){
                W.insert(d);
            }
            while (W.size() > 0){
                std::shared_ptr<ir::BasicBlock> X = *W.begin();
                W.erase(X);
                for (auto Y : X->DF){
                    if (F.find(Y) == F.end()){
                        std::unique_ptr<ir::Phi> Phi_instr(new ir::Phi(ir_generator->var_type_table[var_name], var_name));
                        Y->instrs.push_front(std::move(Phi_instr));
                        F.insert(Y);
                        if (X->DF.find(Y) == X->DF.end()){
                            W.insert(Y);
                        }
                    }
                }
            }
        }

        for (auto func : ir_generator->ir_program.functions){
            for (auto bb : func.second.bbs){
                bb->visited = 0;
            }
            visit_rename_regs(func.second.bbs.front());
        }
    }

    void dead_code_elimination() {
        for (auto &func : ir_generator->ir_program.functions) {
            // dead variable declaration
            std::list<int> dead_vars;
            for (auto &bb : func.second.bbs) {
                for (auto &inst : bb.get()->instrs) {
                    if (auto alloca = dynamic_cast<ir::Alloca*>(inst.get())) {
                        if (alloca->is_local_var) {
                            dead_vars.push_back(alloca->ret_val.id);
                        }
                    } else if (auto phi = dynamic_cast<ir::Phi*>(inst.get())) { // Phi
                        // search dst in dead_vars
                        auto it = std::find(dead_vars.begin(), dead_vars.end(), phi->dst.id);
                        if (it != dead_vars.end()) {
                            dead_vars.erase(it);
                        }
                        for (auto src : phi->srcs) {
                            auto it = std::find(dead_vars.begin(), dead_vars.end(), src.first.id);
                            if (it != dead_vars.end()) {
                                dead_vars.erase(it);
                            }
                        }
                    } else if (auto loadaddr = dynamic_cast<ir::LoadAddr*>(inst.get())) { // LoadAddr
                        auto it = std::find(dead_vars.begin(), dead_vars.end(), loadaddr->ret_val.id);
                        if (it != dead_vars.end()) {
                            dead_vars.erase(it);
                        }
                    } else if (auto store = dynamic_cast<ir::Store*>(inst.get())) { // Store
                        auto it = std::find(dead_vars.begin(), dead_vars.end(), store->src_val.id);
                        if (it != dead_vars.end()) {
                            dead_vars.erase(it);
                        }
                    } else if (auto binary = dynamic_cast<ir::Binary*>(inst.get())) { // Binary
                        auto it = std::find(dead_vars.begin(), dead_vars.end(), binary->dst.id);
                        if (it != dead_vars.end()) {
                            dead_vars.erase(it);
                        }
                        auto it1 = std::find(dead_vars.begin(), dead_vars.end(), binary->src1.id);
                        if (it1 != dead_vars.end()) {
                            dead_vars.erase(it1);
                        }
                        auto it2 = std::find(dead_vars.begin(), dead_vars.end(), binary->src2.id);
                        if (it2 != dead_vars.end()) {
                            dead_vars.erase(it2);
                        }
                    } else if (auto assign = dynamic_cast<ir::Assign*>(inst.get())) { // Assign
                        auto it = std::find(dead_vars.begin(), dead_vars.end(), assign->dst.id);
                        if (it != dead_vars.end()) {
                            dead_vars.erase(it);
                        }
                        auto it1 = std::find(dead_vars.begin(), dead_vars.end(), assign->src.id);
                        if (it1 != dead_vars.end()) {
                            dead_vars.erase(it1);
                        }
                    } else if (auto ret = dynamic_cast<ir::Return*>(inst.get())) { // Return
                        auto it = std::find(dead_vars.begin(), dead_vars.end(), ret->ret_val.id);
                        if (it != dead_vars.end()) {
                            dead_vars.erase(it);
                        }
                    }
                } 
            }

            for (auto &bb : func.second.bbs) {
                for (auto it = bb.get()->instrs.begin(); it != bb.get()->instrs.end();) {
                    auto &instr = *it;
                    if (auto assign = dynamic_cast<ir::Assign*>(instr.get())) {
                        auto it1 = std::find(dead_vars.begin(), dead_vars.end(), assign->dst.id);
                        if (it1 != dead_vars.end()) {
                            it = bb.get()->instrs.erase(it);
                        } else {
                            it++;
                        }
                    }
                }   
            }
        }
    }
};