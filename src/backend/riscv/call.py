for i in range(len(instr.param_reg_list)):
    self.seq.append(Riscv.Move(
        Riscv.ArgRegs[i], instr.param_reg_list[i]
    ))
self.seq.append(Riscv.FunctionCall(instr.label.name, instr.param_reg_list))