// #include "iroptimizer.hpp"

// int get_calculated_result(BinaryOpEnum op, int lhs, int rhs)
// {
//     switch (op)
//     {
//     case BinaryOpEnum::ADD:
//         return lhs + rhs;
//         break;
//     case BinaryOpEnum::SUB:
//         return lhs - rhs;
//         break;
//     case BinaryOpEnum::MUL:
//         return lhs * rhs;
//         break;
//     case BinaryOpEnum::DIV:
//         return lhs * rhs;
//         break;
//     case BinaryOpEnum::MOD:
//         return lhs % rhs;
//         break;
//     case BinaryOpEnum::AND:
//         return lhs & rhs;
//         break;
//     case BinaryOpEnum::OR:
//         return lhs | rhs;
//         break;
//     case BinaryOpEnum::XOR:
//         return lhs ^ rhs;
//         break;
//     case BinaryOpEnum::SGT:
//         return lhs > rhs;
//         break;
//     case BinaryOpEnum::SLT:
//         return lhs < rhs;
//         break;
//     case BinaryOpEnum::SGE:
//         return lhs >= rhs;
//         break;
//     case BinaryOpEnum::SLE:
//         return lhs <= rhs;
//         break;
//     case BinaryOpEnum::EQ:
//         return lhs == rhs;
//         break;
//     case BinaryOpEnum::NE:
//         return lhs != rhs;
//         break;
//     case BinaryOpEnum::SHL:
//         return lhs << rhs;
//         break;
//     default: // TODO:no support for shr
//         return -1;
//         break;
//     }
// }

// void IROptimizer::constant_propagation()
// {
//     for (auto &func : ir_generator->ir_program.functions)
//     {
//         std::cerr << func.first << std::endl;

//         // 用来跟踪具有常量值的变量的映射
//         std::unordered_map<int, int> constant_vars;

//         for (auto &bb : func.second.bbs)
//         {
//             SyError().throw_info("visit bb: " + std::to_string(bb->label.label_id));

//             for (auto &inst : bb.get()->instrs)
//             {
//                 if (auto loadint = dynamic_cast<ir::LoadInt *>(inst.get()))
//                 {
//                     // 记录常量值
//                     constant_vars[loadint->dst.id] = loadint->val;
//                     SyError().throw_info("LoadInt"+std::to_string(loadint->dst.id));
//                 }
//                 else if (auto binary = dynamic_cast<ir::Binary *>(inst.get()))
//                 {
//                     // 检查操作数是否为常量，如果是，计算结果
//                     if (constant_vars.count(binary->src1.id) && constant_vars.count(binary->src2.id))
//                     {
//                         // 根据操作和操作数计算新常量
//                         int result = get_calculated_result(binary->op, constant_vars[binary->src1.id], constant_vars[binary->src2.id]);
//                         constant_vars[binary->dst.id] = result;
//                         SyError().throw_info("Binary"+std::to_string(binary->dst.id));
//                     }
//                 }
//                 else if (auto store = dynamic_cast<ir::Store *>(inst.get()))
//                 {
//                     // 检查是否存储了常量值
//                     if (constant_vars.count(store->src_val.id))
//                     {
//                         // 用常量值替换变量
//                         store->src_val = ir::Reg(constant_vars[store->src_val.id]);
//                         SyError().throw_info("Store"+std::to_string(store->src_val.id));
//                     }
//                 }
//                 else if (auto load = dynamic_cast<ir::Load *>(inst.get()))
//                 {
//                     // 检查是否加载了常量值
//                     if (constant_vars.count(load->ptr.id))
//                     {
//                         // 用常量值替换变量
//                         load->ptr = ir::Reg(constant_vars[load->ptr.id]);
//                         SyError().throw_info("Load"+std::to_string(load->ptr.id));
//                     }
//                 }
//                 else if (auto phi = dynamic_cast<ir::Phi *>(inst.get()))
//                 {
//                     // 检查是否有常量值的源
//                     for (auto &src : phi->srcs)
//                     {
//                         if (constant_vars.count(src.first.id))
//                         {
//                             // 用常量值替换变量
//                             src.first = ir::Reg(constant_vars[src.first.id]);
//                             SyError().throw_info("Phi"+std::to_string(src.first.id));
//                         }
//                     }
//                 }
//                 else if (auto call = dynamic_cast<ir::Call *>(inst.get()))
//                 {
//                     // 检查是否有常量值的参数
//                     for (auto &arg : call->args)
//                     {
//                         if (constant_vars.count(arg.id))
//                         {
//                             // 用常量值替换变量
//                             arg = ir::Reg(constant_vars[arg.id]);
//                             SyError().throw_info("Call"+std::to_string(arg.id));
//                         }
//                     }
//                 }
//                 else if (auto ret = dynamic_cast<ir::Ret *>(inst.get()))
//                 {
//                     // 检查是否有常量值的返回值
//                     if (constant_vars.count(ret->val.id))
//                     {
//                         // 用常量值替换变量
//                         ret->val = ir::Reg(constant_vars[ret->val.id]);
//                         SyError().throw_info("Ret"+
//                 // 传播常量并简化IR
//                 if (auto otherInst = dynamic_cast<ir::SomeOtherInstructionType *>(inst.get()))
//                 {
//                     // 如果可用，用变量的常量值替换它
//                     // 可能简化表达式或启用进一步优化
//                 }
//                 // ... 继续处理其他指令
//             }
//         }

//         // 第二遍：用常量替换所有变量的使用
//         for (auto &bb : func.second.bbs)
//         {
//             for (auto &inst : bb.get()->instrs)
//             {
//                 // 检查每条指令是否使用了有常量值的变量
//                 // 并替换为常量，根据需要简化指令
//             }
//         }

//         // 清理：移除在常量传播后变得不必要的指令
//     }
// }
