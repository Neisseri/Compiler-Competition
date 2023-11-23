#include "riscv.hpp"

namespace riscv {

  int BasicBlock::total_blks = 0;

  void Instruction::replace_reg(Reg src, Reg dst) {
    for (auto r: reg_ptrs())
      if (*r == src)
        *r = dst;
  }

  void Function::emit(std::ostream &os) {
    os << name << ":\n";
    for (auto bb: bbs) {
      os << print_bb(bb) << ":\n";
      for (auto &inst: bb->instructions)
        inst->emit(os);
      os << "\n";
    }
  }

  void Program::emit(std::ostream &os) {
    os << ".text\n";
    os << ".global main\n";
    os << "\n";
    for (auto &[name, func]: functions)
      func->emit(os);
  }
  
  void BasicBlock::add_inst(Instruction* inst) {
    instructions.emplace_back(inst);
  }

  std::string print_reg(Reg src) {
    return src.id < 0 ? ("T[" + std::to_string(src.id) + "]") : REG_NAMES[src.id];
  }

  std::string print_bb(BasicBlock* bb) {
    return "B" + std::to_string(bb->id);
  }

  void StoreWord::emit(std::ostream &os) const {
    os << "sw " << print_reg(src) << ", " << offset << "(" << print_reg(base) << ")\n";
  }

  void LoadWord::emit(std::ostream &os) const {
    os << "lw " << print_reg(dst) << ", " << offset << "(" << print_reg(base) << ")\n";
  }

  void SPAdd::emit(std::ostream &os) const {
    os << "addi " << REG_NAMES[sp] << ", " << REG_NAMES[sp] << ", " << offset << "\n";
  }

  void ADDI::emit(std::ostream &os) const {
    os << "addi " << print_reg(dst) << ", " << print_reg(src) << ", " << offset << "\n";
  }

  void Return::emit(std::ostream &os) const {
    os << "ret\n";
  }

  void Branch::emit(std::ostream &os) const {
    os << "beq x0, " << print_reg(src) << ", " << print_bb(target) << "\n";
  }

  void Binary::emit(std::ostream &os) const {
    switch (op) {
      case RiscvBinaryOp::ADD: {
        os << "add " << print_reg(dst) << ", " << print_reg(src1) << ", " << print_reg(src2) << "\n";
        break;
      } case RiscvBinaryOp::SUB: {
        os << "sub " << print_reg(dst) << ", " << print_reg(src1) << ", " << print_reg(src2) << "\n";
        break;
      }
      default: os << "unkown binary op\n";
    }
  }

  void Unary::emit(std::ostream &os) const {
    switch (op) {
      case RiscvUnaryOp::SEQZ: {
        os << "seqz " << print_reg(dst) << ", " << print_reg(src) << "\n";
        break;
      } case RiscvUnaryOp::SNEZ: {
        os << "snez " << print_reg(dst) << ", " << print_reg(src) << "\n";
        break;
      }
      default: os << "unkown unary op\n";
    }
  }
  
  void LoadImm::emit(std::ostream &os) const {
    os << "li " << print_reg(dst) << ", " << imm << "\n";
  }

  void Jump::emit(std::ostream &os) const {
    os << "j " << print_bb(target) << "\n";
  }

  void Move::emit(std::ostream &os) const {
    os << "mv " << print_reg(dst) << ", " << print_reg(src) << "\n";
  }

  void Call::emit(std::ostream &os) const {
    os << "call " << func_name << "\n";
  }
}