#include "riscv.hpp"

namespace riscv {

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

void BasicBlock::get_def_use_set() {
  live_use.clear();
  def.clear();
  for (auto &inst: instructions) {
    inst->emit(std::cout);
    auto inst_def = inst->def();
    auto inst_use = inst->use();
    std::cout << "def set: ";
    for (auto& i: inst_def)
      std::cout << print_reg(i) << " ";
    std::cout << "\n";
    std::cout << "use set: ";
    for (auto& i: inst_use)
      std::cout << print_reg(i) << " ";
    std::cout << "\n";
    for (auto &u: inst_use)
      if (!inst_def.count(u))
        live_use.insert(u);
    for (auto &d: inst_def)
      def.insert(d);
  }
  live_in = live_use;
  live_out.clear();
}

std::vector<BasicBlock*> Function::do_post_order_tranverse() {
  std::vector<BasicBlock*> rst;
  std::unordered_set<BasicBlock*> visited;
  bbs.front()->post_order_dfs(visited, rst);
  return rst;
}

void Function::do_liveness_analysis() {
  for (auto &bb: bbs) 
    bb->get_def_use_set();
  std::cout << "compute def and use\n";
  for (auto& bb: bbs) {
    std::cout << "def set of " << print_bb(bb) << ": ";
    for (auto& i: bb->def)
      std::cout << print_reg(i) << " ";
    std::cout << "\n";
    std::cout << "live_use set of " << print_bb(bb) << ": ";
    for (auto& i: bb->live_use)
      std::cout << print_reg(i) << " ";
    std::cout << "\n";
  }
  std::vector<BasicBlock*> order = do_post_order_tranverse();
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
  // compute livein & liveout for each inst in bb
  for (auto& bb: bbs) {
    std::set<Reg> liveout = std::move(bb->live_out);
    for (auto i = bb->instructions.rbegin(); i != bb->instructions.rend(); i++) {
      auto inst = i->get();
      inst->liveout = std::move(liveout);
      for (auto j: inst->def())
        liveout.erase(j);
      for (auto j: inst->use())
        liveout.insert(j);
      inst->livein = std::move(liveout);
    }
  }

  std::cout << "after liveness analysis\n";

  for (auto& bb: bbs) {
    std::cout << "def set of " << print_bb(bb) << ": ";
    for (auto& i: bb->def)
      std::cout << print_reg(i) << " ";
    std::cout << "\n";
    std::cout << "live_use set of " << print_bb(bb) << ": ";
    for (auto& i: bb->live_use)
      std::cout << print_reg(i) << " ";
    std::cout << "\n";
    std::cout << "live_in set of " << print_bb(bb) << ": ";
    for (auto& i: bb->live_in)
      std::cout << print_reg(i) << " ";
    std::cout << "\n";
    std::cout << "live_use set of " << print_bb(bb) << ": ";
    for (auto& i: bb->live_out)
      std::cout << print_reg(i) << " ";
    std::cout << "\n";
  }

}

}