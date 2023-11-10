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

void BasicBlock::get_def_use_set() {
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

void Function::build_basic_blocks() {
  std::list<std::unique_ptr<Instruction>> buf;

  for (auto &i: instrs) {
    if (i->is_label()) {
      
    }
    buf.push_back(i);
    BBType bbtype = BBType::UNDEFINED;
    if (!i->is_sequential()) {
      if (i->type == InstType::JMP){
        bbtype = BBType::END_BY_JUMP;
      }
      else if (i->type == InstType::COND_JMP){
        bbtype = BBType::END_BY_COND_JUMP;
      }
      else if (i->type == InstType::RET){
        bbtype = BBType::END_BY_RETURN;
      }
      BasicBlock bb = BasicBlock(bbtype, bbs.size(), label, buf);
      bbs.push_back(&bb);
    }
    buf.push_back(i);
  }
}

std::vector<BasicBlock*> Function::do_post_order_tranverse() {
  std::vector<BasicBlock*> rst;
  std::unordered_set<BasicBlock*> visited;
  bbs.front().get()->post_order_dfs(visited, rst);
  return rst;
}

void Function::do_liveness_analysis() {
  for (auto &bb: bbs) 
    bb->get_def_use_set();
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
}

}