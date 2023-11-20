#include "riscv.hpp"

namespace riscv {

  void Function::emit(std::ostream &os) {
    os << name << ":\n";
    for (auto bb: bbs) {
      os << bb->label << ":\n";
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

  void StoreWord::emit(std::ostream &os) const {
    if (src.id < 0) 
      os << "sw " << "T" << src.id << ", " << offset << "(" << "T" << base.id << ")\n";
    else
      os << "sw " << REG_NAMES[src.id] << ", " << offset << "(" << REG_NAMES[base.id] << ")\n";
  }

  void LoadWord::emit(std::ostream &os) const {
    if (dst.id < 0)
      os << "lw " << "T" << dst.id << ", " << offset << "(" << "T" << base.id << ")\n";
    else
      os << "lw " << REG_NAMES[dst.id] << ", " << offset << "(" << REG_NAMES[base.id] << ")\n";
  }

  void SPAdd::emit(std::ostream &os) const {
    os << "addi " << REG_NAMES[sp] << ", " << REG_NAMES[sp] << ", " << offset << "\n";
  }

  void ADDI::emit(std::ostream &os) const {
    if (dst.id < 0)
      os << "addi " << "T" << dst.id << ", " << "T" << src.id << ", " << offset << "\n";
    else
      os << "addi " << REG_NAMES[dst.id] << ", " << REG_NAMES[src.id] << ", " << offset << "\n";
  }

  void Return::emit(std::ostream &os) const {
    if (src.id < 0)
      os << "ret " << "T" << src.id << "\n";
    else
      os << "ret " << REG_NAMES[src.id] << "\n";
  }

  void Branch::emit(std::ostream &os) const {
    if (src.id < 0)
      os << "beq zero, " << "T" << src.id << ", B" << target->id << "\n";
    else
      os << "beq zero, " << REG_NAMES[src.id] << ", B" << target->id << "\n";
  }

  void Binary::emit(std::ostream &os) const {
    os << "binary\n";
  }
  
}