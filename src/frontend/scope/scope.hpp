#pragma

#include "../../common/const.hpp"
#include "../../common/error.hpp"

#include "symbol.hpp"


class Scope
{
public:
    ScopeType type;
    Type *ret_type; // only for func scope
    int scope_id;
    Scope() = default;
    Scope(bool is_global) : is_global(is_global) { type = ScopeType::GlobalScope; }
    Scope(ScopeType type, bool is_global) : type(type), is_global(is_global) {}
    Scope(ScopeType type, Type *ret_type) : type(type), ret_type(ret_type) { is_global = true; }
    ~Scope() = default;
    std::map<std::string, Symbol*> symbols;
    bool is_global = false;

    Symbol* lookup(const std::string name)
    {
        auto iter = symbols.find(name);
        if (iter != symbols.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void declare_symbol(const std::string name, Symbol* symbol)
    {
        if (FuncSymbol *func_symbol = dynamic_cast<FuncSymbol *>(symbol))
        {
            std::cerr << "this is a func_symbol" << std::endl;
            symbols[name] = std::move(func_symbol);
        }
        else if (VarSymbol *var_symbol = dynamic_cast<VarSymbol *>(symbol))
        {
            std::cerr << "this is a var_symbol" << std::endl;
            symbols[name] = std::move(var_symbol);
        }
        else
        {
            SyError().throw_error(ErrorTypeEnum::SemanticError, "unknown symbol type");
        }
    }

    void remove_symbol(const std::string name)
    {
        symbols.erase(name);
    }

    void set_ret_type(Type *type)
    {
        ret_type = type;
    }

    std::string scopeToString()
    {
        std::string s;
        int map_size=symbols.size();
        s += "size: " + std::to_string(map_size) + " ";
        for (auto iter = symbols.begin(); iter != symbols.end(); iter++)
        {
            s += iter->first + " ";
        }
        return s;
    }

    void printScope(std::ostream &os)
    {
        os << "Scope: " << scopeToString() << std::endl;
        for (auto iter = symbols.begin(); iter != symbols.end(); iter++)
        {
            if(FuncSymbol* func_symbol = dynamic_cast<FuncSymbol*>(iter->second)){
                os << func_symbol->toString() << std::endl;
            }
            else if(VarSymbol* var_symbol = dynamic_cast<VarSymbol*>(iter->second)){
                os<<"this is a var_symbol"<<std::endl;
                os << var_symbol->toString() << std::endl;
            }
            else{
                os<<"this is a unknown symbol"<<std::endl;
                os<<iter->second->toString()<<std::endl;
            }
        }
    }
};

class ScopeStack
{
public:
    std::vector<std::unique_ptr<Scope>> stack;
    int loop_cnt = 0;

    void
    scope_push(std::unique_ptr<Scope> scope)
    {
        int scope_id = stack.size();
        scope->scope_id = scope_id;
        stack.push_back(std::move(scope));
        if (stack.back()->type == ScopeType::LoopScope)
        {
            loop_cnt++;
        }
        return;
    }

    void scope_pop()
    {
        if (stack.back()->type == ScopeType::LoopScope)
        {
            loop_cnt--;
        }
        Scope *scope = stack.back().get();
        stack.pop_back();
        delete scope;
        return;
    }

    Symbol* lookup_top(const std::string name)
    {
        return stack.back()->lookup(name);
    }

    Symbol* lookup_stack(const std::string name)
    {
        for (auto iter = stack.rbegin(); iter != stack.rend(); iter++)
        {
            auto symbol = (*iter)->lookup(name);
            if (symbol != nullptr)
            {
                return symbol;
            }
        }
        return nullptr;
    }

    void declare_symbol(const std::string name, Symbol* symbol)
    {
        stack.back()->declare_symbol(name, symbol);
        return;
    }

    std::unique_ptr<Scope> get_top_scope()
    {
        return std::move(stack.back());
    }

    std::unique_ptr<Scope> get_cur_func_scope()
    {
        for (auto iter = stack.rbegin(); iter != stack.rend(); iter++)
        {
            if ((*iter)->type == ScopeType::FuncScope)
            {
                return std::move(*iter);
            }
        }
        return nullptr;
    }

    void printStack(std::ostream &os)
    {
        os << "ScopeStack: " << std::endl;
        for (auto iter = stack.begin(); iter != stack.end(); iter++)
        {
            os << "Scope " << (*iter)->scope_id << ": ";
            (*iter)->printScope(os);
        }
    }
};
