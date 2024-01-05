#include "iroptimizer.hpp"

void IROptimizer::visit_rename_regs(std::shared_ptr<ir::BasicBlock> ir_bb)
{
    int test_id = 0;
    ir_bb->visited = 1;
    std::vector<std::pair<std::string, ir::Reg>> restore_stack;
    for (auto it = ir_bb->instrs.begin(); it != ir_bb->instrs.end();)
    {
        auto &instr = *it;
        if (auto alloca = dynamic_cast<ir::Alloca *>(instr.get()))
        {
            if (!alloca->is_local_var)
            {
                it++;
                continue;
            }
            it = ir_bb->instrs.erase(it);
        }
        else if (auto load = dynamic_cast<ir::Load *>(instr.get()))
        {
            if (!load->is_local_var)
            {
                it++;
                continue;
            }
            ir::Reg used = load->ret_val;
            std::string name = load->var_name;
            ir::Reg new_used = reaching_def[name];
            for (auto later = it; later != ir_bb->instrs.end(); later++)
            {
                auto &later_instr = *later;
                if (auto store = dynamic_cast<ir::Store *>(later_instr.get()))
                {
                    if (store->ptr.id == used.id)
                    {
                        store->ptr = new_used;
                    }
                    if (store->src_val.id == used.id)
                    {
                        store->src_val = new_used;
                    }
                }
                else if (auto load = dynamic_cast<ir::Load *>(later_instr.get()))
                {
                    if (load->ptr.id == used.id)
                    {
                        load->ptr = new_used;
                    }
                }
                else if (auto binary = dynamic_cast<ir::Binary *>(later_instr.get()))
                {
                    if (binary->src1.id == used.id)
                    {
                        binary->src1 = new_used;
                    }
                    if (binary->src2.id == used.id)
                    {
                        binary->src2 = new_used;
                    }
                }
                else if (auto assign = dynamic_cast<ir::Assign *>(later_instr.get()))
                {
                    if (assign->src.id == used.id)
                    {
                        assign->src = new_used;
                    }
                }
                else if (auto ret = dynamic_cast<ir::Return *>(later_instr.get()))
                {
                    if (ret->ret_val.id == used.id)
                    {
                        ret->ret_val = new_used;
                    }
                }
                else if (auto call = dynamic_cast<ir::Call *>(later_instr.get()))
                {
                    for (int i = 0; i < call->params.size(); i++)
                    {
                        if (call->params[i].id == used.id)
                        {
                            call->params[i] = new_used;
                        }
                    }
                }
                else if (auto condbranch = dynamic_cast<ir::CondBranch *>(later_instr.get()))
                {
                    if (condbranch->cond.id == used.id)
                    {
                        condbranch->cond = new_used;
                    }
                }
            }
            it = ir_bb->instrs.erase(it);
        }
        else if (auto store = dynamic_cast<ir::Store *>(instr.get()))
        {
            if (!store->is_local_var)
            {
                it++;
                continue;
            }
            std::string res_name = store->var_name;
            ir::Reg res_reg;
            if (reaching_def.find(store->var_name) == reaching_def.end())
            {
                res_reg = ir::Reg(1, -1);
            }
            else
            {
                res_reg = reaching_def[store->var_name];
            }
            restore_stack.push_back(std::make_pair<std::string, ir::Reg>(std::move(res_name), std::move(res_reg)));
            reaching_def[store->var_name] = store->src_val;
            it = ir_bb->instrs.erase(it);
        }
        else
        {
            it++;
        }
    }
    for (auto it = ir_bb->instrs.begin(); it != ir_bb->instrs.end(); it++)
    {
        auto &instr = *it;
        if (auto phi = dynamic_cast<ir::Phi *>(instr.get()))
        {
            std::string name = phi->var_name;
            ir::Reg used = reaching_def[name];
            ir::Reg new_used = phi->dst;

            std::string res_name = phi->var_name;
            ir::Reg res_reg;
            if (reaching_def.find(phi->var_name) == reaching_def.end())
            {
                res_reg = ir::Reg(1, -1);
            }
            else
            {
                res_reg = reaching_def[phi->var_name];
            }
            restore_stack.push_back(std::make_pair<std::string, ir::Reg>(std::move(res_name), std::move(res_reg)));
            reaching_def[phi->var_name] = phi->dst;
            for (auto later = it; later != ir_bb->instrs.end(); later++)
            {
                auto &later_instr = *later;
                if (auto store = dynamic_cast<ir::Store *>(later_instr.get()))
                {
                    if (store->ptr.id == used.id)
                    {
                        store->ptr = new_used;
                    }
                    if (store->src_val.id == used.id)
                    {
                        store->src_val = new_used;
                    }
                }
                else if (auto load = dynamic_cast<ir::Load *>(later_instr.get()))
                {
                    if (load->ptr.id == used.id)
                    {
                        load->ptr = new_used;
                    }
                }
                else if (auto binary = dynamic_cast<ir::Binary *>(later_instr.get()))
                {
                    if (binary->src1.id == used.id)
                    {
                        binary->src1 = new_used;
                    }
                    if (binary->src2.id == used.id)
                    {
                        binary->src2 = new_used;
                    }
                }
                else if (auto assign = dynamic_cast<ir::Assign *>(later_instr.get()))
                {
                    if (assign->src.id == used.id)
                    {
                        assign->src = new_used;
                    }
                }
                else if (auto ret = dynamic_cast<ir::Return *>(later_instr.get()))
                {
                    if (ret->ret_val.id == used.id)
                    {
                        ret->ret_val = new_used;
                    }
                }
                else if (auto call = dynamic_cast<ir::Call *>(later_instr.get()))
                {
                    for (auto &param : call->params)
                    {
                        if (param.id == used.id)
                        {
                            param = new_used;
                        }
                    }
                }
                else if (auto condbranch = dynamic_cast<ir::CondBranch *>(later_instr.get()))
                {
                    if (condbranch->cond.id == used.id)
                    {
                        condbranch->cond = new_used;
                    }
                }
            }
        }
        else
        {
            break;
        }
    }

    for (auto succ : ir_bb->succs)
    {
        for (auto &instr : succ->instrs)
        {
            if (auto phi = dynamic_cast<ir::Phi *>(instr.get()))
            {
                if (reaching_def.find(phi->var_name) == reaching_def.end())
                {
                    // ir::Reg temp_reg = ir::Reg(1, 1);
                    // std::shared_ptr<ir::BasicBlock> temp_bb = ir_bb;
                    // phi->srcs.push_back(std::make_pair<ir::Reg, std::shared_ptr<ir::BasicBlock>>(std::move(temp_reg), std::move(temp_bb)));

                    continue;
                }
                ir::Reg temp_reg = reaching_def[phi->var_name];
                std::shared_ptr<ir::BasicBlock> temp_bb = ir_bb;
                phi->srcs.push_back(std::make_pair<ir::Reg, std::shared_ptr<ir::BasicBlock>>(std::move(temp_reg), std::move(temp_bb)));
            }
            else
            {
                break;
            }
        }
    }
    for (auto domto : ir_bb->doms)
    {
        if (!domto->visited)
        {
            visit_rename_regs(domto);
        }
    }
    for (auto rit = restore_stack.rbegin(); rit != restore_stack.rend(); rit++)
    {
        if (rit->second.id == -1)
        {
            reaching_def.erase(rit->first);
        }
        else
        {
            reaching_def[rit->first] = rit->second;
        }
    }
}

void IROptimizer::mem_to_reg()
{
    for (std::string var_name : ir_generator->var_name_set)
    {
        std::set<std::shared_ptr<ir::BasicBlock>> F;
        std::set<std::shared_ptr<ir::BasicBlock>> W;
        F.clear();
        W.clear();
        for (auto d : ir_generator->Defs[var_name])
        {
            W.insert(d);
        }
        while (W.size() > 0)
        {
            std::shared_ptr<ir::BasicBlock> X = *W.begin();
            W.erase(X);
            for (auto Y : X->DF)
            {
                if (F.find(Y) == F.end())
                {
                    std::unique_ptr<ir::Phi> Phi_instr(new ir::Phi(ir_generator->var_type_table[var_name], var_name));
                    Phi_instr->dst = Y->func->get_new_reg(ir_generator->var_type_table[var_name].type);
                    Y->instrs.push_front(std::move(Phi_instr));
                    F.insert(Y);
                    if (ir_generator->Defs[var_name].find(Y) == ir_generator->Defs[var_name].end())
                    {
                        W.insert(Y);
                    }
                }
            }
        }
    }

    for (auto func : ir_generator->ir_program.functions)
    {
        for (auto bb : func.second.bbs)
        {
            bb->visited = 0;
        }
        visit_rename_regs(func.second.bbs.front());
    }

    // for (auto func: ir_generator->ir_program.functions) {
    //     for (auto bb : func.second.bbs) {
    //         std::list<ir::Assign*> changed_phi;
    //         for (auto it = bb->instrs.begin(); it != bb->instrs.end();)
    //         {
    //             auto &instr = *it;
    //             if (auto phi = dynamic_cast<ir::Phi *>(instr.get()))
    //             {
    //                 if (phi->srcs.size() == 1) {
    //                     ir::Assign* assign_instr(new ir::Assign(phi->dst, phi->srcs[0].first));
    //                     changed_phi.push_back(std::move(assign_instr));
    //                     it = bb->instrs.erase(it);
    //                 } else {
    //                     it ++;
    //                 }
    //             }
    //             else
    //             {
    //                 bb->instrs.insert(it, changed_phi.begin(), changed_phi.end());
    //                 break;
    //             }
    //         }
    //     }
    // }
}