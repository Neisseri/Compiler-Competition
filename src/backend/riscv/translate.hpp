#include <unordered_map>
#include <string>

#include "riscv.hpp"
#include "../../common/const.hpp"
#include "../../common/ir.hpp"

namespace riscv {
  
  void Function::select_instr(ir::Instruction* ir_inst, BasicBlock* bb,
    std::unordered_map<ir::BasicBlock*, BasicBlock*> bb_map) {
    // ir_inst->print(std::cout, 4);
    if (auto alloca = dynamic_cast<ir::Alloca*>(ir_inst)) {
      Reg r = Reg(alloca->ret_val);
      alloca_offsets[r] = frame_size;
      alloca_sizes[r] = alloca->size;
      frame_size += alloca->size;
      bb->instructions.emplace_back(new ADDI(r, Reg(General, sp), alloca_offsets[r]));
    } else if (auto load = dynamic_cast<ir::Load*>(ir_inst)) {
      Reg dst = Reg(load->ret_val);
      Reg src = Reg(load->ptr);
      bb->instructions.emplace_back(new LoadWord(dst, src, 0));
    } else if (auto store = dynamic_cast<ir::Store*>(ir_inst)) {
      // debug
      std::cout << "# store " << store->src_val.id << " to " << store->ptr.id << "----------------------------\n";
      
      // TODO: 目前参数全放栈上
      // if (num_params > 0 && store->src_val.id <= num_params) {
      //     Reg dst = Reg(store->ptr);
      //     Reg a0 = Reg(General, argregs[0]);
      //     bb->instructions.emplace_back(new LoadWord(a0, Reg(General, sp), 4 * (store->src_val.id - 1) + frame_size));
      //     bb->instructions.emplace_back(new StoreWord(a0, dst, 0));
      // } else { // no params
        Reg dst = Reg(store->ptr);
        Reg src = Reg(store->src_val);
        bb->instructions.emplace_back(new StoreWord(src, dst, 0));
      //}
    } else if (auto binary = dynamic_cast<ir::Binary*>(ir_inst)) {
      Reg dst = Reg(binary->dst);
      Reg src1 = Reg(binary->src1);
      Reg src2 = Reg(binary->src2);
      switch (binary->op) {
        case BinaryOpEnum::ADD: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::ADD, src1, src2));
          break;
        } case BinaryOpEnum::EQ: {
          // sub d, s1, s2; seqz d, d;
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SUB, src1, src2));
          bb->instructions.emplace_back(new Unary(dst, RiscvUnaryOp::SEQZ, dst));
          break;
        } case BinaryOpEnum::SUB: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SUB, src1, src2));
          break;
        } case BinaryOpEnum::MUL: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::MUL, src1, src2));
          break;
        } case BinaryOpEnum::DIV: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::DIV, src1, src2));
          break;
        } case BinaryOpEnum::SHL: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SHL, src1, src2));
          break;
        } case BinaryOpEnum::LSHR: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SRL, src1, src2));
          break;
        } case BinaryOpEnum::ASHR: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SRA, src1, src2));
          break;
        } case BinaryOpEnum::AND: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::AND, src1, src2));
          break;
        } case BinaryOpEnum::OR: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::OR, src1, src2));
          break;
        } case BinaryOpEnum::XOR: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::XOR, src1, src2));
          break;
        } case BinaryOpEnum::SGT: { // signed greater than
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SGT, src1, src2));
          break;
        } case BinaryOpEnum::SLT: { // signed less than
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SLT, src1, src2));
          break;
        } case BinaryOpEnum::SGE: { // signed greater or equal
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SLT, src1, src2));
          bb->instructions.emplace_back(new Unary(dst, RiscvUnaryOp::SEQZ, dst));
          break;
        } case BinaryOpEnum::SLE: { // signed less or equal
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SGT, src1, src2));
          bb->instructions.emplace_back(new Unary(dst, RiscvUnaryOp::SEQZ, dst));
          break;
        } case BinaryOpEnum::NE: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SUB, src1, src2));
          bb->instructions.emplace_back(new Unary(dst, RiscvUnaryOp::SNEZ, dst));
          break;
        }
        default: break;
      }
    } else if (auto ret = dynamic_cast<ir::Return*>(ir_inst)) {
      Reg src = Reg(ret->ret_val);
      bb->instructions.emplace_back(new Move(src, Reg(General, a0)));
      bb->instructions.emplace_back(new Return(src));
    } else if (auto branch = dynamic_cast<ir::Branch*>(ir_inst)) {
      // br label B1
      // beq zero, zero, B1
      auto targ = bb_map[branch->bb_dst.get()];
      BasicBlock::add_edge(bb, targ);
      bb->instructions.emplace_back(new Jump(targ));
    } else if (auto cond_branch = dynamic_cast<ir::CondBranch*>(ir_inst)) {
      // br int %3, label B1, label B2
      // beq zero, %3, B1; j B2;
      Reg src = Reg(cond_branch->cond);
      auto true_target = bb_map[cond_branch->bb_true.get()];
      auto false_target = bb_map[cond_branch->bb_false.get()];
      BasicBlock::add_edge(bb, true_target);
      BasicBlock::add_edge(bb, false_target);
      bb->instructions.emplace_back(new Branch(src, false_target));
      bb->instructions.emplace_back(new Jump(true_target));
    } else if (auto loadint = dynamic_cast<ir::LoadInt*>(ir_inst)) {
      Reg dst = Reg(loadint->dst);
      bb->instructions.emplace_back(new LoadImm(dst, loadint->val));
    } else if (auto call = dynamic_cast<ir::Call *>(ir_inst)) {
      // debug
      std::cout << "# call " << call->func_name << "----------------------------\n";

      Reg ret_val = Reg(call->ret_val);
      int num_args = call->params.size();
      // 这里遇到个问题，如果参数数量较多，li 指令赋值的时候会用到参数寄存器
      // 但是参数寄存器的值在函数调用之后会被覆盖
      // 这部分涉及寄存器分配，还没搞懂，所以先全放到栈上
      // for (int i = 0; i < num_args; i++) {
      //   if (i < 8) {
      //     Reg src_reg = Reg(call->params[i]);
      //     bb->instructions.emplace_back(new Move(src_reg, Reg(General, argregs[i])));
      //   }
      // }
      // if (num_args > 8) {
      //   bb->instructions.emplace_back(new ADDI(Reg(General, sp), Reg(General, sp), -4 * (num_args - 8)));
      //   for (int i = 8; i < num_args; i++) {
      //     Reg src_reg = Reg(call->params[i]);
      //     bb->instructions.emplace_back(new StoreWord(src_reg, Reg(General, sp), 4 * (i - 8)));
      //   }
      // }
      bb->instructions.emplace_back(new ADDI(Reg(General, sp), Reg(General, sp), -4 * num_args));
      for (int i = 0; i < num_args; i++) {
        Reg src_reg = Reg(call->params[i]);
        bb->instructions.emplace_back(new StoreWord(src_reg, Reg(General, sp), 4 * i));
      }
      bb->instructions.emplace_back(new Call(call->func_name, num_args));
      bb->instructions.emplace_back(new Move(Reg(General, a0), ret_val));
    }
  }

  Program::Program(ir::Program ir_program) {
    for (auto &[name, func]: ir_program.functions)
      functions[name] = new Function(func, name);
  }

  Function::Function(ir::Function& ir_function, const std::string& name): name(name) {
    auto entry_bb = new BasicBlock;
    bbs.emplace_back(entry_bb);
    num_params = ir_function.param_types.size();
    std::vector<int> stack_params;
    frame_size = 4 * 11 + 4; // callee-saved regs + ra
    std::unordered_map<ir::BasicBlock*, BasicBlock*> bb_map;
    for (int i = 0; i < num_params; i++) {
      Reg param_reg = Reg(General, -(i + 1 + ir_function.num_regs)); // allocate regs for function parameters
      offsets[param_reg] = frame_size; // load all parameters from stack
      frame_size += 4;
      //entry_bb->instructions.emplace_back(new LoadWord(param_reg, Reg(General, sp), offsets[param_reg]));
    }
    for (auto &ir_bb: ir_function.bbs) {
        auto bb = new BasicBlock;
        bbs.emplace_back(bb);
        bb_map[ir_bb.get()] = bb;
    }
    auto bb_front = bb_map[ir_function.bbs.front().get()];
    BasicBlock::add_edge(entry_bb, bb_front);
    for (auto &ir_bb: ir_function.bbs) {
        auto bb = bb_map[ir_bb.get()];
        bb->instructions.clear();
        std::cout << "\n" << print_bb(bb) << ":\n";
        for (auto &inst: ir_bb->instrs)
          select_instr(inst.get(), bb, bb_map);
        for (auto &inst: bb->instructions) 
          inst->emit(std::cout);
        std::cout << "pred: ";
        for (auto &prevs: bb->pred) 
          std::cout << print_bb(prevs) << " ";
        std::cout << "\n";
        std::cout << "succ: ";
        for (auto &prevs: bb->succ) 
          std::cout << print_bb(prevs) << " ";
        std::cout << "\n";
    }
  }

}