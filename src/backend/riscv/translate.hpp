#include <unordered_map>
#include <string>

#include "riscv.hpp"
#include "../../common/common.hpp"
#include "../../common/ir.hpp"

namespace riscv {

class Translator {
public:
    Translator() = default;

    void translate_function(Function &dst, ir::Function &src) {
        bb_map.clear();

        // entry block
        auto entry_bb = new BasicBlock();
        dst.bbs.emplace_back(entry_bb);

        auto &params = src.param_types;
        
        for (int i = 0; i < params.size(); i++) {
            // TODO: just consider `int` now
            // auto type = params[i].type;
        }
    }

    void translate(Program &dst, ir::Program src) {
        for (auto &[name, func] : src.functions) {
            dst.functions[name].name = name;
            translate_function(dst.functions[name], func);
        }
    }
private:
    std::unordered_map<ir::BasicBlock*, BasicBlock*> bb_map;
    // Basic Block Map: ir -> riscv 
};
  

//   void translate_instruction(ir::Instruction* instr, BasicBlock* bb) {

//     if (auto result = dynamic_cast<ir::Alloca*>(instr)) {
      
//     } else if (auto result = dynamic_cast<ir::Load*>(instr)) {
      
//     } else if (auto unary = dynamic_cast<ir::Unary*>(instr)) {
//       Reg dst = Reg::fromIRReg(unary->dst);
//       Reg src = Reg::fromIRReg(unary->src);
      
//       switch (unary->op) // although there is single unary instr in llvm, use switch-case in case of adding new instrs
//       {
//         case ir::UnaryOp::FNeg: {
//           // TODO
//           // li	a5,-2147483648
//           // xor	a0,a5,a0
//           break;
//         }
//       }
//     } else if (auto binary = dynamic_cast<ir::Binary*>(instr)) {
//       Reg dst = Reg::fromIRReg(binary->dst);
//       Reg src1 = Reg::fromIRReg(binary->src1);
//       Reg src2 = Reg::fromIRReg(binary->src2);
      
//       switch (binary->op)
//       {
//         case ir::BinaryOp::Add: {
//           bb->push(new Binary(dst, RiscvBinaryOp::ADD, src1, src2));
//           break;
//         }

//         case ir::BinaryOp::Sub: {
//           bb->push(new Binary(dst, RiscvBinaryOp::SUB, src1, src2));
//           break;
//         }

//         case ir::BinaryOp::Mul: {
//           bb->push(new Binary(dst, RiscvBinaryOp::MUL, src1, src2));
//           break;
//         }

//         case ir::BinaryOp::SDiv: {
//           bb->push(new Binary(dst, RiscvBinaryOp::DIV, src1, src2));
//           break;
//         }

//         case ir::BinaryOp::SRem: {
//           bb->push(new Binary(dst, RiscvBinaryOp::REM, src1, src2));
//           break;
//         }
        
//         case ir::BinaryOp::Shl: { // <<
//           bb->push(new Binary(dst, RiscvBinaryOp::SLL, src1, src2));
//           break;
//         }

//         case ir::BinaryOp::LShr: { // Logic Shift Right
//           bb->push(new Binary(dst, RiscvBinaryOp::SRL, src1, src2));
//           break;
//         }

//         case ir::BinaryOp::AShr: { // Arithmetic Shift Right
//           bb->push(new Binary(dst, RiscvBinaryOp::SRA, src1, src2));
//           break;
//         }

//         case ir::BinaryOp::And: {
//           bb->push(new Binary(dst, RiscvBinaryOp::AND, src1, src2));
//           break;
//         }

//         case ir::BinaryOp::Or: {
//           bb->push(new Binary(dst, RiscvBinaryOp::OR, src1, src2));
//           break;
//         }

//         case ir::BinaryOp::Xor: {
//           bb->push(new Binary(dst, RiscvBinaryOp::XOR, src1, src2));
//           break;
//         }
      
//         default:
//           break;
//       }

//     } else if (auto result = dynamic_cast<ir::Return*>(instr)) {

//     }
//   }
}

//   // void translate_instruction(armv7::Function &fn, BasicBlock *bb,
//   //                            ir::Instruction *ins, BasicBlock *next_bb) {
//   //   namespace ii = ir::insns;
//   //   TypeCase(alloca, ii::Alloca *, ins) {
//   //     auto obj = new StackObject;
//   //     obj->size = alloca->allocs_type.size();
//   //     fn.normal_objs.push_back(obj);
//   //     fn.stack_objects.emplace_back(obj);

//   //     Reg dst = Reg::from(alloca->dst);
//   //     fn.reg_val[dst] = obj;
//   //     bb->push(new LoadStackAddr{dst, obj, 0});
//   //   }
//   //   else TypeCase(load, ii::Load *, ins) {
//   //     bb->push(new Load{Reg::from(load->dst), Reg::from(load->addr), 0});
//   //   }
//   //   else TypeCase(load, ii::LoadAddr *, ins) {
//   //     Reg dst = Reg::from(load->dst);
//   //     fn.reg_val[dst] = load->var_name;
//   //     bb->push(new LoadAddr{dst, load->var_name});
//   //   }
//   //   else TypeCase(load, ii::LoadImm *, ins) {
//   //     Reg dst = Reg::from(load->dst);
//   //     if (!dst.is_float()) {
//   //       fn.emit_imm(bb, dst, load->imm.iv);
//   //     } else {
//   //       float imm = load->imm.fv;
//   //       if (false && is_vmov_f32_imm(imm)) { // TODO
//   //         bb->push(new Move(dst, Operand2::from(imm)));
//   //       } else {
//   //         Reg t = fn.new_reg(General);
//   //         fn.emit_imm(bb, t, *reinterpret_cast<int *>(&imm));
//   //         bb->push(new Move(dst, Operand2::from(t)));
//   //       }
//   //     }
//   //   }
//   //   else TypeCase(store, ii::Store *, ins) {
//   //     Reg val = Reg::from(store->val);
//   //     Reg addr = Reg::from(store->addr);
//   //     bb->push(new Store{val, addr, 0});
//   //   }
//   //   else TypeCase(gep, ii::GetElementPtr *, ins) {
//   //     Reg index_reg = Reg::from(gep->indices[0]);
//   //     int nr_indices = gep->indices.size();
//   //     for (int i = 1; i < nr_indices; ++i) {
//   //       Reg t = fn.new_reg(General);
//   //       Reg s = Reg::from(gep->indices[i]);
//   //       int dim = gep->type.dims[i];
//   //       if (is_power_of_2(dim)) {
//   //         bb->push(new FullRType{
//   //             FullRType::Op::Add, t, s,
//   //             Operand2::from(LSL, index_reg, __builtin_ctz(dim))});
//   //       } else {
//   //         Reg imm_reg = fn.new_reg(General);
//   //         fn.emit_imm(bb, imm_reg, dim);
//   //         bb->push(new FusedMul{FusedMul::Add, t, index_reg, imm_reg, s});
//   //       }
//   //       index_reg = t;
//   //     }
//   //     for (int i = nr_indices; i < static_cast<int>(gep->type.dims.size());
//   //          ++i) {
//   //       Reg t = fn.new_reg(General);
//   //       int dim = gep->type.dims[i];
//   //       if (is_power_of_2(dim)) {
//   //         bb->push(
//   //             new Move{t, Operand2::from(LSL, index_reg, __builtin_ctz(dim))});
//   //       } else {
//   //         Reg imm_reg = fn.new_reg(General);
//   //         fn.emit_imm(bb, imm_reg, dim);
//   //         bb->push(new RType{RType::Op::Mul, t, index_reg, imm_reg});
//   //       }
//   //       index_reg = t;
//   //     }
//   //     Reg dst = Reg::from(gep->dst);
//   //     Reg base = Reg::from(gep->base);
//   //     bb->push(new FullRType{FullRType::Op::Add, dst, base,
//   //                            Operand2::from(LSL, index_reg, 2)});
//   //   }
//   //   else TypeCase(cvt, ii::Convert *, ins) {
//   //     auto const dst = Reg::from(cvt->dst);
//   //     auto const src = Reg::from(cvt->src);
//   //     auto const temp = fn.new_reg(RegType::Fp);
//   //     if (cvt->dst.type != cvt->src.type) {
//   //       if (cvt->dst.type == ScalarType::Float) { // int -> float
//   //         bb->push(new Move(temp, Operand2::from(src)));
//   //         bb->push(new Convert(dst, temp, ConvertType::Int2Float));
//   //       } else { // float -> int
//   //         bb->push(new Convert(temp, src, ConvertType::Float2Int));
//   //         bb->push(new Move(dst, Operand2::from(temp)));
//   //       }
//   //     }
//   //   }
//   //   else TypeCase(unary, ii::Unary *, ins) {
//   //     Reg dst = Reg::from(unary->dst);
//   //     Reg src = Reg::from(unary->src);
//   //     switch (unary->op) {
//   //     case UnaryOp::Sub:
//   //       if (!dst.is_float()) {
//   //         bb->push(new IType{IType::Op::RevSub, dst, src, 0});
//   //       } else {
//   //         bb->push(new Vneg(dst, src));
//   //       }
//   //       break;
//   //     case UnaryOp::Not: {
//   //       if (!dst.is_float() && !src.is_float()) {
//   //         // bb->push(new Move{dst, Operand2::from(0)});
//   //         // bb->push(new Compare{src, Operand2::from(0)});
//   //         // bb->push(ExCond::Eq, new Move{dst, Operand2::from(1)});
//   //         // alternative: clz dst, src; lsr dst, dst, #5
//   //         bb->push(new PseudoNot{dst, src});
//   //       } else {
//   //         auto cmp = std::make_unique<Compare>(src, Operand2::from(0));
//   //         bb->push(ExCond::Eq, new PseudoCompare(cmp.release(), dst));
//   //       }

//   //       if (cmp_info.count(src)) {
//   //         auto &cmp = cmp_info[src];
//   //         cmp_info[dst].cond = logical_not(cmp.cond);
//   //         cmp_info[dst].lhs = cmp.lhs;
//   //         cmp_info[dst].rhs = cmp.rhs;
//   //       } else if (lnot_info.count(src)) {
//   //         lnot_info[dst].flip = !lnot_info[src].flip;
//   //         lnot_info[dst].src = lnot_info[src].src;
//   //       } else {
//   //         lnot_info[dst].flip = true;
//   //         lnot_info[dst].src = src;
//   //       }
//   //       break;
//   //     }
//   //     default:
//   //       break;
//   //     }
//   //   }
//   //   else TypeCase(binary, ii::Binary *, ins) {
//   //     Reg dst = Reg::from(binary->dst);
//   //     Reg s1 = Reg::from(binary->src1);
//   //     Reg s2 = Reg::from(binary->src2);
//   //     switch (binary->op) {
//   //     case BinaryOp::Add:
//   //     case BinaryOp::Sub:
//   //     case BinaryOp::Mul:
//   //     case BinaryOp::Div:
//   //       bb->push(new RType{RType::from(binary->op), dst, s1, s2});
//   //       break;
//   //     case BinaryOp::Mod:
//   //       bb->push(new PseudoModulo{dst, s1, s2});
//   //       break;
//   //     case BinaryOp::Eq:
//   //     case BinaryOp::Neq:
//   //     case BinaryOp::Geq:
//   //     case BinaryOp::Gt:
//   //     case BinaryOp::Leq:
//   //     case BinaryOp::Lt: {
//   //       auto cond = from(binary->op);
//   //       auto inner = new Compare{s1, Operand2::from(s2)};
//   //       bb->push(cond, new PseudoCompare{inner, dst});

//   //       auto &cmp = cmp_info[dst];
//   //       cmp.cond = cond;
//   //       cmp.lhs = s1;
//   //       cmp.rhs = s2;
//   //       break;
//   //     }
//   //     case BinaryOp::Shr: // contract: s1 / (1 << s2)
//   //       bb->push(new PseudoDivPowerTwo(dst, s1, s2));
//   //       break;
//   //     case BinaryOp::Shl:
//   //       bb->push(new Move(dst, Operand2::from(ShiftType::LSL, s1, s2)));
//   //       break;
//   //     default:
//   //       __builtin_unreachable();
//   //     }
//   //   }
//   //   else TypeCase(call, ii::Call *, ins) {
//   //     // NOTE: 需要用栈传的参数现在是push入栈的，这要求调用后的sp调整量完全匹配
//   //     // 另一种方式是先减sp，然后生成StoreStack
//   //     int nr_args, nr_gp_args, nr_fp_args;
//   //     std::vector<int> reg_args, stack_args;
//   //     nr_gp_args = nr_fp_args = 0;
//   //     nr_args = call->args.size();

//   //     for (int i = 0; i < nr_args; ++i) {
//   //       Reg arg_reg = Reg::from(call->args[i]);
//   //       if (!arg_reg.is_float()) {
//   //         if (nr_gp_args++ < NR_ARG_GPRS)
//   //           reg_args.push_back(i);
//   //         else
//   //           stack_args.push_back(i);
//   //       } else {
//   //         if (nr_fp_args++ < NR_ARG_FPRS)
//   //           reg_args.push_back(i);
//   //         else
//   //           stack_args.push_back(i);
//   //       }
//   //     }

//   //     int sp_adjustment =
//   //         4 * stack_args.size(); // NOTE: 目前所有标量类型都是4字节
//   //     // NOTE: 调用约定要求函数边界的sp按照8字节对齐
//   //     if ((sp_adjustment & 7) != 0) {
//   //       sp_adjustment += 4;
//   //       bb->push(new AdjustSp{-4});
//   //     }

//   //     for (auto it = stack_args.rbegin(); it != stack_args.rend(); ++it) {
//   //       Reg arg_reg = Reg::from(call->args[*it]);
//   //       bb->push(new Push{{arg_reg}});
//   //     }
//   //     nr_gp_args = nr_fp_args = 0;
//   //     for (auto i : reg_args) {
//   //       Reg arg_reg = Reg::from(call->args[i]);
//   //       if (!arg_reg.is_float()) {
//   //         bb->push(new Move{Reg{arg_reg.type, r0 + nr_gp_args++},
//   //                           Operand2::from(arg_reg)});
//   //       } else {
//   //         bb->push(
//   //             new Move{Reg{Fp, s0 + nr_fp_args++}, Operand2::from(arg_reg)});
//   //       }
//   //     }
//   //     bb->push(new Call{call->func, nr_gp_args, nr_fp_args, call->variadic_at});
//   //     // 这里钻了个空子，这个语法中函数的返回值只能是int或float
//   //     // 如果接收返回值的寄存器类型是String表明实际上无返回值
//   //     if (call->dst.type != String)
//   //       bb->push(
//   //           new Move{Reg::from(call->dst),
//   //                    Operand2::from(Reg::from(call->dst.type, 0))}); // r0或s0

//   //     if (sp_adjustment != 0)
//   //       bb->push(new AdjustSp{sp_adjustment});
//   //   }
//   //   else TypeCase(ret, ii::Return *, ins) {
//   //     // NOTE: 此指令不一定是bx lr，可能实际是到exit_bb的跳转
//   //     if (ret->val)
//   //       bb->push(
//   //           new Move{Reg::from(ret->val->type, 0),
//   //                    Operand2::from(Reg::from(ret->val.value()))}); // r0或s0
//   //     bb->push(new Return{});
//   //   }
//   //   else TypeCase(jump, ii::Jump *, ins) {
//   //     auto target = bb_map[jump->target];
//   //     BasicBlock::add_edge(bb, target);
//   //     bb->push(new Branch{target});
//   //   }
//   //   else TypeCase(br, ii::Branch *, ins) {
//   //     Reg val = Reg::from(br->val);
//   //     auto true_target = bb_map[br->true_target];
//   //     auto false_target = bb_map[br->false_target];
//   //     BasicBlock::add_edge(bb, true_target);
//   //     BasicBlock::add_edge(bb, false_target);

//   //     // auto emit_branch = [bb, next_bb, true_target, false_target](ExCond
//   //     // cond) {
//   //     //   if (next_bb == false_target)
//   //     //     bb->push(cond, new Branch{true_target});
//   //     //   else if (next_bb == true_target)
//   //     //     bb->push(logical_not(cond), new Branch{false_target});
//   //     //   else {
//   //     //     bb->push(cond, new Branch{true_target});
//   //     //     bb->push(new Branch{false_target});
//   //     //   }
//   //     // };

//   //     if (cmp_info.count(val)) { // 显式二元比较
//   //       auto &cmp = cmp_info[val];
//   //       // bb->push(new Compare{cmp.lhs, Operand2::from(cmp.rhs)});
//   //       // emit_branch(cmp.cond);
//   //       auto inner_cmp = new Compare{cmp.lhs, Operand2::from(cmp.rhs)};
//   //       bb->push(cmp.cond, new CmpBranch{inner_cmp, true_target, false_target});
//   //     } else { // 隐式与0比较
//   //       bool flip_cond = false;
//   //       if (lnot_info.count(val)) {
//   //         flip_cond = lnot_info[val].flip;
//   //         val = lnot_info[val].src;
//   //       }

//   //       // 不启用Thumb-2的CBZ/CBNZ，限制较多
//   //       bool use_cbz_cbnz = false;
//   //       if (!val.is_float() && use_cbz_cbnz) {
//   //         // emit cbz/cbnz
//   //         auto emit_cond_branch = [flip_cond, bb](Reg val, BasicBlock *target,
//   //                                                 bool flip) {
//   //           if (flip_cond ^ flip)
//   //             bb->push(new RegBranch{RegBranch::Cbz, val, target});
//   //           else
//   //             bb->push(new RegBranch{RegBranch::Cbnz, val, target});
//   //         };

//   //         if (next_bb == false_target)
//   //           emit_cond_branch(val, true_target, false);
//   //         else if (next_bb == true_target)
//   //           emit_cond_branch(val, false_target, true);
//   //         else {
//   //           emit_cond_branch(val, true_target, false);
//   //           bb->push(new Branch{false_target});
//   //         }
//   //       } else {
//   //         // cmp rd, #0 / vcmp.f32 sd, #0
//   //         auto cond = flip_cond ? ExCond::Eq : ExCond::Ne;
//   //         // bb->push(new Compare{val, Operand2::from(0)});
//   //         // emit_branch(cond);

//   //         // TODO: 区分vcmp.f32
//   //         auto inner_cmp = new Compare{val, Operand2::from(0)};
//   //         bb->push(cond, new CmpBranch{inner_cmp, true_target, false_target});
//   //       }
//   //     }
//   //   }
//   //   else TypeCase(phi, ii::Phi *, ins) {
//   //     std::vector<std::pair<BasicBlock *, Reg>> srcs;
//   //     for (auto &[ir_bb, reg] : phi->incoming)
//   //       srcs.emplace_back(bb_map.at(ir_bb), Reg::from(reg));
//   //     bb->push(new Phi{Reg::from(phi->dst), std::move(srcs)});
//   //   }
//   //   else TypeCase(sw, ii::Switch *, ins) {
//   //     Reg val = Reg::from(sw->val);
//   //     Reg tmp = fn.new_reg(General);
//   //     auto default_target = bb_map.at(sw->default_target);
//   //     BasicBlock::add_edge(bb, default_target);

//   //     std::vector<std::pair<int, BasicBlock *>> targets;
//   //     for (auto &[v, ir_bb] : sw->targets) {
//   //       auto target = bb_map.at(ir_bb);
//   //       targets.push_back({v, target});
//   //       BasicBlock::add_edge(bb, target);
//   //     }
//   //     assert(!targets.empty());
//   //     bb->push(new Switch{val, tmp, default_target, std::move(targets)});
//   //   }
//   // }