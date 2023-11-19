#include "riscv.hpp"
namespace riscv {

void Function::do_reg_alloc() {
    int available_regs = 26;
    std::map<Reg, int> bindings;
    do_liveness_analysis();
    for (auto &bb: bbs) {
        bindings.clear();
        // for reg in self.allocatableRegs: reg.occupied = False
        // for each instruction
        for (auto &inst: bb->instructions) {
            auto def = inst->def();
            for (auto i: def) {
                // if is_instance(i, Reg) do nothing
                // else alloc Reg for i (i is Temp)
            }
            auto use = inst->use();
            for (auto i: use) {

            }

        }
        // for loc in bb.seq(): self.allocForLoc(loc)
        // for tmpidx in bb.liveout: if tmpindex in self.bindings: emitStoretoStack(tmpindex)
        // for the last instruction
        // if (not bb.isEmpty) and (bb.kind is not BB.CONTINUE): self.allocForLoc(bb.locs[len(bb.locs)-1])
    }
}

}