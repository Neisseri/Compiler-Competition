#pragma

#include "../../common/const.hpp"

#include "symbol.hpp"

class Scope
{
public:
    ScopeType type=ScopeType::ErrorScope;
    Type *ret_type; // only for func scope
    bool has_return = false;
    int scope_id;
    Scope() = default;
    Scope(ScopeType type) : type(type) {}
    Scope(ScopeType type, Type *ret_type) : type(type), ret_type(ret_type) {}
    ~Scope() = default;
    std::map<std::string, std::shared_ptr<Symbol>> symbols;

    std::shared_ptr<Symbol> lookup(const std::string name)
    {
        auto iter = symbols.find(name);
        if (iter != symbols.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void declare_symbol(const std::string name, const std::shared_ptr<Symbol> symbol)
    {
        symbol.get()->scope_id = scope_id;
        symbols[name] = symbol;
    }

    void remove_symbol(const std::string name)
    {
        symbols.erase(name);
    }

    void set_ret_type(Type *type)
    {
        ret_type = type;
    }

    std::string toString()
    {
        std::string s;
        for (auto iter = symbols.begin(); iter != symbols.end(); iter++)
        {
            s += iter->second->toString() + " ";
        }
        return s;
    }

    void printScope(std::ostream &os)
    {
        os << "Scope: " << toString() << std::endl;
    }
};

class ScopeStack
{
public:
    std::vector<std::unique_ptr<Scope>> stack;
    int loop_cnt = 0;
    int scope_cnt = 0;

    void scope_push(std::unique_ptr<Scope> scope)
    {
        int scope_id = scope_cnt++;
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
        stack.pop_back();
        return;
    }

    std::shared_ptr<Symbol> lookup_top(const std::string name)
    {
        return stack.back()->lookup(name);
    }

    std::shared_ptr<Symbol> lookup_stack(const std::string name)
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

    std::shared_ptr<Scope> get_func_scope()
    {
        for (auto iter = stack.rbegin(); iter != stack.rend(); iter++)
        {
            if ((*iter)->type == ScopeType::FuncScope)
            {
                return std::make_shared<Scope>(**iter);
            }
        }
        return nullptr;
    }



    void declare_symbol(const std::string name, const std::shared_ptr<Symbol> symbol)
    {
        stack.back()->declare_symbol(name, symbol);
        return;
    }

    std::shared_ptr<Scope> get_top_scope()
    {
        return std::make_shared<Scope>(*stack.back());
    }

    std::shared_ptr<Scope> get_cur_func_scope()
    {
        for (auto iter = stack.rbegin(); iter != stack.rend(); iter++)
        {
            if ((*iter)->type == ScopeType::FuncScope)
            {
                return std::make_shared<Scope>(**iter);
            }
        }
        return nullptr;
    }

    void set_has_return()
    {
        //find the top func scope
        for (auto iter = stack.rbegin(); iter != stack.rend(); iter++)
        {
            if ((*iter)->type == ScopeType::FuncScope)
            {
                (*iter)->has_return = true;
                return;
            }
        }
    }

    bool is_in_loop()
    {
        return loop_cnt > 0;
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
