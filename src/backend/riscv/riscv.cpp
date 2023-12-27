#include "riscv.hpp"

namespace riscv {

  int BasicBlock::total_blks = 0;

  void Instruction::replace_reg(Reg src, Reg dst) {
    for (auto r: reg_ptrs())
      if (*r == src)
        *r = dst;
  }

  const std::string tab = "    ";

  void Function::emit(std::ostream &os) {
    os << name << ":\n";
    for (auto bb: bbs) {
      os << print_bb(bb) << ":\n";
      for (auto &inst: bb->instructions) {
        inst->emit(os);
      }
      os << "\n";
    }
  }

  std::string global_var_name(std::string var_name) {
    return var_name.substr(0, var_name.length()-2);
  }

  void Program::emit(std::ostream &os) {
    for (auto b: global_defs) {
      if (b->is_array) {
        if (b->has_init) {
          os << "\n.data\n";
          os << ".globl " << global_var_name(b->var_name) << "\n";
          os << global_var_name(b->var_name) << ":\n";
          for (auto i: b->init_val) {
            os << "    .word " << i << "\n";
          }
          int space_left = 4 * (b->type.get_array_size() - b->init_val.size());
          if (space_left > 0)
            os << "    .space " << space_left << "\n";
        }
        else {
          os << "\n.bss\n";
          os << ".globl " << global_var_name(b->var_name) << "\n";
          os << global_var_name(b->var_name) << ":\n";
          os << "    .space " << 4 * b->type.get_array_size() << "\n";
        }
      }
      else {
        if (b->has_init) {
          os << "\n.data\n";
          os << ".globl " << global_var_name(b->var_name) << "\n";
          os << global_var_name(b->var_name) << ":\n";
          os << "    .word " << b->init_val[0] << "\n";
        }
        else {
          os << "\n.bss\n";
          os << ".globl " << global_var_name(b->var_name) << "\n";
          os << global_var_name(b->var_name) << ":\n";
          os << "    .space " << 4 << "\n";
        }
      }
    }
    os << "\n.text\n";
    for (auto &[name, func]: functions) {
      os << ".globl " << func->name << "\n";
      func->emit(os);
    }
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

  void LUI::emit(std::ostream &os) const {
    os << "lui " << print_reg(dst) << ", " << imm << "\n";
  }

  void Return::emit(std::ostream &os) const {
    os << "ret\n";
  }

  void Branch::emit(std::ostream &os) const {
    os << "beq x0, " << print_reg(src) << ", " << print_bb(target) << "\n";
  }

  void Phi::emit(std::ostream &os) const {
    os << "phi " << print_reg(dst) << " = ";
    for (auto i: srcs) {
      std::cerr << print_reg(i.first) << " " << print_bb(i.second) << "\n";
      os << "[ " << print_reg(i.first) << ", " << print_bb(i.second) << "] ";
    }
    os << "\n";
  }

  void Binary::emit(std::ostream &os) const {
    // ADD OR XOR SUB MUL DIV AND SLT SHL SRL SRA SGT
    switch (op) {
      case RiscvBinaryOp::ADD: {
        os << "add " << print_reg(dst) << ", " << print_reg(src1) << ", " << print_reg(src2) << "\n";
        break;
      } 
      case RiscvBinaryOp::OR: {
        os << "or " << print_reg(dst) << ", " << print_reg(src1) << ", " << print_reg(src2) << "\n";
        break;
      } 
      case RiscvBinaryOp::XOR: {
        os << "xor " << print_reg(dst) << ", " << print_reg(src1) << ", " << print_reg(src2) << "\n";
        break;
      } 
      case RiscvBinaryOp::SUB: {
        os << "sub " << print_reg(dst) << ", " << print_reg(src1) << ", " << print_reg(src2) << "\n";
        break;
      } 
      case RiscvBinaryOp::MUL: {
        os << "mul " << print_reg(dst) << ", " << print_reg(src1) << ", " << print_reg(src2) << "\n";
        break;
      }
      case RiscvBinaryOp::DIV: {
        os << "div " << print_reg(dst) << ", " << print_reg(src1) << ", " << print_reg(src2) << "\n";
        break;
      }
      case RiscvBinaryOp::AND: {
        os << "and " << print_reg(dst) << ", " << print_reg(src1) << ", " << print_reg(src2) << "\n";
        break;
      }
      case RiscvBinaryOp::SLT: {
        os << "slt " << print_reg(dst) << ", " << print_reg(src1) << ", " << print_reg(src2) << "\n";
        break;
      }
      case RiscvBinaryOp::SHL: {
        os << "shl " << print_reg(dst) << ", " << print_reg(src1) << ", " << print_reg(src2) << "\n";
        break;
      }
      case RiscvBinaryOp::SRL: {
        os << "srl " << print_reg(dst) << ", " << print_reg(src1) << ", " << print_reg(src2) << "\n";
        break;
      }
      case RiscvBinaryOp::SRA: {
        os << "sra " << print_reg(dst) << ", " << print_reg(src1) << ", " << print_reg(src2) << "\n";
        break;
      }
      case RiscvBinaryOp::SGT: {
        os << "sgt " << print_reg(dst) << ", " << print_reg(src1) << ", " << print_reg(src2) << "\n";
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
    if (dst != src)
      os << "mv " << print_reg(dst) << ", " << print_reg(src) << "\n";
  }

  void Call::emit(std::ostream &os) const {
    os << "call " << func_name << "\n";
  }

  void LoadAddr::emit(std::ostream &os) const {
    os << "la " << print_reg(dst) << ", " << var_name << "\n";
  }
}