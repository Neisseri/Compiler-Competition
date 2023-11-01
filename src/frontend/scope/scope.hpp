#pragma

#include "../../common/commom.hpp"

#include "symbol.hpp"


struct Scope{
    std::map<std::string, std::shared_ptr<Symbol>> symbols;
    bool is_global = false;
    
    std::shared_ptr<Symbol> lookup(const std::string name){
        auto iter = symbols.find(name);
        if (iter != symbols.end()){
            return iter->second;
        }else {
            return nullptr;
        }
    }

    void declare_symbol(const std::string name, const std::shared_ptr<Symbol> symbol){
        symbols[name] = symbol;
    }

};

struct ScopeStack{
    std::vector<Scope> stack;

    void scope_push(const Scope scope){
        stack.push_back(scope);
        return ;
    }

    void scope_pop(){
        stack.pop_back();
        return ;
    }

    std::shared_ptr<Symbol> lookup_top(const std::string name){
        return stack.back().lookup(name);
    }

    std::shared_ptr<Symbol> lookup_stack(const std::string name){
        for (auto iter = stack.rbegin(); iter != stack.rend(); iter += 1){
            auto symbol_ptr = iter->lookup(name);
            if (symbol_ptr){
                return symbol_ptr;
            }
        }
        return nullptr;
    }

    void declare_symbol(const std::string name, const std::shared_ptr<Symbol> symbol){
        stack.back().declare_symbol(name, symbol);
        return ;
    }

    Scope get_top_scope(){
        return stack.back();
    }
};
