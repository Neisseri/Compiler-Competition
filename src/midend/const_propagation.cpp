#include "iroptimizer.hpp"

int get_calculated_result(BinaryOpEnum op, int lhs, int rhs)
{
    switch (op)
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
        return lhs / rhs;
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
        return -1;
        break;
    }
}

void IROptimizer::constant_propagation()
{
    for (auto &func : ir_generator->ir_program.functions)
    {
        std::cerr << func.first << std::endl;

        // 用来跟踪具有常量值的变量的映射
        std::unordered_map<int, int> constant_vars;

        for (auto &bb : func.second.bbs)
        {
            SyError().throw_info("visit bb: " + std::to_string(bb->label.label_id));

            for (auto &inst : bb.get()->instrs)
            {
                if (auto loadint = dynamic_cast<ir::LoadInt *>(inst.get()))
                {
                    // 记录常量值
                    constant_vars[loadint->dst.id] = loadint->val;
                    SyError().throw_info("LoadInt" + std::to_string(loadint->dst.id));
                }
                else if (auto binary = dynamic_cast<ir::Binary *>(inst.get()))
                {
                    // 检查操作数是否为常量，如果是，计算结果
                    if (constant_vars.count(binary->src1.id) && constant_vars.count(binary->src2.id))
                    {
                        // 根据操作和操作数计算新常量
                        int result = get_calculated_result(binary->op, constant_vars[binary->src1.id], constant_vars[binary->src2.id]);
                        constant_vars[binary->dst.id] = result;
                        SyError().throw_info("Binary" + std::to_string(binary->dst.id));
                        // 将本条指令替换为LoadInt
                        auto load_int_instr = std::make_unique<ir::LoadInt>(binary->dst, result);
                        inst = std::move(load_int_instr);
                    }
                }
                else if (auto phi = dynamic_cast<ir::Phi *>(inst.get()))
                {
                    // 检查操作数是否为常量，如果是，计算结果
                    bool all_constant = true;
                    for (auto src : phi->srcs)
                    {
                        if (!constant_vars.count(src.first.id))
                        {
                            all_constant = false;
                            break;
                        }
                    }
                    if (all_constant)
                    {
                        // 根据操作和操作数计算新常量
                        int result = constant_vars[phi->srcs[0].first.id];
                        constant_vars[phi->dst.id] = result;
                        SyError().throw_info("Phi" + std::to_string(phi->dst.id));
                        // 将本条指令替换为LoadInt
                        auto load = std::make_unique<ir::LoadInt>(phi->dst, result);
                        inst = std::move(load);
                    }
                }
                else if (auto assign = dynamic_cast<ir::Assign *>(inst.get()))
                {
                    // 检查操作数是否为常量，如果是，计算结果
                    if (constant_vars.count(assign->src.id))
                    {
                        // 根据操作和操作数计算新常量
                        int result = constant_vars[assign->src.id];
                        constant_vars[assign->src.id] = result;
                        SyError().throw_info("Assign" + std::to_string(assign->src.id));
                        SyError().throw_error(ErrorTypeEnum::SemanticError, "Assign" + std::to_string(assign->src.id));
                        // 将本条指令替换为LoadInt
                        auto load_int_instr = std::make_unique<ir::LoadInt>(assign->src, result);
                        inst = std::move(load_int_instr);
                    }
                }
                else if (auto cond_branch = dynamic_cast<ir::CondBranch *>(inst.get()))
                {
                    if (constant_vars.count(cond_branch->cond.id))
                    {
                        int result = constant_vars[cond_branch->cond.id];
                        if (result)
                        {
                            // 将本条指令替换为Branch
                            auto jump_instr = std::make_unique<ir::Branch>(cond_branch->bb_true);
                            inst = std::move(jump_instr);
                        }
                        else
                        {
                            auto jump_instr = std::make_unique<ir::Branch>(cond_branch->bb_false);
                            inst = std::move(jump_instr);
                        }
                    }
                }
                else if (auto call = dynamic_cast<ir::Call *>(inst.get()))
                {
                    // 检查操作数是否为常量，如果是，计算结果
                    for (auto arg : call->params)
                    {
                        if (constant_vars.count(arg.id))
                        {
                            // 根据操作和操作数计算新常量
                            int result = constant_vars[arg.id];
                            constant_vars[arg.id] = result;
                            SyError().throw_info("Call" + std::to_string(arg.id));
                            // 将本条指令替换为LoadInt
                            auto load_int_instr = std::make_unique<ir::LoadInt>(arg, result);
                            inst = std::move(load_int_instr);
                        }
                    }
                }
            }
        }
    }
}