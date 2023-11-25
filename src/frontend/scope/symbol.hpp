#pragma once

#include "../../common/const.hpp"
#include "../type/type.hpp"

struct Value{
//TODO
};

class Symbol
{
    //a virtual class
    public:
    std::string name;
    Type* type;
    int scope_id;
    virtual std::string toString() = 0;
    virtual ~Symbol() = default;
};

class VarSymbol : public Symbol{
    public:

    bool is_global;
    VarSymbol(std::string name, Type* type, bool is_global){
        this->name = name;
        this->type = type;
        this->is_global = is_global;
    }

    std::string toString(){
        std::string s;
        s += "VarSymbol: " + name + "(" + "int" + ") ";//TODO: type->toString()
        return s;
    }
};

class FuncSymbol : public Symbol{
    public:
    std::vector<Type*> param_type_list;
    bool is_define;

    FuncSymbol(std::string name, Type* type, bool is_define){
        this->name = name;
        this->type = type;
        this->is_define = is_define;
    }

    void add_param_type(Type* type)
    {
        param_type_list.push_back(std::move(type));
    }

    int num_param(){
        return param_type_list.size();
    }

    Type* get_param_type(int idx)
    {
        return std::move(param_type_list[idx]);
    }

    std::string toString(){
        std::string s;
        s += "FuncSymbol: " + name + "(" + type->toString() + ") " ;
        return s;
    }
};