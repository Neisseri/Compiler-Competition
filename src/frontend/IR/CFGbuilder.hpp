#pragma once

#include "../../common/ir.hpp"

class CFGbuilder {
public:
    ir::Function *ir_function;

    CFGbuilder(ir::Function *ir_function) : ir_function(ir_function) {}

    void CFG_print(std::ostream &os, int indent){
        for (auto bb : ir_function->bbs){
            bb->label.print(os, indent);
            os << std::string(indent + 2, ' ') << "prev: ";
            for (auto prev : bb->prevs){
                os << prev->label.toString() << " ";
            }
            os << std::endl;
            os << std::string(indent + 2, ' ') << "succ: ";
            for (auto succ : bb->succs){
                os << succ->label.toString() << " ";
            }
            os << std::endl;
        }
        os << std::endl;
    }

    void dom_tree_print(std::ostream &os, int indent){
        for (auto bb : ir_function->bbs){
            bb->label.print(os, indent);
            os << std::string(indent + 2, ' ') << "doms: ";
            for (auto dom : bb->doms){
                os << dom->label.toString() << " ";
            }
            os << std::endl;
            os << std::string(indent + 2, ' ') << "domed_by: ";
            for (auto dom : bb->dom){
                os << dom->label.toString() << " ";
            }
            os << std::endl;
        }
        os << std::endl;
    }

    void dom_fro_print(std::ostream &os, int indent){
        for (auto bb : ir_function->bbs){
            bb->label.print(os, indent);
            os << std::string(indent + 2, ' ') << "DF: ";
            for (auto df : bb->DF){
                os << df->label.toString() << " ";
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
            bb->reachable = 0;
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

    void visit_order_bb(std::shared_ptr<ir::BasicBlock> bb, int &num){
        bb->visited = 1;
        for (auto succ : bb->succs){
            if (!succ->visited){
                visit_order_bb(succ, num);
            }
        }
        bb->postorder_id = num++;
    }

    std::vector<std::shared_ptr<ir::BasicBlock>> get_reverse_postorder(){
        for (auto bb : ir_function->bbs){
            bb->visited = 0;
        }
        int order_num = 0;
        visit_order_bb(ir_function->bbs.front(), order_num);
        std::vector<std::shared_ptr<ir::BasicBlock>> result(ir_function->bbs.size());
        for (auto bb : ir_function->bbs){
            result[ir_function->bbs.size() - 1 - bb->postorder_id] = bb;
        }
        return result;
    }

    void build_dominator_tree(){
        std::shared_ptr<ir::BasicBlock> entry = ir_function->bbs.front();
        entry->dom.insert(entry);
        std::cerr << "entry" << entry->label.toString() << std::endl;
        for (auto i = std::next(ir_function->bbs.begin()); i != ir_function->bbs.end(); i ++){
            for (auto j : ir_function->bbs){
                i->get()->dom.insert(j);
            }
        std::cerr << (*i)->label.toString() << std::endl;
        }

        std::vector<std::shared_ptr<ir::BasicBlock>> reverse_postorder = get_reverse_postorder();
        bool changed = true;
        while (changed) {
            changed = false;
            for (auto &i : reverse_postorder){
                std::cerr << "reverse_postorder" << i->label.toString() << std::endl;
                std::set<std::shared_ptr<ir::BasicBlock>> new_set;
                if (i->prevs.size() > 0){
                    for(auto j : ir_function->bbs){
                        new_set.insert(j);
                    }
                }
                for(auto j : i->prevs){
                    std::set<std::shared_ptr<ir::BasicBlock>> temp;
                    set_intersection(new_set.begin(), new_set.end(), j->dom.begin(), j->dom.end(), inserter(temp, temp.begin()));
                    new_set = std::move(temp);
                }
                new_set.insert(i);
                if (new_set != i->dom){
                    i->dom = std::move(new_set);
                    changed = true;
                }
            }
        }

        for (auto i = std::next(ir_function->bbs.begin()); i != ir_function->bbs.end(); i ++){
            for (auto j : i->get()->dom){
                std::set<std::shared_ptr<ir::BasicBlock>> temp;
                set_intersection(i->get()->dom.begin(), i->get()->dom.end(), j->dom.begin(), j->dom.end(), inserter(temp, temp.begin()));
                std::set<std::shared_ptr<ir::BasicBlock>> temp2;
                set_difference(i->get()->dom.begin(), i->get()->dom.end(), temp.begin(), temp.end(), inserter(temp2, temp2.begin()));
                if (temp2.size() == 1 && temp2.find(*i)!=temp2.end()){
                    i->get()->idom = j;
                    j->doms.insert(*i);
                    break;
                }
            }
        }
    }

    void compute_dom_fro(){
        for (auto i : ir_function->bbs){
            i->DF.clear();
        }
        for (auto i : ir_function->bbs){
            for (auto p : i->prevs){
                std::shared_ptr<ir::BasicBlock> runner = p;
                while (i->dom.find(runner) == i->dom.end()){
                    runner->DF.insert(i);
                    runner = runner->idom;
                }
            }
        }

    }
};