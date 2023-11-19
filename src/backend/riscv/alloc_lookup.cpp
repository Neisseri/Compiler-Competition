void ColoringRegAllocator::do_reg_alloc(Function &func, bool is_gp_pass) {
  init(func, is_gp_pass);

  std::map<Reg, int> color;
  bool done = false;

  // int i = 0;
  do {
    // printf("function %s loop %d\n", f->name.c_str(), ++i);

    f->do_liveness_analysis(this->reg_filter);
    build();
    make_worklist();

    do {
      if (!simplify_worklist.empty())
        simplify();
      else if (!worklist_moves.empty())
        coalesce();
      else if (!freeze_worklist.empty())
        freeze();
      else if (!spill_worklist.empty())
        select_spill();
    } while (!simplify_worklist.empty() || !worklist_moves.empty() ||
             !freeze_worklist.empty() || !spill_worklist.empty());

    color = assign_colors();
    if (!spilled_nodes.empty()) {
      // printf("%ld regs spilled\n", spilled_nodes.size());
      // printf("spilled regs:\n");
      // for (Reg n : spilled_nodes)
      //   std::cout << ">>> " << n << '\n';
      // printf("\n\n\n");
      // f->emit(std::cout);

      // 这里不清空spilling_regs，其内容应当累积
      add_spill_code(spilled_nodes);
      spilled_nodes.clear();
      colored_nodes.clear();
      coalesced_nodes.clear();
      continue;
    }
    if (is_gp_pass && !f->check_and_resolve_stack_store())
      continue;
    done = true;
  } while (!done);

  replace_virtual_regs(color);

  // printf("\n\nafter replacement\n\n");
  // f->emit(std::cout);
}


void ColoringRegAllocator::init(Function &func, bool is_gp_pass) {
  this->f = &func;
  this->is_gp_pass = is_gp_pass;
  if (is_gp_pass) {
    K = 14; // 16个通用寄存器去掉sp和pc
    this->reg_filter = [](Reg const &reg) { return !reg.is_float(); };
  } else {
    K = NR_FPRS; // 32个单精度vfp寄存器
    this->reg_filter = [](Reg const &reg) { return reg.is_float(); };
  }

  alias.clear();
  move_list.clear();

  // 每次循环后3个xxx_worklist和select_stack总是空的
  spilled_nodes.clear();
  colored_nodes.clear();
  coalesced_nodes.clear();

  coalesced_moves.clear();
  constrained_moves.clear();
  frozen_moves.clear();
  worklist_moves.clear();
  active_moves.clear();

  spilling_regs.clear();
}

void ColoringRegAllocator::replace_virtual_regs(
    const std::map<Reg, int> &reg_map) {
  for (auto &bb : f->bbs) {
    for (auto &insn : bb->insns) {
      auto reg_ptrs = insn->reg_ptrs();

      // auto ins = dynamic_cast<Move *>(insn.get());
      // bool verbose = coalesced_moves.count(ins);
      // if (verbose) {
      //   printf("replacing coalesced move: ");
      //   ins->emit(std::cout);
      //   printf("\n\n");
      // }

      for (auto p : reg_ptrs) {
        Reg old = *p;
        if (reg_map.count(old))
          *p = Reg{old.type, reg_map.at(old)};
        // if (verbose) {
        //   std::cout << old << " --> " << *p << '\n';
        // }
      }

      // if (verbose) {
      //   printf("replaced coalesced move: ");
      //   ins->emit(std::cout);
      //   printf("\n\n");
      // }
    }
  }
}


std::map<Reg, int> ColoringRegAllocator::assign_colors() {
  std::map<Reg, int> color;
  while (!select_stack.empty()) {
    Reg n = select_stack.back();
    select_stack.pop_back();

    if (!n.is_virt())
      continue;

    std::set<int> avail_colors;
    if (is_gp_pass) {
      for (int i = 0; i <= 12; ++i)
        avail_colors.insert(r0 + i);
      avail_colors.insert(lr);
    } else {
      for (int i = 0; i < NR_FPRS; ++i)
        avail_colors.insert(s0 + i);
    }

    for (Reg w : adj_list[n]) {
      Reg u = get_alias(w);
      if (!u.is_virt())
        avail_colors.erase(u.id);
      else if (colored_nodes.count(u))
        avail_colors.erase(color[u]);
    }

    if (avail_colors.empty())
      spilled_nodes.insert(n);
    else {
      colored_nodes.insert(n);
      color[n] = *avail_colors.begin();
    }
  }

  for (Reg n : coalesced_nodes) {
    if (n.is_virt()) {
      Reg u = get_alias(n);
      color[n] = u.is_virt() ? color[u] : u.id;
    }
  }

  // printf("color assignment: \n");
  // for (auto &[r, id] : color)
  //   std::cout << r << " --> " << id << '\n';
  return color;
}