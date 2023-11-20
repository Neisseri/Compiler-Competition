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
    std::set<Reg> def, live_use, live_in, live_out;
    BasicBlock(BBType type, int id, std::string label):
        type(type), label(label), id(id) {}
    BasicBlock() = default;
    static void add_edge(BasicBlock *from, BasicBlock *to);
    static void remove_edge(BasicBlock *from, BasicBlock *to);
    void get_def_use_set();
    void post_order_dfs(std::unordered_set<BasicBlock*> &visited, std::vector<BasicBlock*> &rst); 
};

struct Instruction {
    Instruction() {}
    virtual ~Instruction() = default;
    void emit(std::ostream &os) const {}
    std::set<Reg> def() const { return {}; }
    std::set<Reg> use() const { return {}; }
    std::set<Reg> livein, liveout;
    std::vector<Reg*> reg_ptrs() { return {}; }
};

struct Function {
    std::string name;
    ir::Label label;
    int reg_occupied[32];
    std::vector<std::unique_ptr<Instruction>> instrs;
    std::list<BasicBlock*> bbs;
    void do_liveness_analysis();
    std::vector<BasicBlock*> do_post_order_tranverse();
    std::vector<BasicBlock*> compute_post_order() const;
    void do_reg_alloc();
    void alloc_reg_for(Reg i, bool is_read, std::set<Reg> livein, 
        std::list<Instruction*>::iterator it, std::list<Instruction*> instructions);
    void emitend();
    int frame_size;
    std::vector<int> allocable_regs;
    std::vector<int> callee_saved_regs;
    std::map<Reg, int> bindings;
    std::map<int, Reg> reg_to_tmp;
    int temps[32];
    void replace_regs(std::map<Reg, int> reg_map);
    std::map<Reg, int> offsets; // virtual reg -> stack offset
    void emit(std::ostream &os);
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
    Unary(Reg dst, RiscvUnaryOp op, Reg src): dst(dst), op(op), src(src), Instruction() {}
    void emit(std::ostream &os) const;
    std::set<Reg> def() const { return {dst}; }
    std::set<Reg> use() const { return {src}; }
    std::vector<Reg*> reg_ptrs() { return {&dst, &src}; }
};

struct Binary: Instruction {
    Reg dst, src1, src2;
    RiscvUnaryOp op;
    Binary(Reg dst, RiscvUnaryOp op, Reg src1, Reg src2): dst(dst), op(op), src1(src1), src2(src2), Instruction() {}
    void emit(std::ostream &os) const;
    std::set<Reg> def() const { return {dst}; }
    std::set<Reg> use() const { return {src1, src2}; }
    std::vector<Reg*> reg_ptrs() { return {&dst, &src1, &src2}; }
};

struct Return: Instruction {
    int ret_val;
    Return(int ret_val): ret_val(ret_val), Instruction() {}
    Return() = default;
    void emit(std::ostream &os) const;
    std::set<Reg> def() const { return {}; }
    std::set<Reg> use() const { return {}; }
};

struct StoreWord: Instruction {
    Reg src, base;
    int offset;
    StoreWord(Reg src, Reg base, int offset): src(src), base(base), offset(offset), Instruction() {}
    void emit(std::ostream &os) const;
    std::set<Reg> def() const { return {}; }
    std::set<Reg> use() const { return {src, base}; }
    std::vector<Reg*> reg_ptrs() { return {&src, &base}; }
};

struct LoadWord: Instruction {
    Reg dst, base;
    int offset;
    LoadWord(Reg dst, Reg base, int offset): dst(dst), base(base), offset(offset), Instruction() {}
    void emit(std::ostream &os) const;
    std::set<Reg> def() const { return {dst}; }
    std::set<Reg> use() const { return {base}; }
    std::vector<Reg*> reg_ptrs() { return {&dst, &base}; }
};

struct SPAdd: Instruction {
    int offset;
    void emit(std::ostream &os) const;
    SPAdd(int offset): offset(offset) {}
    std::set<Reg> def() const { return {}; }
    std::set<Reg> use() const { return {}; }
};

// conditional branch (beq zero, src, target)
struct Branch: Instruction {
    Reg src;
    BasicBlock* target;
    Branch(Reg src, BasicBlock* target): src(src), target(target) {}
    void emit(std::ostream &os) const;
};

}