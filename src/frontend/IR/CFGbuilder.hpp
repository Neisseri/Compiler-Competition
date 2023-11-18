#pragma once

#include "../../common/ir.hpp"

class CFGbuilder {
public:
    ir::Function *ir_function;

    CFGbuilder(ir::Function *ir_function) : ir_function(ir_function) {}

    void CFG_print(std::ostream &os, int indent){
        for (auto bb : ir_function->bbs){
            bb->label.print(os, indent);
            os << "prev: ";
            for (auto prev : bb->prevs){
                os << prev->label.toString() << " ";
            }
            os << std::endl;
            os << "succ: ";
            for (auto succ : bb->succs){
                os << succ->label.toString() << " ";
            }
            os << std::endl;
        }
        os << std::endl;
    }

    void CFG_build(){
        for (auto bb : ir_function->bbs){
            bb->prevs.clear();
            bb->succs.clear();
        }

        for (auto bb : ir_function->bbs){
            if (bb->instrs.empty()){
                continue;
            }
            if (auto br = dynamic_cast<ir::Branch *>(bb->instrs.back().get())){
                br->bb_dst->prevs.insert(bb);
                bb->succs.insert(br->bb_dst);
            }
            else if (auto condbr = dynamic_cast<ir::CondBranch *>(bb->instrs.back().get())){
                condbr->bb_true->prevs.insert(bb);
                condbr->bb_false->prevs.insert(bb);
                bb->succs.insert(condbr->bb_true);
                bb->succs.insert(condbr->bb_false);
            }
            else if (auto ret = dynamic_cast<ir::Return *>(bb->instrs.back().get())){
                // nothing to do.
            }
            else {
                assert(false);
            }
        }
    }

    void dfs_visit_bb(std::shared_ptr<ir::BasicBlock> bb){
        bb->reachable = 1;
        for (auto succ : bb->succs){
            if (!succ->reachable){
                dfs_visit_bb(succ);
            }
        }
    }

    void remove_unreachable_bb(){
        for (auto bb : ir_function->bbs){
            bb->reachable = 0;;
        }
        dfs_visit_bb(ir_function->bbs.front());

        for (auto it = ir_function->bbs.begin(); it != ir_function->bbs.end();){
            if ((*it)->reachable){
                it ++;
            }else {
                for (auto succ : (*it)->succs){
                    succ->prevs.erase(*it);
                }
                for (auto prev : (*it)->prevs){
                    prev->succs.erase(*it);
                }
                it = ir_function->bbs.erase(it);
            }
        }
    }
};