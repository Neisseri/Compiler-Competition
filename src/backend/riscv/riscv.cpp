#include "riscv.hpp"

namespace riscv {

  void Function::emit(std::ostream &os) {
    os << name << ":\n";
    for (auto bb: bbs) {
      os << bb->label << ':\n';
      for (auto &inst: bb->instructions)
        inst->emit(os);
      os << "\n";
    }
  }

  void Program::emit(std::ostream &os) {
    os << ".text\n";
    os << ".global main\n";
    os << "\n";
    for (auto [name, func]: functions)
      func.emit(os);
  }
  
}