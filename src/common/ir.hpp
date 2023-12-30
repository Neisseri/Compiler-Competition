#pragma once

#include "common.hpp"
#include "const.hpp"
#include "../frontend/type/type.hpp"
namespace ir {

    
struct BasicBlock;
struct Function;


struct Reg {
    int type; // ScalarType
    int id;
    Reg() {}
    Reg(int type, int id): type(type), id(id) {}

    std::string toString(){
        return "%r" + std::to_string(id);
    }
};

struct Instruction {
    InstType type;
    Instruction(InstType type): type(type) {}
    ~Instruction() {}

    virtual std::string toString() = 0;

    virtual void print(std::ostream &os, int indent){
        os << "basic instruction struct here!" << std::endl;
    }
};

struct Mark {
    int label_id;

    Mark(int label_id) : label_id(label_id) {}

    std::string toString() {
        return "B" + std::to_string(label_id);
    }

    void print(std::ostream &os, int indent) {
        os << toString() + ":" << std::endl;
    }
};


struct BasicBlock {
    Mark label;
    std::list<std::unique_ptr<Instruction>> instrs;

    Function* func;

    std::set<std::shared_ptr<BasicBlock>> prevs;
    std::set<std::shared_ptr<BasicBlock>> succs;
    bool reachable;

    int postorder_id;
    bool visited;
    std::set<std::shared_ptr<BasicBlock>> dom;
    std::shared_ptr<BasicBlock> idom;
    std::set<std::shared_ptr<BasicBlock>> doms;
    std::set<std::shared_ptr<BasicBlock>> DF;

    BasicBlock(int id, Function* func) : label(id), func(func) {}

    std::string toString(){
        return "BasicBlock has no String!";
    }

    void print(std::ostream &os, int indent){
        label.print(os, indent);
        for (auto &i : instrs){
            i->print(os, indent + 2);
        }
        os << std::endl;
    }
};


struct Phi: Instruction {
    std::string var_name;
    Type type;
    Reg dst;
    std::vector<std::pair<Reg, std::shared_ptr<ir::BasicBlock>>> srcs;

    Phi(Type type, std::string var_name) : Instruction(InstType::PHI), type(type), var_name(var_name){}
    
    std::string toString() {
        std::string ret = dst.toString() + " = phi " + type.toString(1) + " ";
        for (auto i = srcs.begin(); i != srcs.end(); i ++){
            ret += "[ " + i->first.toString() + ", %" + i->second->label.toString() + " ]";
            if (i + 1 != srcs.end()){
                ret += ", ";
            }
        }
        return ret;
    }

    void print(std::ostream &os, int indent) {
        os << std::string(indent, ' ') << toString() << std::endl;
    }
};


struct GlobalDef: Instruction {
    std::string var_name;
    Type type;
    std::vector<int> init_val; // TODO:support float type
    bool is_array;
    bool has_init;
    GlobalDef(std::string var_name, Type type, std::vector<int> init_val, bool has_init, bool is_array) : Instruction(InstType::GLOBALDEF), var_name(var_name), type(type), init_val(init_val), has_init(has_init), is_array(is_array) {}

    std::string toString() {
        std::string ret = "";
        std::string tem = var_name;
        tem.erase(tem.find('#'));
        ret += "@" + tem + " = global " + type.toString();
        if (has_init) {
            if (is_array){
                ret += " [";
                for (int i = 0; i < init_val.size(); i++){
                    ret += "i32 " + std::to_string(init_val[i]);
                    if (i + 1 < init_val.size()){
                        ret += ", ";
                    }
                }
                ret += "]";
            }
            else{
                ret += " " + std::to_string(init_val[0]);
            }
        }
        ret += ", i32 " + std::to_string(type.get_array_size() * 4);
        return ret;
    }

    void print(std::ostream &os, int indent) {
        os << std::string(indent, ' ') << toString() << std::endl;
    }
};


struct LoadAddr: Instruction { // load address of global variable
    Reg ret_val;
    std::string var_name;
    LoadAddr(Reg ret_val, std::string var_name) : Instruction(InstType::LOADADDR), ret_val(ret_val), var_name(var_name) {}

    std::string toString() {
        return ret_val.toString() + " = loadaddr @" + var_name;
    }

    void print(std::ostream &os, int indent) {
        os << std::string(indent, ' ') << toString() << std::endl;
    }
};


struct Alloca: Instruction {
    Type type;
    int size;
    Reg ret_val;
    bool is_local_var = 0;
    Alloca(Reg ret_val, Type type, int size) : Instruction(InstType::ALLOCA), ret_val(ret_val), type(type), size(size) {};

    std::string toString() {
        return ret_val.toString() + " = alloca " + type.toString() + ", i32 " + std::to_string(size);
    }

    void print(std::ostream &os, int indent) {
        os << std::string(indent, ' ') << toString() << std::endl;
    }
};

struct Store: Instruction {
    Reg src_val;
    Reg ptr;
    Type type;
    std::string var_name;
    bool is_local_var = 0;

    Store(Type type, Reg src_val, Reg ptr, std::string var_name) : Instruction(InstType::STORE), src_val(src_val), type(type), ptr(ptr), var_name(var_name) {}
    
    std::string toString() {
        return "store " + type.toString(1) + " " + src_val.toString() + ", ptr " + ptr.toString();
    }

    void print(std::ostream &os, int indent) {
        os << std::string(indent, ' ') << toString() << std::endl;
    }
};

struct Load: Instruction {
    Reg ret_val;
    Reg ptr;
    Type type;
    std::string var_name;
    bool is_local_var = 0;

    Load(Reg ret_val, Type type, Reg ptr, std::string var_name) : Instruction(InstType::LOAD), ret_val(ret_val), type(type), ptr(ptr), var_name(var_name) {}
    
    std::string toString() {
        return ret_val.toString() + " = load " + type.toString(1) + ", ptr " + ptr.toString();
    }

    void print(std::ostream &os, int indent) {
        os << std::string(indent, ' ') << toString() << std::endl;
    }
};

struct Binary: Instruction {
    BinaryOpEnum op;
    Reg src1;
    Reg src2;
    Reg dst;
    Binary(Reg dst, BinaryOpEnum op, Reg src1, Reg src2):Instruction(InstType::BINARY), dst(dst), op(op), src1(src1), src2(src2){}
    
    std::string get_instr_type(){
        switch (op)
        {
        case BinaryOpEnum::ADD:
            return "add i32";
            break;
        case BinaryOpEnum::SUB:
            return "sub i32";
            break;
        case BinaryOpEnum::MUL:
            return "mul i32";
            break;
        case BinaryOpEnum::DIV:
            return "sdiv i32";
            break;
        case BinaryOpEnum::MOD:
            return "srem i32";
            break;
        case BinaryOpEnum::AND:
            return "and i32";
            break;
        case BinaryOpEnum::OR:
            return "or i32";
            break;
        case BinaryOpEnum::XOR:
            return "xor i32";
            break;
        case BinaryOpEnum::SGT:
            return "icmp sgt i32";
            break;
        case BinaryOpEnum::SLT:
            return "icmp slt i32";
            break;
        case BinaryOpEnum::SGE:
            return "icmp sge i32";
            break;
        case BinaryOpEnum::SLE:
            return "icmp sle i32";
            break;
        case BinaryOpEnum::EQ:
            return "icmp eq i32";
            break;
        case BinaryOpEnum::NE:
            return "icmp ne i32";
            break;
        case BinaryOpEnum::SHL:
            return "icmp shl i32";
            break;
        case BinaryOpEnum::LSHR:
            return "icmp lshr i32";
            break;
        case BinaryOpEnum::ASHR:
            return "icmp ashr i32";
            break;
        default:
            return "unknown";
            break;
        }

    }

    virtual std::string toString() override {
        std::string ret;
        ret += dst.toString() + " = ";
        ret += get_instr_type();
        ret += " " + src1.toString() + ", " + src2.toString();
        return ret;
    }

    virtual void print(std::ostream &os, int indent) override{
        os << std::string(indent, ' ') << toString() << std::endl;
    }
};

struct Assign : Instruction {
    Reg src;
    Reg dst;
    Assign(Reg dst, Reg src):Instruction(InstType::ASSIGN), src(src), dst(dst){}

    virtual std::string toString() override {
        return dst.toString() + " = add i32 0, " + src.toString() + " ; assign";
    }

    virtual void print(std::ostream &os, int indent) override{
        os << std::string(indent, ' ') << toString() << std::endl;
    }
};

struct LoadInt : Instruction {
    Reg dst;
    int val;
    LoadInt(Reg dst, int val):Instruction(InstType::LOADIMM), dst(dst), val(val){}

    virtual std::string toString() override {
        return dst.toString() + " = add i32 0, " + std::to_string(val) + " ; loadint";
    }

    virtual void print(std::ostream &os, int indent) override{
        os << std::string(indent, ' ') << toString() << std::endl;
    }
};

struct Return: Instruction {
    Reg ret_val;
    Return(Reg ret_val): ret_val(ret_val), Instruction(TERMINATOR) {}

    std::string toString(){
        std::string ret = "ret";
        if (ret_val.type == static_cast<int>(TypeEnum::INT)){
            ret += " i32 ";
        }
        else if (ret_val.type == static_cast<int>(TypeEnum::FLOAT)){
            ret += " float ";
        }
        return ret + ret_val.toString();
    }

    void print(std::ostream &os, int indent){
        os << std::string(indent, ' ') << toString() << std::endl;
    }
};

struct Call: Instruction {
    Reg ret_val;
    std::string func_name;
    std::vector<Reg> params;

    Call(Reg ret_val, std::string name, std::vector<Reg> params): ret_val(ret_val), func_name(name), params(std::move(params)), Instruction(CALL) {}

    std::string toString(){
        std::string ret = ret_val.toString() + " = call";
        if (ret_val.type == static_cast<int>(TypeEnum::INT)){
            ret += " i32 ";
        }
        else if (ret_val.type == static_cast<int>(TypeEnum::FLOAT)){
            ret += " float ";
        }
        ret += "@" + func_name + "(";
        for (int i = 0; i < params.size(); i ++){
            if (params[i].type == static_cast<int>(TypeEnum::INT)){
                ret += "i32 ";
            }
            else if (params[i].type == static_cast<int>(TypeEnum::FLOAT)){
                ret += "float ";
            }
            ret += params[i].toString();
            if (i + 1 < params.size()){
                ret += ", ";
            }
        }
        ret += ")";
        return ret;
    }

    void print(std::ostream &os, int indent){
        os << std::string(indent, ' ') << toString() << std::endl;
    }
};


struct Branch : Instruction {
    std::shared_ptr<BasicBlock> bb_dst;

    Branch(std::shared_ptr<BasicBlock> bb_dst) : bb_dst(bb_dst), Instruction(BRANCH) {}

    std::string toString(){
        return "br label %" + bb_dst->label.toString();
    }

    void print(std::ostream &os, int indent){
        os << std::string(indent, ' ')  << toString() << std::endl;
    }
};

struct CondBranch : Instruction {
    std::shared_ptr<BasicBlock> bb_true;
    std::shared_ptr<BasicBlock> bb_false;

    Reg cond;

    CondBranch(Reg cond, std::shared_ptr<BasicBlock> bb_true, std::shared_ptr<BasicBlock> bb_false) : bb_true(bb_true), bb_false(bb_false), cond(cond), Instruction(BRANCH) {}
    
    std::string toString(){
        std::string cond_type_str;
        if (cond.type == static_cast<int>(TypeEnum::INT)){
            cond_type_str += "i1";
        }
        else if (cond.type == static_cast<int>(TypeEnum::FLOAT)){
            cond_type_str += "float";
        }
        return "br " + cond_type_str + " " + cond.toString() + ", label %" + bb_true->label.toString() + ", label %" + bb_false->label.toString();
    }

    void print(std::ostream &os, int indent){
        os << std::string(indent, ' ')  << toString() << std::endl;
    }
};


struct Function {
    std::string name;
    Type ret_type;
    int num_regs = 0;
    std::vector<Type> param_types;
    std::list<std::shared_ptr<BasicBlock>> bbs;

    Function(std::string name, Type ret_type) : name(name), ret_type(ret_type) {}
    Function() {}

    std::string toString(){
        std::string ret = " @" + name + "(";
        for (int i = 0; i < param_types.size(); i++){
            ret += param_types[i].toString(1) + " %r" + std::to_string(i + 1);
            if (i + 1 < param_types.size()){
                ret += ", ";
            }
        }
        ret += ")";
        return ret;
    }

    void print(std::ostream &os, int indent){
        os << std::string(indent, ' ')  << "define " + ret_type.toString(1);
        os << toString() << '{' << std::endl;

        for (auto i : bbs){
            i->print(os, indent);
        }

        os << std::string(indent, ' ') << '}' << std::endl;
    }

    ir::Reg get_new_reg(int type)
    {
        // std::cerr << "get_new_reg " << name << " numregs: " << num_regs << std::endl;
        return ir::Reg(type, ++num_regs);
    }
};


struct Program {
    std::unordered_map<std::string, Function> functions;
    // std::unordered_map<std::string, std::unique_ptr<GlobalDef>> global_defs;
    std::list<Instruction*> global_defs; // TODO:change here to unique_ptr

    std::string toString(){
        return "; module";
    }

    void print(std::ostream &os, int indent){
        os << std::string(indent, ' ') << toString() << std::endl;
        for (auto &child : global_defs){
            child->print(os, indent);
        }
        for (auto &child : functions){
            child.second.print(os, indent);
        }
    }
};

}