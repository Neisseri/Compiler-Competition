// #include "riscv.hpp"
// #include "const.hpp"

// namespace riscv {

//   void Function::emit(std::ostream &os) {
//     os << name << ":\n";
//     for (auto bb: bbs) {
//       os << bb->label << ':\n';
//       for (auto &inst: bb->instructions)
//         inst->emit(os);
//       os << "\n";
//     }
//   }

//   void Program::emit(std::ostream &os) {
//     os << ".text\n";
//     os << ".global main\n";
//     os << "\n";
//     for (auto [name, func]: functions)
//       func.emit(os);
//   }

//   void StoreWord::emit(std::ostream &os) const {
//     os << "sw " << REG_NAMES[src.id] << ", " << offset << "(" << REG_NAMES[base.id] << ")\n";
//   }

//   void LoadWord::emit(std::ostream &os) const {
//     os << "lw " << REG_NAMES[dst.id] << ", " << offset << "(" << REG_NAMES[base.id] << ")\n";
//   }

//   void Branch::emit(std::ostream &os) const {
//     os << "beq " << REG_NAMES[x0] << ", " << REG_NAMES[src.id] << ", " << target->label << "\n"; 
//   }

//   void SPAdd::emit(std::ostream &os) const {
//     os << "addi " << REG_NAMES[sp] << ", " << REG_NAMES[sp] << ", " << offset << "\n";
//   }
  
// }