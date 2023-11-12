// #include "riscv.hpp"
// class RiscvAsmEmitter : public AsmEmitter {
// public:
//     RiscvAsmEmitter(
//         std::vector<Reg> allocatableRegs, 
//         std::vector<Reg> callerSaveRegs
//     ) {
//         this.allocatableRegs = allocatableRegs;
//         this.callerSaveRegs = callerSaveRegs;
//     }

//     std::pair<std::vector<std::string>, SubroutineInfo> selectInstr(TACFunc func) {
//         RiscvInstrSelector selector(func.getEntry());
//         for (const auto& instr : func.getInstrSeq()) {
//             instr->accept(selector);
//         }

//         SubroutineInfo info(func.getEntry());

//         return std::make_pair(selector.getSeq(), info);
//     }

//     SubroutineEmitter emitSubroutine(SubroutineInfo info) {
//         return SubroutineEmitter(this, info);
//     }

//     std::string emitEnd() {
//         return printer.close();
//     }

// private:
//     class RiscvInstrSelector : public TACVisitor {
//     public:
//         RiscvInstrSelector(Label entry) : entry(entry) {}

//         void visitOther(TACInstr* instr) override {
//             seq.push_back(Riscv::Move(instr->getDst(), instr->getSrc()));
//         }

//         void visitReturn(Return* instr) override {
//             if (instr->getValue() != nullptr) {
//                 seq.push_back(Riscv::Move(Riscv::A0, instr->getValue()));
//             } else {
//                 seq.push_back(Riscv::LoadImm(Riscv::A0, 0));
//             }
//             seq.push_back(Riscv::JumpToEpilogue(entry));
//         }

//         // TODO
//     };

//     // TODO
// };
