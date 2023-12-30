#include "iroptimizer.hpp"

void IROptimizer::dead_code_elimination()
{
    for (auto &func : ir_generator->ir_program.functions)
    {
        std::cerr << func.first << std::endl;
        // dead variable declaration
        std::list<int> dead_vars;
        for (auto &bb : func.second.bbs)
        {
            std::cerr << "B" << bb.get()->label.label_id << std::endl;
            for (auto &inst : bb.get()->instrs)
            {
                if (auto loadint = dynamic_cast<ir::LoadInt *>(inst.get()))
                { // LoadInt
                    dead_vars.push_back(loadint->dst.id);
                    std::cerr << "LoadInt" << std::endl;
                }
                else if (auto alloca = dynamic_cast<ir::Alloca *>(inst.get()))
                { // Alloca
                    if (alloca->is_local_var)
                    {
                        dead_vars.push_back(alloca->ret_val.id);
                    }
                    std::cerr << "Alloca" << std::endl;
                }
                else if (auto phi = dynamic_cast<ir::Phi *>(inst.get()))
                { // Phi
                    // search dst in dead_vars
                    auto it = std::find(dead_vars.begin(), dead_vars.end(), phi->dst.id);
                    if (it != dead_vars.end())
                    {
                        dead_vars.erase(it);
                    }
                    for (auto src : phi->srcs)
                    {
                        auto it = std::find(dead_vars.begin(), dead_vars.end(), src.first.id);
                        if (it != dead_vars.end())
                        {
                            dead_vars.erase(it);
                        }
                    }
                    std::cerr << "Phi" << std::endl;
                }
                else if (auto loadaddr = dynamic_cast<ir::LoadAddr *>(inst.get()))
                { // LoadAddr
                    auto it = std::find(dead_vars.begin(), dead_vars.end(), loadaddr->ret_val.id);
                    if (it != dead_vars.end())
                    {
                        dead_vars.erase(it);
                    }
                    std::cerr << "LoadAddr" << std::endl;
                }
                else if (auto store = dynamic_cast<ir::Store *>(inst.get()))
                { // Store
                    auto it = std::find(dead_vars.begin(), dead_vars.end(), store->src_val.id);
                    if (it != dead_vars.end())
                    {
                        dead_vars.erase(it);
                    }
                    std::cerr << "Store" << std::endl;
                }
                else if (auto binary = dynamic_cast<ir::Binary *>(inst.get()))
                { // Binary
                    auto it = std::find(dead_vars.begin(), dead_vars.end(), binary->dst.id);
                    if (it != dead_vars.end())
                    {
                        dead_vars.erase(it);
                    }
                    auto it1 = std::find(dead_vars.begin(), dead_vars.end(), binary->src1.id);
                    if (it1 != dead_vars.end())
                    {
                        dead_vars.erase(it1);
                    }
                    auto it2 = std::find(dead_vars.begin(), dead_vars.end(), binary->src2.id);
                    if (it2 != dead_vars.end())
                    {
                        dead_vars.erase(it2);
                    }
                    std::cerr << "Binary" << std::endl;
                }
                else if (auto assign = dynamic_cast<ir::Assign *>(inst.get()))
                { // Assign
                    auto it = std::find(dead_vars.begin(), dead_vars.end(), assign->dst.id);
                    if (it != dead_vars.end())
                    {
                        dead_vars.erase(it);
                    }
                    auto it1 = std::find(dead_vars.begin(), dead_vars.end(), assign->src.id);
                    if (it1 != dead_vars.end())
                    {
                        dead_vars.erase(it1);
                    }
                    std::cerr << "Assign" << std::endl;
                }
                else if (auto ret = dynamic_cast<ir::Return *>(inst.get()))
                { // Return
                    auto it = std::find(dead_vars.begin(), dead_vars.end(), ret->ret_val.id);
                    if (it != dead_vars.end())
                    {
                        dead_vars.erase(it);
                    }
                    std::cerr << "Return" << std::endl;
                }
                else if (auto call = dynamic_cast<ir::Call *>(inst.get()))
                { // Call
                    for (auto para : call->params)
                    {
                        auto it = std::find(dead_vars.begin(), dead_vars.end(), para.id);
                        if (it != dead_vars.end())
                        {
                            dead_vars.erase(it);
                        }
                    }
                    std::cerr << "Call" << std::endl;
                }
                else
                {
                    std::cerr << "Other Instr" << std::endl;
                }
            }
        }

        for (auto dead_var : dead_vars)
        {
            std::cerr << "dead var: " << dead_var << std::endl;
        }

        for (auto &bb : func.second.bbs)
        {
            for (auto it = bb.get()->instrs.begin(); it != bb.get()->instrs.end();)
            {
                auto &instr = *it;
                if (auto loadint = dynamic_cast<ir::LoadInt *>(instr.get()))
                {
                    auto it1 = std::find(dead_vars.begin(), dead_vars.end(), loadint->dst.id);
                    if (it1 != dead_vars.end())
                    {
                        it = bb.get()->instrs.erase(it);
                    }
                    else
                    {
                        it++;
                    }
                }
                else
                {
                    it++;
                }
            }
        }
    }
}