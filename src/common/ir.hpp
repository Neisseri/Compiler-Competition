#include "common.hpp"
#include "const.hpp"
namespace ir {

// struct Type {
//   int base_type; // ScalarType
//   bool is_const;
//   std::vector<int> dims; // array dimensions
// };

struct Reg {
    int type; // ScalarType
    int id;
    Reg() {}
    Reg(int type, int id): type(type), id(id) {}

    std::string toString(){
        return "%" + std::to_string(id);
    }
};

struct Instruction {
    InstType type;
    Instruction(InstType type): type(type) {}
    ~Instruction() {}
    virtual void emit(std::ostream &os) const {}
    virtual std::vector<Reg*> reg_ptrs() {return {};}

    virtual std::string toString() = 0;

    virtual void print(std::ostream &os, int indent){
        os << "basic instruction struct here!" << std::endl;
    }
};

struct ADD : Instruction {
    Reg src1;
    Reg src2;
    Reg dst;
    ADD(Reg dst, Reg src1, Reg src2):Instruction(InstType::BINARY), dst(dst), src1(src1), src2(src2){}

    virtual std::string toString() override {
        return dst.toString() + " = add i32 " + src1.toString() + ", " + src2.toString();
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
        return dst.toString() + " = " + src.toString();
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
        return dst.toString() + " = " + std::to_string(val);
    }

    virtual void print(std::ostream &os, int indent) override{
        os << std::string(indent, ' ') << toString() << std::endl;
    }
};

struct Function {
    std::string name;
    Type ret_type;
    std::vector<Type> param_types;
    std::vector<std::unique_ptr<Instruction>> instrs;
    int num_regs;
    void do_liveness_analysis();
    // std::vector<BasicBlock *> compute_post_order();
    // std::unordered_map<Reg, std::unordered_set<Instruction *>> use_list;


    std::string toString(){
        std::string ret = "define " + ret_type.toString(1) + " @" + name + "(";
        for (auto i : param_types){
            ret += i.toString(1);
        }
        ret += ")";
        return ret;
    }

    void print(std::ostream &os, int indent){
        os << std::string(indent, ' ') << toString() << '{' << std::endl;

        for (auto &i : instrs){
            i->print(os, indent);
        }

        os << std::string(indent, ' ') << '}' << std::endl;
    }
};


struct Program {
    std::unordered_map<std::string, Function> functions;

    std::string toString(){
        return "; module";
    }

    void print(std::ostream &os, int indent){
        os << std::string(indent, ' ') << toString() << std::endl;
        for (auto &child : functions){
            child.second.print(os, indent);
        }
    }
};



// struct Alloca: Instruction {
//     Type alloca_type;
//     Reg dst;
//     Alloca(Reg dst, Type type): alloca_type(std::move(type)), dst(dst), Instruction(ALLOCA) {}
//     virtual void emit(std::ostream &os) const override;
// };

// struct Load: Instruction {
//     Reg addr;
//     Reg dst;
//     Load(Reg dst, Reg addr): addr(addr), dst(dst), Instruction(LOAD) {}
//     virtual void emit(std::ostream &os) const override;
// };

// struct LoadAddr: Instruction {}

// struct LoadImm: Instruction {}

// struct Store: Instruction {}

// struct GetElementPtr: Instruction {}

// struct Convert: Instruction {}

// struct Unary: Instruction {
//     UnaryOp op;
//     Reg dst, src;
//     // Unary() {}
//     Unary(Reg dst, UnaryOp op, Reg src): op(op), dst(dst), src(src), Instruction(UNARY) {}
//     virtual void emit(std::ostream &os) const override;
// };

// struct Binary: Instruction {
//     BinaryOp op;
//     Reg dst, src1, src2;
//     // Binary() {}
//     Binary(Reg dst, BinaryOp op, Reg src1, Reg src2): op(op), dst(dst), src1(src1), src2(src2), Instruction(BINARY) {}
//     virtual void emit(std::ostream &os) const override;
// };

// struct Call: Instruction {}

struct Return: Instruction {
    ir::Reg ret_val;
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

// struct Jump: Instruction {}

// struct Branch: Instruction {}

// struct Phi: Instruction {}

// struct Switch: Instruction {}

}