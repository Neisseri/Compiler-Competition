#include "../../common/common.hpp"
#include "../../common/ir.hpp"
#include "const.hpp"

namespace riscv {
struct Instruction;

struct Reg {
    RegType type;
    int id;
    std::string name;
    Reg() {}
    Reg(RegType type, int id, std::string name): type(type), id(id), name(name) {}
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

struct Riscv {
    Riscv() {}
    Reg ZERO = Reg(RegType::General, 0, "x0");
    Reg RA = Reg(RegType::General, 1, "ra");
    Reg SP = Reg(RegType::General, 2, "sp");
    Reg GP = Reg(RegType::General, 3, "gp");
    Reg TP = Reg(RegType::General, 4, "tp");
    Reg T0 = Reg(RegType::General, 5, "t1");
    Reg T1 = Reg(RegType::General, 6, "t2");
    Reg T2 = Reg(RegType::General, 7, "t2");
    Reg FP = Reg(RegType::General, 8, "fp");
    Reg S1 = Reg(RegType::General, 9, "s1");
    Reg A0 = Reg(RegType::General, 10, "a0");
    Reg A1 = Reg(RegType::General, 11, "a1");
    Reg A2 = Reg(RegType::General, 12, "a2");
    Reg A3 = Reg(RegType::General, 13, "a3");
    Reg A4 = Reg(RegType::General, 14, "a4");
    Reg A5 = Reg(RegType::General, 15, "a5");
    Reg A6 = Reg(RegType::General, 16, "a6");
    Reg A7 = Reg(RegType::General, 17, "a7");
    Reg S2 = Reg(RegType::General, 18, "s2");
    Reg S3 = Reg(RegType::General, 19, "s3");
    Reg S4 = Reg(RegType::General, 20, "s4");
    Reg S5 = Reg(RegType::General, 21, "s5");
    Reg S6 = Reg(RegType::General, 22, "s6");
    Reg S7 = Reg(RegType::General, 23, "s7");
    Reg S8 = Reg(RegType::General, 24, "s8");
    Reg S9 = Reg(RegType::General, 25, "s9");
    Reg S10 = Reg(RegType::General, 26, "s10");
    Reg S11 = Reg(RegType::General, 27, "s11");
    Reg T3 = Reg(RegType::General, 28, "t3");
    Reg T4 = Reg(RegType::General, 29, "t4");
    Reg T5 = Reg(RegType::General, 30, "t5");
    Reg T6 = Reg(RegType::General, 31, "t6");
};

struct BasicBlock {
    std::string label;
    std::list<std::unique_ptr<Instruction>> instructions;
    std::set<BasicBlock *> pred, succ;
    std::set<Reg> def, live_use, live_in, live_out;
    void push(Instruction *insn);
    static void add_edge(BasicBlock *from, BasicBlock *to);
    static void remove_edge(BasicBlock *from, BasicBlock *to);
    void getDefUseSet();
    void post_order_dfs(std::unordered_set<BasicBlock*> &visited, std::vector<BasicBlock*> &rst); 
};

struct Instruction {
    Instruction() {}
    virtual ~Instruction() = default;
    virtual void emit(std::ostream &os) const {}
    virtual std::set<Reg> def() const { return {}; }
    virtual std::set<Reg> use() const { return {}; }
};

struct Function {
    std::string name;
    std::list<std::unique_ptr<BasicBlock>> bbs;
    void do_liveness_analysis();
    std::vector<BasicBlock*> doPostOrderTranverse();
    std::vector<BasicBlock*> compute_post_order() const;
    void do_reg_alloc() {}
    void emit_prologue_epilogue() {}
};

struct Program {
    std::unordered_map<std::string, Function> functions;
    int label_cnt;
    std::string new_label() {
        return ".L" + std::to_string(label_cnt++);
    }
    std::vector<std::string> buffer;
    Program();
    void emit(std::ostream &os);
    void emitEnd(std::ostream &os);
};

std::unique_ptr<Program> translate(const ir::Program &ir_prg);
void emit_global(std::ostream &os, const ir::Program &ir_prg);
struct Unary: Instruction {
    Reg dst, src;
    RiscvUnaryOp op;
    Unary(Reg dst, RiscvUnaryOp op, Reg src): dst(dst), op(op), src(src) {}
    void emit(std::ostream &os) const override;
    std::set<Reg> def() const override { return {dst}; }
    std::set<Reg> use() const override { return {src}; }
};

struct Binary: Instruction {
    Reg dst, src1, src2;
    RiscvUnaryOp op;
    Binary(Reg dst, RiscvUnaryOp op, Reg src1, Reg src2): dst(dst), op(op), src1(src1), src2(src2) {}
    void emit(std::ostream &os) const override;
    std::set<Reg> def() const override { return {dst}; }
    std::set<Reg> use() const override { return {src1, src2}; }
};

struct Return: Instruction {
    void emit(std::ostream &os) const override;
    std::set<Reg> def() const override { return {}; }
    std::set<Reg> use() const override { return {}; } // TODO
};

}