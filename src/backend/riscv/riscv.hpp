#pragma once

#include "../../common/common.hpp"
#include "../../common/ir.hpp"
#include "../../common/label.hpp"
#include "const.hpp"

namespace riscv {
struct Instruction;

struct Reg {
    RegType type;
    int id;
    Reg(RegType type, int id): type(type), id(id) {}
    Reg() = default;
    bool operator==(const Reg &other) const {
        return type == other.type && id == other.id;
    }
    bool operator!=(const Reg &other) const { 
        return !(*this == other); 
    }
    bool operator<(const Reg &other) const {
        if (type != other.type)
            return type < other.type;
        return id < other.id;
    }
};

struct BasicBlock {
    BBType type;
    int id;
    std::string label;
    std::list<Instruction*> instructions;
    std::set<BasicBlock*> pred, succ;
    std::set<int> def, live_use, live_in, live_out;
    BasicBlock(BBType type, int id, std::string label):
        type(type), label(label), id(id) {}
    BasicBlock() = default;
    static void add_edge(BasicBlock *from, BasicBlock *to);
    static void remove_edge(BasicBlock *from, BasicBlock *to);
    void get_def_use_set();
    void post_order_dfs(std::unordered_set<BasicBlock*> &visited, std::vector<BasicBlock*> &rst); 
};

struct Instruction {
    InstType type;
    ir::Label* label;
    Instruction(InstType type): type(type) {}
    virtual ~Instruction() = default;
    virtual void emit(std::ostream &os) const {}
    virtual std::set<Reg> def() const { return {}; }
    virtual std::set<Reg> use() const { return {}; }
    virtual bool is_sequential() const { return type == InstType::SEQ; }
    virtual bool is_label() const { return type == InstType::LABEL; }
    virtual bool is_func_label() { return false; }
    std::set<int> livein, liveout;
};

struct Function {
    std::string name;
    ir::Label label;
    int reg_used[32];
    std::vector<std::unique_ptr<Instruction>> instrs;
    std::list<BasicBlock*> bbs;
    void do_liveness_analysis();
    std::vector<BasicBlock*> do_post_order_tranverse();
    std::vector<BasicBlock*> compute_post_order() const;
    void do_reg_alloc();
    int alloc_reg_for(Reg i, bool is_read, std::set<int>);
    void emit_prologue_epilogue() {}
    std::vector<int> allocable_regs;
    std::map<Reg, int> bindings;
    int temps[32];
    int available_reg_num;
};

struct Program {
    void cfg_build();
    std::vector<std::unique_ptr<Instruction>> instrs;
    std::list<BasicBlock*> bbs;
    std::unordered_map<std::string, Function> functions;
    int label_cnt;
    std::string new_label() {
        return ".L" + std::to_string(label_cnt++);
    }
    std::vector<std::string> buffer;
    Program() {}
    void emit(std::ostream &os);
    void emitEnd(std::ostream &os);
};

std::unique_ptr<Program> translate(const ir::Program &ir_prg);
void emit_global(std::ostream &os, const ir::Program &ir_prg);
struct Unary: Instruction {
    Reg dst, src;
    RiscvUnaryOp op;
    Unary(Reg dst, RiscvUnaryOp op, Reg src): dst(dst), op(op), src(src), Instruction(InstType::SEQ) {}
    void emit(std::ostream &os) const override;
    std::set<Reg> def() const override { return {dst}; }
    std::set<Reg> use() const override { return {src}; }
};

struct Binary: Instruction {
    Reg dst, src1, src2;
    RiscvUnaryOp op;
    Binary(Reg dst, RiscvUnaryOp op, Reg src1, Reg src2): dst(dst), op(op), src1(src1), src2(src2), Instruction(InstType::SEQ) {}
    void emit(std::ostream &os) const override;
    std::set<Reg> def() const override { return {dst}; }
    std::set<Reg> use() const override { return {src1, src2}; }
};

struct Return: Instruction {
    int ret_val;
    Return(int ret_val): ret_val(ret_val), Instruction(InstType::RET) {}
    void emit(std::ostream &os) const override;
    std::set<Reg> def() const override { return {}; }
    std::set<Reg> use() const override { return {}; }
};

struct Mark: Instruction {
    Mark(ir::Label* label): Instruction(InstType::LABEL) {}
    void emit(std::ostream &os) const override;
    bool is_func_label() { return label->type == LabelType::FuncLabel; }
};

}