#pragma once

#include "../common/common.hpp"
#include "../common/const.hpp"
#include "../common/error.hpp"

#include "../common/ir.hpp"

#include "../frontend/ast/tree.hpp"
#include "../frontend/ast/astVisitor.hpp"
#include "../frontend/IR/CFGbuilder.hpp"

#include "../frontend/IR/irgenerator.hpp"

#include <iostream>

class IROptimizer{
public:
    IRGenerator *ir_generator;
    std::unordered_map<std::string, ir::Reg> reaching_def;

    IROptimizer(IRGenerator *ir_generator) : ir_generator(ir_generator){}

    void visit_rename_regs(std::shared_ptr<ir::BasicBlock> ir_bb);
    void mem_to_reg();
    void dead_code_elimination();
    //常量传播
    // void constant_propagation();
};