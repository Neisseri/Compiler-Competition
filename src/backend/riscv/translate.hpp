#include <unordered_map>
#include <string>

#include "riscv.hpp"
#include "../../common/const.hpp"
#include "../../common/ir.hpp"

namespace riscv {
  
  void Function::translate_instruction(ir::Instruction* ir_inst, BasicBlock* bb) {
    ir_inst->print(std::cout, 4);
    if (auto alloca = dynamic_cast<ir::Alloca*>(ir_inst)) {
      Reg r = Reg(alloca->ret_val);
      alloca_offsets[r] = frame_size;
      alloca_sizes[r] = alloca->size;
      frame_size += alloca->size;
      std::cout << "alloca" << "\n";
      auto n = new ADDI(r, Reg(General, sp), alloca->size);
      n->emit(std::cout);
      bb->instructions.emplace_back(new ADDI(r, Reg(General, sp), alloca->size));
    } else if (auto load = dynamic_cast<ir::Load*>(ir_inst)) {
      Reg dst = Reg(load->ret_val);
      Reg src = Reg(load->ptr);
      std::cout << "load" << "\n";
      auto n = new LoadWord(dst, src, 0);
      n->emit(std::cout);
      bb->instructions.emplace_back(new LoadWord(dst, src, 0));
    } else if (auto store = dynamic_cast<ir::Store*>(ir_inst)) {
      Reg dst = Reg(store->ptr);
      Reg src = Reg(store->src_val);
      std::cout << "store" << "\n";
      auto n = new StoreWord(src, dst, 0);
      n->emit(std::cout);
      bb->instructions.emplace_back(new StoreWord(src, dst, 0));
    } else if (auto binary = dynamic_cast<ir::Binary*>(ir_inst)) {
      Reg dst = Reg(binary->dst);
      Reg src1 = Reg(binary->src1);
      Reg src2 = Reg(binary->src2);
      switch (binary->op) {
        case BinaryOpEnum::ADD: {
          std::cout << "add" << "\n";
          auto n = new Binary(dst, RiscvBinaryOp::ADD, src1, src2);
          n->emit(std::cout);
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::ADD, src1, src2));
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
        }
        default: break;
      }
    } else if (auto ret = dynamic_cast<ir::Return*>(ir_inst)) {
      Reg src = Reg(ret->ret_val);
      std::cout << "return" << "\n";
      auto n = new Return(src);
      n->emit(std::cout);
      bb->instructions.emplace_back(new Return(src));
    }
  }

  Program::Program(ir::Program ir_program) {
    for (auto &[name, func]: ir_program.functions) {
      std::cout << "build function " << name << std::endl;
      functions[name] = new Function(func, name);
    }
  }

  Function::Function(ir::Function& ir_function, const std::string& name): name(name) {
    auto entry_bb = new BasicBlock;
    bbs.emplace_back(entry_bb);
    int num_params = ir_function.param_types.size();
    std::vector<int> stack_params;
    frame_size = 4 * 11 + 4; // callee-saved regs + ra
    for (int i = 0; i < num_params; i++) {
      Reg param_reg = Reg(General, -(i + 1 + ir_function.num_regs));
      offsets[param_reg] = frame_size;
      frame_size += 4; // load reg from stack
      entry_bb->instructions.emplace_back(new LoadWord(param_reg, Reg(General, sp), offsets[param_reg]));
    }
    for (auto &ir_bb: ir_function.bbs) {
        auto bb = new BasicBlock;
        bbs.emplace_back(bb);
        for (auto &inst: ir_bb->instrs)
          translate_instruction(inst.get(), bb);
    }
  }


}