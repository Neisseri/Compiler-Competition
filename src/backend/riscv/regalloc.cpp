#include "riscv.hpp"
#include "const.hpp"
namespace riscv {

void Function::replace_regs(std::map<Reg, int> reg_map) {
    for (auto &bb : bbs) {
        for (auto &inst: bb->instructions) {
            auto reg_ptrs = inst->reg_ptrs();
            for (auto p: reg_ptrs) {
                Reg old = *p;
                if (reg_map.count(old))
                    *p = Reg(old.type, reg_map.at(old));
            }
        }
    }
}

bool Function::alloc_reg_for(Reg temp, bool is_read, std::set<Reg> livein, 
    std::list<Instruction*>::iterator it,
    std::list<Instruction*> instructions) {
    // if there's vacancy in allocable regs
    // alloc
    if (bindings[temp]) return bindings[temp];
    for (auto r: allocable_regs) {
        if (!reg_occupied[r] || livein.count(reg_to_tmp[r])) {
            bindings[temp] = r;
            reg_occupied[r] = true;
            reg_to_tmp[r] = temp;
            return false;
        }
    }
    
    // spill to stack
    int r = rand() % 26;
    // store Reg r to stack
    instructions.emplace(it, new StoretoStack(Reg(General, r), offsets[r]));
    bindings[temp] = r;
    reg_occupied[r] = false;
    reg_to_tmp[r] = temp;
    // difference between read & write
    if (is_read) 
        // emit load from stack
        instructions.emplace(it, new LoadfromStack(Reg(General, r), offsets[r]));
    return true;
}

void Function::do_reg_alloc() {
    do_liveness_analysis();
    for (auto &bb: bbs) {
        bindings.clear();
        for (int i = 0; i < 32; i++) {
            if (is_allocable(i)) {
                allocable_regs.push_back(i);
                reg_occupied[i] = false;
            }
        }
        for (auto it = bb->instructions.begin(); it != bb->instructions.end(); ++it) {
            auto inst = *it;
            auto def = inst->def();
            for (auto i: def) {
                if (i.id < 0)
                    alloc_reg_for(i, true, inst->livein, it, bb->instructions);
            }
            auto use = inst->use();
            for (auto i: use) 
                if (i.id < 0)
                    alloc_reg_for(i, true, inst->livein, it, bb->instructions);
        }
        for (auto reg: bb->live_out) {
            if (bindings.count(reg)) {
                // store tmp to stack
                // decide offsets
                bb->instructions.emplace_back(new StoretoStack(reg, offsets[reg.id]));
            }
        }
        // for the last instruction
        // if (not bb.isEmpty) and (bb.kind is not BB.CONTINUE): self.allocForLoc(bb.locs[len(bb.locs)-1])
    }
}


void Function::emitend() {
    int reg_used[32];
    for (auto &bb : bbs) {
        for (auto &insn : bb->instructions) {
            auto def = insn->def();
            for (Reg r : def)
                reg_used[r.id] = true;
        }
    }

    auto entry = *bbs.begin();
    auto exit = new BasicBlock;
    exit->label = name + "_exit";

    int frame_size = 4 * 11 + 4;  // callee-saved regs + ra
    // add saved regs to frame_size
    // frame_size += reg_to_tmp.size() * 4;

    // emit prologue
    auto &prologue = entry->instructions;
    prologue.emplace(prologue.begin(), new SPAdd(-frame_size));
    int id = 0;
    for (int i = 0; i < NUM_REGS; i++) {// callee saved registers
        if (reg_used[i] && REG_ATTR[i] == CalleeSaved)
            prologue.emplace(prologue.begin(), new StoretoStack(Reg(General, i), 4 * id));
        id++;
    }
    // store ra
    prologue.emplace(prologue.begin(), new StoretoStack(Reg(General, ra), 44));
    // store spilled regs

    // emit epilogue
    auto &epilogue = exit->instructions;
    epilogue.emplace(epilogue.end(), new SPAdd(frame_size));
    for (int i = 0; i < NUM_REGS; i++) {// callee saved registers
        if (reg_used[i] && REG_ATTR[i] == CalleeSaved)
            prologue.emplace(prologue.begin(), new LoadfromStack(Reg(General, i), 4 * id));
        id++;
    }
    prologue.emplace(prologue.begin(), new LoadfromStack(Reg(General, ra), 44));
    epilogue.emplace(epilogue.end(), new Return);

    for (auto &bb : bbs) {
        auto &insns = bb->instructions;
            if (!insns.empty()) {
                auto it = std::prev(insns.end());
                //   TypeCase(ret, Return*, it->get()) {
                //     BasicBlock::add_edge(bb, exit);
                //     it->reset(new Branch{exit});
                //   }
        }
    }
    bbs.emplace_back(exit);

    //   resolve_stack_ops(frame_size);
}


}