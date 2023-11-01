#pragma once

#include "../../common/commom.hpp"
#include "../type/type.hpp"

struct Value{
//TODO
};

struct Symbol
{
    
};


struct VarSymbol : Symbol{
    std::string name;
    Type type;
    bool is_global;
    Value init_value;

    VarSymbol(std::string name, Type type, bool is_global) : name{name}, type{type}, is_global{is_global}{}

    void set_init_value(Value value){
        init_value = value;
    }
    
    std::string toString(){} // TODO
};


struct FuncSymbol : Symbol{
    std::string name;
    Type type;
    std::vector<Type> param_type_list;
    bool is_define;

    FuncSymbol(std::string name, Type type, bool is_define) : name{name}, type{type}, is_define{is_define}{}

    void add_param_type(Type type){
        param_type_list.push_back(type);
    }

    int num_param(){
        return param_type_list.size();
    }

    Type get_param_type(int idx){
        return param_type_list[idx];
    }

    std::string toString(){} // TODO
};