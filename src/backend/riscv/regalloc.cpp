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

void Function::alloc_reg_for(Reg temp, bool is_read,
    std::list<Instruction*>::iterator it, std::list<Instruction*> instructions) {
    if (bindings[temp]) return;
    for (int i=0; i<26; i++) {
        int r = allocable_regs[i];
        if (!reg_occupied[r]) {
            if (is_read) { // emit load from stack
                // auto n = new LoadWord(Reg(General, r), Reg(General, sp), offsets[temp]);
                // n->emit(std::cout);
                instructions.emplace(it, new LoadWord(Reg(General, r), Reg(General, sp), offsets[temp]));
            }
            bindings[temp] = r;
            reg_occupied[r] = true;
            std::cout << "(case1) allocate reg for " << print_reg(temp) << " to " << print_reg(Reg(General, r)) << "\n";
            reg_to_tmp[r] = temp;
            return;
        }
    }
    
    int i = rand() % 26;
    int r = allocable_regs[i];
    if (!offsets[reg_to_tmp[r]]) { // store Reg r to stack
        offsets[reg_to_tmp[r]] = frame_size;
        frame_size += 4;
    }
    // auto n = new StoreWord(Reg(General, r), Reg(General, sp), offsets[reg_to_tmp[r]]);
    // n->emit(std::cout);
    instructions.emplace(it, new StoreWord(Reg(General, r), Reg(General, sp), offsets[reg_to_tmp[r]]));
    bindings[temp] = r;
    reg_occupied[r] = true;
    reg_to_tmp[r] = temp;
    std::cout << "(case2) allocate reg for " << print_reg(temp) << " to " << print_reg(Reg(General, r)) << "\n";
    if (is_read) { // emit load from stack 
        instructions.emplace(it, new LoadWord(Reg(General, r), Reg(General, sp), offsets[temp]));
        
        // auto n = new LoadWord(Reg(General, r), Reg(General, sp), offsets[temp]);
        // n->emit(std::cout);
    }
    return;
}

void Function::do_reg_alloc() {
    do_liveness_analysis();

    for (auto &bb: bbs) {
        bindings.clear();
        for (int i = 0; i < 32; i++) {
            if (is_allocable(i)) {
                // allocable_regs.push_back(i);
                reg_occupied[i] = false;
            }
        }
        for (auto it = bb->instructions.begin(); it != bb->instructions.end(); ++it) {
            auto inst = *it;
            auto def = inst->def();
            auto use = inst->use();
            for (auto temp: def)
                if (temp.id < 0) {// is virtual reg
                    alloc_reg_for(temp, false, it, bb->instructions);
                    inst->replace_reg(temp, Reg(General,bindings[temp]));
                }
            for (auto temp: use)
                if (temp.id < 0) {
                    alloc_reg_for(temp, true, it, bb->instructions);
                    inst->replace_reg(temp, Reg(General,bindings[temp]));
                }
        } for (auto temp: bb->live_out) {
            if (bindings.count(temp)) {
                if (!offsets[temp]) {
                    offsets[temp] = frame_size;
                    frame_size += 4;
                }
                // 这里的插入位置还需要调整
                auto last_inst = std::prev(bb->instructions.end());
                if (dynamic_cast<Branch*>(*std::prev(last_inst))) // 倒数第二条为beq时，插入到branch之前
                    bb->instructions.emplace(std::prev(last_inst), new StoreWord(Reg(General, bindings[temp]), Reg(General, sp), offsets[temp]));
                else
                    bb->instructions.emplace(last_inst, new StoreWord(Reg(General, bindings[temp]), Reg(General, sp), offsets[temp]));
            }
        }
    }
}


void Function::emitend() {
    int reg_used[32] = {false};
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

    // emit prologue
    auto &prologue = entry->instructions;
    int id = 0;
    for (int i = 0; i < NUM_REGS; i++) { // callee saved registers
        if (reg_used[i] && REG_ATTR[i] == CalleeSaved) {
            prologue.emplace(prologue.begin(), new StoreWord(Reg(General, i), Reg(General, sp), 4 * id));
            id++;
        }    
    }
    prologue.emplace(prologue.begin(), new StoreWord(Reg(General, ra), Reg(General, sp), 44)); // store ra
    // store spilled regs
    // for (auto [temp, offset]: offsets)
    //     prologue.emplace(prologue.begin(), new StoreWord(Reg(General, bindings[temp]), Reg(General, sp), offset));
    prologue.emplace(prologue.begin(), new SPAdd(-frame_size)); // change sp

    // emit epilogue
    auto &epilogue = exit->instructions;
    id = 0;
    for (int i = 0; i < NUM_REGS; i++) {// callee saved registers
        if (reg_used[i] && REG_ATTR[i] == CalleeSaved) {
            epilogue.emplace(epilogue.end(), new LoadWord(Reg(General, i), Reg(General, sp), 4 * id));
            id++;
        }
    }
    epilogue.emplace(epilogue.end(), new LoadWord(Reg(General, ra), Reg(General, sp), 44));
    epilogue.emplace(epilogue.end(), new SPAdd(frame_size));
    epilogue.emplace(epilogue.end(), new Return);

    for (auto &bb : bbs) {
        auto &insns = bb->instructions;
            if (!insns.empty()) {
                auto it = std::prev(insns.end());
                if (auto ret = dynamic_cast<Return*>(*it)) { // epilogue for all bbs that end with return
                    BasicBlock::add_edge(bb, exit);
                    *it = new Jump(exit); // unconditional branch
                }
        }
    }
    bbs.emplace_back(exit);
}


}