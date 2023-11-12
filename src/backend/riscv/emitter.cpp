
// namespace riscv {
    
// void backend_passes(Program &p) {
//   ColoringRegAllocator reg_allocator;

//   for (auto &[name, func] : p.functions) {
//     fold_constants(func);

//     merge_shift_with_binary_op(func);
//     merge_add_with_load_or_store(func);
//     merge_mul_with_add_or_sub(func);

//     func.resolve_phi();

//     propagate_constants(func);
//     remove_unused(func);

//     func.do_reg_alloc(reg_allocator, false); // fp reg
//     func.do_reg_alloc(reg_allocator);

//     remove_nop(func);

//     func.emit_prologue_epilogue();

//     sanitize_cfg(func);
//     if_to_cond(func);
//     sanitize_cfg(func);

//     func.replace_pseudo_insns();

//     implicit_compare_zero(func);
//   }
// }


// }