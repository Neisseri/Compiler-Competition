#include "riscv.hpp"

namespace riscv {

void BasicBlock::push(Instruction *insn) {
    instructions.emplace_back(insn); 
}

void BasicBlock::add_edge(BasicBlock *from, BasicBlock *to) {
    from->succ.insert(to);
    to->pred.insert(from);
}

void BasicBlock::remove_edge(BasicBlock *from, BasicBlock *to) {
    from->succ.erase(to);
    to->pred.erase(from);
}

void BasicBlock::post_order_dfs(std::unordered_set<BasicBlock*> &visited, std::vector<BasicBlock*> &rst) {
  if (visited.count(this))
    return;
  visited.insert(this);
  for (auto next: succ)
    next->post_order_dfs(visited, rst);
  rst.push_back(this);
}

void BasicBlock::getDefUseSet() {
  live_use.clear();
  def.clear();
  for (auto &inst: instructions) {
    auto def = inst->def();
    auto use = inst->use();
    for (auto &u: use)
      if (!def.count(u))
        live_use.insert(u);
    for (auto &d: def)
      def.insert(d);
  }
  live_in = live_use;
  live_out.clear();
}

std::vector<BasicBlock*> Function::doPostOrderTranverse() {
  std::vector<BasicBlock*> rst;
  std::unordered_set<BasicBlock*> visited;
  bbs.front().get()->post_order_dfs(visited, rst);
  return rst;
}

void Function::do_liveness_analysis() {
  for (auto &bb: bbs) 
    bb->getDefUseSet();
  std::vector<BasicBlock*> order = doPostOrderTranverse();
  std::reverse(order.begin(), order.end());
  bool changed = true;
  while (changed) {
    changed = false;
    for (auto bb: order) {
      std::set<Reg> new_out;
      for (auto succ: bb->succ)
        new_out.insert(succ->live_in.begin(), succ->live_in.end());
      if (bb->live_out != new_out) {
        bb->live_out = std::move(new_out);
        changed = true;
        auto new_in = bb->live_use;
        for (auto &e: bb->live_out)
          if (!bb->def.count(e))
            new_in.insert(e);
        bb->live_in = std::move(new_in);
      }
    }
  }
}

}