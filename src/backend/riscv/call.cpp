      // // NOTE: 需要用栈传的参数现在是push入栈的，这要求调用后的sp调整量完全匹配
      // // 另一种方式是先减sp，然后生成StoreStack
      // int nr_args, nr_gp_args, nr_fp_args;
      // std::vector<int> reg_args, stack_args;
      // nr_gp_args = nr_fp_args = 0;
      // nr_args = call->args.size();

      // for (int i = 0; i < nr_args; ++i) {
      //   Reg arg_reg = Reg::from(call->args[i]);
      //   if (!arg_reg.is_float()) {
      //     if (nr_gp_args++ < NR_ARG_GPRS)
      //       reg_args.push_back(i);
      //     else
      //       stack_args.push_back(i);
      //   } else {
      //     if (nr_fp_args++ < NR_ARG_FPRS)
      //       reg_args.push_back(i);
      //     else
      //       stack_args.push_back(i);
      //   }
      // }

      // int sp_adjustment =
      //     4 * stack_args.size(); // NOTE: 目前所有标量类型都是4字节
      // // NOTE: 调用约定要求函数边界的sp按照8字节对齐
      // if ((sp_adjustment & 7) != 0) {
      //   sp_adjustment += 4;
      //   bb->push(new AdjustSp{-4});
      // }

      // for (auto it = stack_args.rbegin(); it != stack_args.rend(); ++it) {
      //   Reg arg_reg = Reg::from(call->args[*it]);
      //   bb->push(new Push{{arg_reg}});
      // }
      // nr_gp_args = nr_fp_args = 0;
      // for (auto i : reg_args) {
      //   Reg arg_reg = Reg::from(call->args[i]);
      //   if (!arg_reg.is_float()) {
      //     bb->push(new Move{Reg{arg_reg.type, r0 + nr_gp_args++},
      //                       Operand2::from(arg_reg)});
      //   } else {
      //     bb->push(
      //         new Move{Reg{Fp, s0 + nr_fp_args++}, Operand2::from(arg_reg)});
      //   }
      // }
      // bb->push(new Call{call->func, nr_gp_args, nr_fp_args, call->variadic_at});
      // // 这里钻了个空子，这个语法中函数的返回值只能是int或float
      // // 如果接收返回值的寄存器类型是String表明实际上无返回值
      // if (call->dst.type != String)
      //   bb->push(
      //       new Move{Reg::from(call->dst),
      //                Operand2::from(Reg::from(call->dst.type, 0))}); // r0或s0

      // if (sp_adjustment != 0)
      //   bb->push(new AdjustSp{sp_adjustment});