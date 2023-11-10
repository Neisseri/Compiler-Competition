

// #include "riscv/riscvasmemitter.hpp"

// // use Asm to generate all the asm code for the program
// class Asm {
// public:
//     Asm(RiscvAsmEmitter emitter, BruteRegAlloc regAlloc) {
//         this->emitter = emitter;
//         this->regAlloc = regAlloc;
//     }

//     std::string transform(TACProg prog) {
//         LivenessAnalyzer analyzer;

//         for (const auto& func : prog.funcs) {
//             auto pair = emitter.selectInstr(func);
//             CFGBuilder builder;
//             CFG cfg = builder.buildFrom(pair.first);
//             analyzer.accept(cfg);
//             regAlloc.accept(cfg, pair.second);
//         }

//         return emitter.emitEnd();
//     }

// private:
//     RiscvAsmEmitter emitter;
//     BruteRegAlloc regAlloc;
// };
