#include "riscv.hpp"

namespace riscv {

Program::Program(): label_cnt(0) {
    // print label
//     buffer.emplace_back(".text\n");
//     buffer.emplace_back(".global_main\n");
//     buffer.emplace_back("\n");


//     self.printer.printComment("start of prologue")
//     self.printer.printInstr(Riscv.SPAdd(-self.nextLocalOffset))

//     # in step9, you need to think about how to store RA here
//     # you can get some ideas from how to save CalleeSaved regs
//     for i in range(len(Riscv.CalleeSaved)):
//         if Riscv.CalleeSaved[i].isUsed():
//             self.printer.printInstr(
//                 Riscv.NativeStoreWord(Riscv.CalleeSaved[i], Riscv.SP, 4 * i)
//             )

//     self.printer.printComment("end of prologue")
//     self.printer.println("")

//     self.printer.printComment("start of body")

//     # in step9, you need to think about how to pass the parameters here
//     # you can use the stack or regs

//     # using asmcodeprinter to output the RiscV code
//     for instr in self.buf:
//         self.printer.printInstr(instr)

//     self.printer.printComment("end of body")
//     self.printer.println("")

//     self.printer.printLabel(
//         Label(LabelKind.TEMP, self.info.funcLabel.name + Riscv.EPILOGUE_SUFFIX)
//     )
//     self.printer.printComment("start of epilogue")

//     for i in range(len(Riscv.CalleeSaved)):
//         if Riscv.CalleeSaved[i].isUsed():
//             self.printer.printInstr(
//                 Riscv.NativeLoadWord(Riscv.CalleeSaved[i], Riscv.SP, 4 * i)
//             )

//     self.printer.printInstr(Riscv.SPAdd(self.nextLocalOffset))
//     self.printer.printComment("end of epilogue")
//     self.printer.println("")

//     self.printer.printInstr(Riscv.NativeReturn())
//     self.printer.println("")

}


// void Function::emit_prologue_epilogue() {
  // bool gpr_used[NR_GPRS], fpr_used[NR_FPRS];
  // std::fill_n(gpr_used, NR_GPRS, false);
  // std::fill_n(fpr_used, NR_FPRS, false);

  // for (auto &bb : bbs) {
  //   for (auto &insn : bb->insns) {
  //     auto def = insn->def();
  //     for (Reg r : def) {
  //       if (!r.is_float())
  //         gpr_used[r.id] = true;
  //       else
  //         fpr_used[r.id] = true;
  //     }
  //   }
  // }

  // bool save_lr = gpr_used[lr];
  // std::vector<Reg> saved_gprs, saved_fprs;
  // for (int i = 0; i < NR_GPRS; ++i)
  //   if (GPRS_ATTR[i] == NonVolatile && gpr_used[i] && i != lr)
  //     saved_gprs.push_back(Reg{General, i});
  // if (save_lr)
  //   saved_gprs.push_back(Reg{General, lr});
  // for (int i = NR_VOLATILE_FPRS; i < NR_FPRS; ++i)
  //   if (fpr_used[i])
  //     saved_fprs.push_back(Reg{Fp, i});

  // auto entry = bbs.begin()->get();
  // auto exit = new BasicBlock;
  // exit->label = ".exit." + name;

  // int stack_obj_size = 0;
  // for (auto obj : normal_objs)
  //   stack_obj_size += obj->size;
  // stack_obj_size = round_up_to_imm8m(stack_obj_size);

  // // NOTE: 调用约定要求函数边界的sp按照8字节对齐
  // int frame_size = stack_obj_size + 4 * (saved_gprs.size() + saved_fprs.size());
  // if ((frame_size & 7) != 0) {
  //   frame_size += 4;
  //   saved_gprs.insert(saved_gprs.begin(), Reg{General, r3});
  // }

  // // emit prologue
  // auto &prologue = entry->insns;
  // // 每次都插入在头部，先生成后面的
  // if (stack_obj_size)
  //   prologue.emplace(prologue.begin(), new AdjustSp{-stack_obj_size});
  // if (!saved_fprs.empty())
  //   prologue.emplace(prologue.begin(), new Push{saved_fprs});
  // if (!saved_gprs.empty())
  //   prologue.emplace(prologue.begin(), new Push{saved_gprs});

  // // emit epilogue
  // auto &epilogue = exit->insns;
  // if (stack_obj_size)
  //   epilogue.emplace(epilogue.end(), new AdjustSp{stack_obj_size});
  // if (!saved_fprs.empty())
  //   epilogue.emplace(epilogue.end(), new Pop{saved_fprs});
  // if (!saved_gprs.empty()) {
  //   if (save_lr)
  //     saved_gprs.back().id = pc;
  //   epilogue.emplace(epilogue.end(), new Pop{saved_gprs});
  // }
  // if (!save_lr)
  //   epilogue.emplace(epilogue.end(), new Return);

  // bool trivial_return =
  //     !stack_obj_size && saved_fprs.empty() && saved_gprs.empty();
  // for (auto &bb_ptr : bbs) {
  //   auto bb = bb_ptr.get();
  //   auto &insns = bb->insns;
  //   if (!insns.empty()) {
  //     auto it = std::prev(insns.end());
  //     TypeCase(ret, Return *, it->get()) {
  //       if (!trivial_return) {
  //         BasicBlock::add_edge(bb, exit);
  //         it->reset(new Branch{exit});
  //       }
  //     }
  //   }
  // }
  // bbs.emplace_back(exit);

  // resolve_stack_ops(frame_size);
// }


}