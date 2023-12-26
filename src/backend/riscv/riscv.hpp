#pragma once

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
    Reg(ir::Reg ir_reg): type(General), id(-ir_reg.id) {}
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
    static int total_blks;
    std::string label;
    std::list<Instruction*> instructions;
    std::set<BasicBlock*> pred, succ;
    std::set<Reg> def, live_use, live_in, live_out;
    BasicBlock() { id = total_blks++; }
    static void add_edge(BasicBlock *from, BasicBlock *to);
    static void remove_edge(BasicBlock *from, BasicBlock *to);
    void get_def_use_set();
    void add_inst(Instruction* inst);
    void post_order_dfs(std::unordered_set<BasicBlock*> &visited, std::vector<BasicBlock*> &rst); 
};

struct Instruction {
    Instruction() {}
    virtual ~Instruction() = default;
    virtual void emit(std::ostream &os) const {}
    virtual std::set<Reg> def() const { return {}; }
    virtual std::set<Reg> use() const { return {}; }
    std::set<Reg> livein, liveout;
    virtual std::vector<Reg*> reg_ptrs() { return {}; }
    void replace_reg(Reg src, Reg dst);
};

struct Function {
    std::string name;
    ir::Label label;
    Reg freshTemp() {
        return Reg(General, -(++num_regs));
    }
    int num_regs;
    int reg_occupied[32];
    std::vector<std::unique_ptr<Instruction>> instrs;
    std::list<BasicBlock*> bbs;
    int num_params;
    void do_liveness_analysis();
    std::vector<BasicBlock*> do_post_order_tranverse();
    std::vector<BasicBlock*> compute_post_order() const;
    void do_reg_alloc();
    void alloc_reg_for(Reg i, bool is_read,
        std::list<Instruction*>::iterator it, std::list<Instruction*> instructions);
    void emitend();
    int frame_size;
    // std::vector<int> allocable_regs;
    std::vector<int> callee_saved_regs;
    std::map<Reg, int> bindings;
    std::map<int, Reg> reg_to_tmp;
    int temps[32];
    void replace_regs(std::map<Reg, int> reg_map);
    std::map<Reg, int> offsets; // virtual reg -> stack offset
    std::map<Reg, int> alloca_offsets; // virtual regs are ptr to stack objs
    std::map<Reg, int> alloca_sizes;
    void emit(std::ostream &os);
    Function(ir::Function& ir_function, const std::string& name);
    void select_instr(ir::Instruction* ir_inst, BasicBlock* bb,
        std::unordered_map<ir::BasicBlock*, BasicBlock*> bb_map);
    void resolve_phi();
};

struct Program {
    void cfg_build();
    std::list<BasicBlock*> bbs;
    std::list<ir::GlobalDef*> global_defs;
    std::unordered_map<std::string, Function*> functions;
    int label_cnt;
    std::string new_label() {
        return ".L" + std::to_string(label_cnt++);
    }
    std::vector<std::string> buffer;
    Program() {}
    void emit(std::ostream &os);
    void emitEnd(std::ostream &os);
    Program(ir::Program ir_program);
};

std::string print_reg(Reg src);
std::string print_bb(BasicBlock* bb);

struct Unary: Instruction {
    Reg dst, src;
    RiscvUnaryOp op;
    Unary(Reg dst, RiscvUnaryOp op, Reg src): dst(dst), op(op), src(src), Instruction() {}
    void emit(std::ostream &os) const override;
    std::set<Reg> def() const override { return {dst}; }
    std::vector<Reg*> reg_ptrs() override { return {&dst, &src}; }
};

struct Binary: Instruction {
    Reg dst, src1, src2;
    RiscvBinaryOp op;
    Binary(Reg dst, RiscvBinaryOp op, Reg src1, Reg src2): dst(dst), op(op), src1(src1), src2(src2), Instruction() {}
    void emit(std::ostream &os) const override;
    std::set<Reg> def() const override { return {dst}; }
    std::set<Reg> use() const override { return {src1, src2}; }
    std::vector<Reg*> reg_ptrs() override { return {&dst, &src1, &src2}; }
};

struct Return: Instruction {
    int ret_val;
    Reg src;
    Return(int ret_val): ret_val(ret_val), Instruction() {}
    Return(Reg src): src(src), Instruction() {}
    Return() = default;
    void emit(std::ostream &os) const override;
    std::set<Reg> def() const override { return {}; }
    std::set<Reg> use() const override { return {src}; }
    std::vector<Reg*> reg_ptrs() override { return {&src}; }
};

struct StoreWord: Instruction {
    Reg src, base;
    int offset;
    StoreWord(Reg src, Reg base, int offset): src(src), base(base), offset(offset), Instruction() {}
    void emit(std::ostream &os) const override;
    std::set<Reg> def() const override { return {}; }
    std::set<Reg> use() const override { return {src, base}; }
    std::vector<Reg*> reg_ptrs() override { return {&src, &base}; }
};

struct LoadWord: Instruction {
    Reg dst, base;
    int offset;
    LoadWord(Reg dst, Reg base, int offset): dst(dst), base(base), offset(offset), Instruction() {}
    void emit(std::ostream &os) const override;
    std::set<Reg> def() const override { return {dst}; }
    std::set<Reg> use() const override { return {base}; }
    std::vector<Reg*> reg_ptrs() override { return {&dst, &base}; }
};

struct SPAdd: Instruction {
    int offset;
    void emit(std::ostream &os) const override;
    SPAdd(int offset): offset(offset) {}
};

// conditional branch (beq x0, src, target)
struct Branch: Instruction {
    Reg src;
    BasicBlock* target;
    Branch(Reg src, BasicBlock* target): src(src), target(target) {}
    void emit(std::ostream &os) const override;
    std::set<Reg> use() const override { return {src}; }
    std::vector<Reg*> reg_ptrs() override { return {&src}; }
};

struct ADDI: Instruction {
    Reg dst, src;
    int offset;
    ADDI(Reg dst, Reg src, int offset): offset(offset), dst(dst), src(src) {}
    std::set<Reg> def() const override { return {dst}; }
    std::set<Reg> use() const override { return {src}; }
    std::vector<Reg*> reg_ptrs() override { return {&dst, &src}; }
    void emit(std::ostream &os) const override;
};


struct Jump: Instruction {
    BasicBlock* target;
    Jump(BasicBlock* target): target(target) {}
    void emit(std::ostream &os) const override;
};


struct LoadImm: Instruction {
    int imm;
    Reg dst;
    LoadImm(Reg dst, int imm): imm(imm), dst(dst) {}
    std::set<Reg> def() const override { return {dst}; }
    std::vector<Reg*> reg_ptrs() override { return {&dst}; }
    void emit(std::ostream &os) const override;
};


struct Move: Instruction {
    Reg src, dst;
    Move(Reg src, Reg dst): src(src), dst(dst) {}
    std::set<Reg> def() const override { return {dst}; }
    std::set<Reg> use() const override { return {src}; }
    std::vector<Reg*> reg_ptrs() override { return {&dst, &src}; }
    void emit(std::ostream &os) const override;
};

struct Call: Instruction {
    std::string func_name;
    int num_params;
    Call(std::string func_name, int num_params): func_name(func_name), num_params(num_params), Instruction() {}
    std::set<Reg> def() const override {
        std::set<Reg> def_set;
        for (int i = 0; i < NUM_REGS; i++) 
            if (REG_ATTR[i] == CallerSaved)
                def_set.insert(Reg(General, i));
        return def_set;
    }
    std::set<Reg> use() const override {
        int num_reg_used = num_params < 8 ? num_params : 8;
        std::set<Reg> use_set;
        for (int i = 0; i < num_reg_used; i++) 
            use_set.insert(Reg(General, argregs[i]));
        return use_set;
    }
    std::vector<Reg*> reg_ptrs() override { return {}; }
    void emit(std::ostream &os) const override;
};

struct Phi: Instruction {
    Reg dst;
    std::vector<std::pair<Reg, BasicBlock*>> srcs;
    Phi(Reg dst, std::vector<std::pair<Reg, BasicBlock*>>): dst(dst), srcs(srcs) {}
    std::set<Reg> def() const override { return {dst}; }
    std::set<Reg> use() const override {
        std::set<Reg> rst;
        for (auto i: srcs) {
            rst.insert(i.first);
        }
        return rst;
    }
    std::vector<Reg*> reg_ptrs() override {
        std::vector<Reg*> rst;
        rst.push_back(&dst);
        for (auto i: srcs) {
            rst.push_back(&i.first);
        }
        return rst;
    }
    void emit(std::ostream &os) const override;
};

struct LoadAddr: Instruction {
    Reg dst;
    std::string var_name;
    LoadAddr(Reg dst, std::string var_name): dst(dst), var_name(var_name) {}
    std::set<Reg> def() const override { return {dst}; }
    std::set<Reg> use() const override { return {}; }
    std::vector<Reg*> reg_ptrs() override { return {&dst}; }
    void emit(std::ostream &os) const override;
};

}