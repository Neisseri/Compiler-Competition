#include <unordered_map>
#include <string>

#include "riscv.hpp"
#include "../../common/const.hpp"
#include "../../common/ir.hpp"

namespace riscv {
  
  void Function::select_instr(ir::Instruction* ir_inst, BasicBlock* bb,
    std::unordered_map<ir::BasicBlock*, BasicBlock*> bb_map,
    std::set<std::string> func_defined) {
    if (auto alloca = dynamic_cast<ir::Alloca*>(ir_inst)) {
      Reg r = Reg(alloca->ret_val);
      alloca_offsets[r] = frame_size;
      alloca_sizes[r] = alloca->size;
      frame_size += alloca->size;
      if (alloca_offsets[r] >= 2048) {
        bb->instructions.emplace_back(new LUI(r, alloca_offsets[r]/2048));
        bb->instructions.emplace_back(new ADDI(r, Reg(General, sp), alloca_offsets[r]%2048));
      }
      else {
        bb->instructions.emplace_back(new ADDI(r, Reg(General, sp), alloca_offsets[r]));
      }
    } else if (auto load = dynamic_cast<ir::Load*>(ir_inst)) {
      Reg dst = Reg(load->ret_val);
      Reg src = Reg(load->ptr);
      bb->instructions.emplace_back(new LoadWord(dst, src, 0));
    } else if (auto store = dynamic_cast<ir::Store*>(ir_inst)) {
      Reg dst = Reg(store->ptr);
      Reg src = Reg(store->src_val);
      bb->instructions.emplace_back(new StoreWord(src, dst, 0));
    } else if (auto binary = dynamic_cast<ir::Binary*>(ir_inst)) {
      Reg dst = Reg(binary->dst);
      Reg src1 = Reg(binary->src1);
      Reg src2 = Reg(binary->src2);
      switch (binary->op) {
        case BinaryOpEnum::ADD: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::ADD, src1, src2));
          break;
        } case BinaryOpEnum::EQ: {
          // sub d, s1, s2; seqz d, d;
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SUB, src1, src2));
          bb->instructions.emplace_back(new Unary(dst, RiscvUnaryOp::SEQZ, dst));
          break;
        } case BinaryOpEnum::SUB: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SUB, src1, src2));
          break;
        } case BinaryOpEnum::MUL: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::MUL, src1, src2));
          break;
        } case BinaryOpEnum::DIV: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::DIV, src1, src2));
          break;
        } case BinaryOpEnum::SHL: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SHL, src1, src2));
          break;
        } case BinaryOpEnum::LSHR: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SRL, src1, src2));
          break;
        } case BinaryOpEnum::ASHR: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SRA, src1, src2));
          break;
        } case BinaryOpEnum::AND: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::AND, src1, src2));
          break;
        } case BinaryOpEnum::OR: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::OR, src1, src2));
          break;
        } case BinaryOpEnum::XOR: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::XOR, src1, src2));
          break;
        } case BinaryOpEnum::SGT: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SGT, src1, src2));
          break;
        } case BinaryOpEnum::SLT: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SLT, src1, src2));
          break;
        } case BinaryOpEnum::SGE: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SLT, src1, src2));
          bb->instructions.emplace_back(new Unary(dst, RiscvUnaryOp::SEQZ, dst));
          break;
        } case BinaryOpEnum::SLE: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SGT, src1, src2));
          bb->instructions.emplace_back(new Unary(dst, RiscvUnaryOp::SEQZ, dst));
          break;
        } case BinaryOpEnum::NE: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SUB, src1, src2));
          bb->instructions.emplace_back(new Unary(dst, RiscvUnaryOp::SNEZ, dst));
          break;
        } case BinaryOpEnum::MOD: {
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::DIV, src1, src2));
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::MUL, dst, src2));
          bb->instructions.emplace_back(new Binary(dst, RiscvBinaryOp::SUB, src1, dst));
        }
        default: break;
      }
    } else if (auto ret = dynamic_cast<ir::Return*>(ir_inst)) {
      Reg src = Reg(ret->ret_val);
      bb->instructions.emplace_back(new Move(src, Reg(General, a0)));
      bb->instructions.emplace_back(new Return(src));
    } else if (auto branch = dynamic_cast<ir::Branch*>(ir_inst)) {
      // br label B1
      // beq zero, zero, B1
      auto targ = bb_map[branch->bb_dst.get()];
      BasicBlock::add_edge(bb, targ);
      bb->instructions.emplace_back(new Jump(targ));
    } else if (auto cond_branch = dynamic_cast<ir::CondBranch*>(ir_inst)) {
      // br int %3, label B1, label B2
      // beq zero, %3, B1; j B2;
      Reg src = Reg(cond_branch->cond);
      auto true_target = bb_map[cond_branch->bb_true.get()];
      auto false_target = bb_map[cond_branch->bb_false.get()];
      BasicBlock::add_edge(bb, true_target);
      BasicBlock::add_edge(bb, false_target);
      bb->instructions.emplace_back(new Branch(src, false_target));
      bb->instructions.emplace_back(new Jump(true_target));
    } else if (auto loadint = dynamic_cast<ir::LoadInt*>(ir_inst)) {
      Reg dst = Reg(loadint->dst);
      bb->instructions.emplace_back(new LoadImm(dst, loadint->val));
    } else if (auto call = dynamic_cast<ir::Call *>(ir_inst)) {
      Reg ret_val = Reg(call->ret_val);
      int num_args = call->params.size();
      // if (func_defined.count(call->func_name)) {
      //   bb->instructions.emplace_back(new ADDI(Reg(General, sp), Reg(General, sp), - 4 * num_args));
      //   for (int i = 0; i < num_args; i++) {
      //     Reg src_reg = Reg(call->params[i]);
      //     bb->instructions.emplace_back(new StoreWord(src_reg, Reg(General, sp), 4 * i));
      //   }
      //   bb->instructions.emplace_back(new Move(Reg(General, sp), Reg(General, 31)));
      //   bb->instructions.emplace_back(new Call(call->func_name, num_args));
      //   bb->instructions.emplace_back(new Move(Reg(General, a0), ret_val));
      //   bb->instructions.emplace_back(new ADDI(Reg(General, sp), Reg(General, sp), 4 * num_args));
      // }
      // else {
      for (int i = 0; i < num_args; i++) {
        Reg src_reg = Reg(call->params[i]);
        bb->instructions.emplace_back(new Move(src_reg, Reg(General, argregs[i])));
      }
      bb->instructions.emplace_back(new Call(call->func_name, num_args));
      bb->instructions.emplace_back(new Move(Reg(General, a0), ret_val));
      // }
    } else if (auto phi = dynamic_cast<ir::Phi*>(ir_inst)) {
      std::vector<std::pair<Reg, BasicBlock*>> scrs;
      for (auto i: phi->srcs) {
        std::cerr << print_reg(Reg(i.first)) << " ";
        std::cerr << print_bb(bb_map[i.second.get()]) << "\n";
        scrs.push_back(std::pair(Reg(i.first), bb_map[i.second.get()]));
      }
      bb->instructions.emplace_back(new Phi(Reg(phi->dst), scrs));
    } else if (auto load_symb = dynamic_cast<ir::LoadAddr*>(ir_inst)) {
      bb->instructions.emplace_back(new LoadAddr(Reg(load_symb->ret_val), load_symb->var_name.substr(0, load_symb->var_name.length()-2)));
    }
  }

  Program::Program(ir::Program ir_program) {
    for (auto b: ir_program.global_defs) {
      global_defs.push_back(dynamic_cast<ir::GlobalDef*>(b));
    }
    std::set<std::string> func_defined;
    for (auto &[name, func]: ir_program.functions)
      func_defined.insert(name);
    for (auto &[name, func]: ir_program.functions)
      functions[name] = new Function(func, name, func_defined);
  }

  void Function::resolve_phi() {
    std::unordered_map<BasicBlock*, std::set<std::pair<Reg, Reg>>> pair_map;
    for (auto bb: bbs) {
      auto it = bb->instructions.begin();
      while (it != bb->instructions.end()) {
        auto inst = *it;
        if (auto phi = dynamic_cast<Phi*>(inst)) {
          for (auto i: phi->srcs)
            pair_map[i.second].insert({phi->dst, i.first});
          it = bb->instructions.erase(it);
        }
        else {
          it++;
        }
      }
    }
    for (auto [bb, pairs]: pair_map) {
      while (!std::all_of(pairs.begin(), pairs.end(), [](const auto p){ return p.first == p.second; })) {
        std::set<Reg> livein;
        for (auto [dst, src]: pairs) 
          livein.insert(src);
        Move* mov = nullptr;
        bool has_erase = false;
        for (auto p: pairs) {
          if (!livein.count(p.first)) {
            auto [dst, src] = p;
            mov = new Move(src, dst);
            pairs.erase(p);
            has_erase = true;
            break;
          }
        }
        if (!has_erase) {
          for (auto p: pairs) {
            if (p.first != p.second) {
              Reg tmp = freshTemp();
              mov = new Move(p.second, tmp);
              p.second = tmp;
            }
          }
        }
        bb->instructions.emplace(std::prev(bb->instructions.end()), mov);
        phi_moves.insert(mov);
      }
    }
  }

  Function::Function(ir::Function& ir_function, const std::string& name, std::set<std::string> func_defined): name(name) {
    auto entry_bb = new BasicBlock;
    num_regs = ir_function.num_regs;
    bbs.emplace_back(entry_bb);
    num_params = ir_function.param_types.size();
    frame_size = 4 * 11 + 4;
    std::unordered_map<ir::BasicBlock*, BasicBlock*> bb_map;
    std::set<int> arg_idxs;
    for (int i = 0; i < num_params; i++) {
      arg_idxs.insert(-(i+1));
    }
    for (auto &ir_bb: ir_function.bbs) {
        auto bb = new BasicBlock;
        bbs.emplace_back(bb);
        bb_map[ir_bb.get()] = bb;
    }
    auto bb_front = bb_map[ir_function.bbs.front().get()];
    BasicBlock::add_edge(entry_bb, bb_front);
    for (auto &ir_bb: ir_function.bbs) {
        auto bb = bb_map[ir_bb.get()];
        bb->instructions.clear();
        for (auto &inst: ir_bb->instrs)
          select_instr(inst.get(), bb, bb_map, func_defined);

        // std::cout << "before allocating regs\n";
        // for (auto &inst: bb->instructions) 
        //   inst->emit(std::cout);

        // std::cout << "pred: ";
        // for (auto &prevs: bb->pred) 
        //   std::cout << print_bb(prevs) << " ";
        // std::cout << "\n";
        // std::cout << "succ: ";
        // for (auto &prevs: bb->succ) 
        //   std::cout << print_bb(prevs) << " ";
        // std::cout << "\n";
    }
    for (auto bb: bbs) {
      for (auto inst: bb->instructions) {
        auto reg_ptrs = inst->reg_ptrs();
        for (auto &r: reg_ptrs) {
          if (arg_idxs.count(r->id)) {
            *r = Reg(General, argregs[-1-r->id]);
          }
        }
      }
    }
  }

}