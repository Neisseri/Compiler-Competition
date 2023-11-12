#include "common.hpp"
#include "const.hpp"
namespace ir {

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

struct Mark : Instruction {
    std::string label_name;

    Mark(std::string name) : Instruction(InstType::LABEL), label_name(name) {}

    virtual std::string toString() override {
        return label_name;
    }

    virtual void print(std::ostream &os, int indent) override{
        os << toString() + ":" << std::endl;
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
        for (auto i : params){
            if (i.type == static_cast<int>(TypeEnum::INT)){
                ret += "i32 ";
            }
            else if (i.type == static_cast<int>(TypeEnum::FLOAT)){
                ret += "float ";
            }
            ret += i.toString();
            if (i.id != params.back().id){
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
    Mark label;

    Branch(Mark label) : label(label), Instruction(BRANCH) {}

    std::string toString(){
        return "br label " + label.toString();
    }

    void print(std::ostream &os, int indent){
        os << std::string(indent, ' ')  << toString() << std::endl;
    }
};

struct CondBranch : Instruction {
    Mark label_true;
    Mark label_false;
    Reg cond;

    CondBranch(Reg cond, Mark label_true, Mark label_false) : label_true(label_true), label_false(label_false), cond(cond), Instruction(BRANCH) {}
    
    std::string toString(){
        std::string cond_type_str;
        if (cond.type == static_cast<int>(TypeEnum::INT)){
            cond_type_str += "i32";
        }
        else if (cond.type == static_cast<int>(TypeEnum::FLOAT)){
            cond_type_str += "float";
        }
        return "br " + cond_type_str + " " + cond.toString() + ", label " + label_true.toString() + ", label " + label_false.toString();
    }

    void print(std::ostream &os, int indent){
        os << std::string(indent, ' ')  << toString() << std::endl;
    }
};


struct Function {
    std::string name;
    Type ret_type;
    std::vector<Type> param_types;
    std::vector<std::unique_ptr<Instruction>> instrs;
    int num_regs;

    std::string toString(){
        std::string ret = " @" + name + "(";
        for (int i = 0; i < param_types.size(); i++){
            ret += param_types[i].toString(1);
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

}