#include "riscv.hpp"
#include "const.hpp"
namespace riscv {

int Function::alloc_reg_for(Reg temp, bool is_read, std::set<int> livein) {
    // if there's vacancy in allocable regs
    // alloc
    if (bindings[temp]) return bindings[temp];
    for (auto r: allocable_regs) {
        if (!reg_used[r] || livein.find(temps[r]) != livein.end()) {
            bindings[temp] = r;
            reg_used[r] = true;
            temps[r] = temp.id;
            return r;
        }
    }
    
    // spill to stack
    int r = rand() % available_reg_num;
    // store Reg r to stack
    
    bindings[temp] = r;
    reg_used[r] = false;
    temps[r] = temp.id;
    
    return 0;
}

void Function::do_reg_alloc() {
    available_reg_num = 26;
    do_liveness_analysis();
    bindings.clear();
    for (int i = 0; i < 32; i++)
        if (is_allocable(i)) {
            allocable_regs.push_back(i);
            reg_used[i] = false;
        }
    
    for (auto &bb: bbs) {
        bindings.clear();
        // for reg in self.allocatableRegs: reg.occupied = False
        // for each instruction
        for (auto inst: bb->instructions) {
            auto def = inst->def();
            for (auto i: def) {
                // if is_instance(i, Reg) do nothing
                if (i.id < 0) { // virtual Reg
                    alloc_reg_for(i, true, inst->livein);
                }
                // else alloc Reg for i (i is Temp)
            }
            auto use = inst->use();
            for (auto i: use) {

            }

            // after alloc, emit riscv native code

        }
        // for loc in bb.seq(): self.allocForLoc(loc)
        // for tmpidx in bb.liveout: if tmpindex in self.bindings: emitStoretoStack(tmpindex)
        // for the last instruction
        // if (not bb.isEmpty) and (bb.kind is not BB.CONTINUE): self.allocForLoc(bb.locs[len(bb.locs)-1])
    }
}


void Function::emit_prologue_epilogue() {
  for (auto &bb : bbs) {
    for (auto &insn : bb->instructions) {
      auto def = insn->def();
      for (Reg r : def)
        reg_used[r.id] = true;
    }
  }

  std::vector<Reg> saved_regs;
  for (int i = 0; i < NUM_REGS; ++i)
    if (REG_ATTR[i] == CalleeSaved && reg_used[i])
      saved_regs.push_back(Reg(General, i));

  auto entry = *bbs.begin();
  auto exit = new BasicBlock;
  exit->label = ".exit." + name;

  int stack_obj_size = 0;
  int frame_size = stack_obj_size + 4 * (saved_regs.size());

  // emit prologue
  auto &prologue = entry->instructions;
  if (stack_obj_size)
    prologue.emplace(prologue.begin(), new AdjustSp{-stack_obj_size});
  if (!saved_regs.empty())
    prologue.emplace(prologue.begin(), new Push{saved_regs});

  // emit epilogue
  auto &epilogue = exit->instructions;
  if (stack_obj_size)
    epilogue.emplace(epilogue.end(), new AdjustSp{stack_obj_size});
  if (!saved_regs.empty())
    epilogue.emplace(epilogue.end(), new Pop{saved_fprs});
  epilogue.emplace(epilogue.end(), new Return);

  for (auto &bb : bbs) {
    auto &insns = bb->instructions;
    if (!insns.empty()) {
      auto it = std::prev(insns.end());
      TypeCase(ret, Return *, it->get()) {
        BasicBlock::add_edge(bb, exit);
        it->reset(new Branch{exit});
      }
    }
  }
  bbs.emplace_back(exit);

  resolve_stack_ops(frame_size);
}



}