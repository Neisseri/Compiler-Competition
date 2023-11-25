#include "typer.hpp"
#include "../../common/error.hpp"
#include "../../common/const.hpp"

namespace frontend
{
    void TyperVisitor::visitPromgram(const ast::Program *program)
    {
        std::cerr << "TYPER-->visitProgram" << std::endl;
        this->global_scope = std::make_unique<Scope>();
        this->scope_stack = std::make_unique<ScopeStack>();
        scope_stack->scope_push(std::move(global_scope));
        for (auto &child : program->children)
        {
            // if child is a function
            if (auto decl = dynamic_cast<const ast::Declaration *>(child.get()))
            {
                visitVarDef(decl);
            }
            else if (auto func = dynamic_cast<const ast::Function *>(child.get()))
            {
                visitFuncDef(func);
            }
        }
    }

    void TyperVisitor::visitFuncDef(const ast::Function *func_def)
    {
        auto func_symbol = std::make_shared<FuncSymbol>(func_def->ident.get()->name, std::move(func_def->ret_type.get()), true);
        for (auto &param : func_def->params->children)
        {
            func_symbol->add_param_type(param->var_type.get());
        }
        this->scope_stack->declare_symbol(func_def->ident->name, func_symbol);
        scope_stack->scope_push(std::make_unique<Scope>(ScopeType::FuncScope, func_def->ret_type.get()));
        for (auto &param : func_def->params->children)
        {
            visitParamDef(param.get());
        }
        visitBlock(func_def->body.get());
        this->scope_stack->scope_pop();
    }

    void TyperVisitor::visitVarDef(const ast::Declaration *var_def)
    {
        auto name = var_def->ident.get()->name;
        if (scope_stack->lookup_stack(name) != nullptr)
        {
            SyError().throw_error(ErrorTypeEnum::SemanticError, "redeclaration of variable " + name);
        }
        auto var_symbol = std::make_shared<VarSymbol>(var_def->ident.get()->name, std::move(var_def->var_type.get()), scope_stack->stack.back()->is_global);
        scope_stack->declare_symbol(var_def->ident.get()->name, var_symbol);
    }

    void TyperVisitor::visitParamDef(const ast::Parameter *param_def)
    {
        auto var_symbol = std::make_shared<VarSymbol>(param_def->ident.get()->name, std::move(param_def->var_type.get()), false);
        scope_stack->declare_symbol(param_def->ident.get()->name, var_symbol);
    }

    void TyperVisitor::visitBlock(const ast::Block *block)
    {
        for (auto &child : block->children)
        {
            if (auto decl = dynamic_cast<const ast::Declaration *>(child.get()))
            {
                visitVarDef(decl);
            }
            else if (auto stmt = dynamic_cast<const ast::Statement *>(child.get()))
            {
                visitStatement(stmt);
            }
        }
    }

    void TyperVisitor::visitAssignStmt(const ast::Assign *assign_stmt)
    {
        auto lval = assign_stmt->lvalue.get();
        auto rval = assign_stmt->expr.get();
        auto lval_type = visitExpr(lval);
        auto rval_type = visitExpr(rval);
        if (lval_type->type != rval_type->type)
        {
            SyError().throw_error(ErrorTypeEnum::SemanticError, "type mismatch in assignment");
        }
    }

    void TyperVisitor::visitStatement(const ast::Statement *statement)
    {
        if (auto assign_stmt = dynamic_cast<const ast::Assign *>(statement))
        {
            visitAssignStmt(assign_stmt);
        }
        else if (auto block = dynamic_cast<const ast::Block *>(statement))
        {
            visitBlock(block);
        }
        else if (auto if_stmt = dynamic_cast<const ast::IfElse *>(statement))
        {
            visitIfElseStmt(if_stmt);
        }
        else if (auto while_stmt = dynamic_cast<const ast::While *>(statement))
        {
            visitWhileStmt(while_stmt);
        }
        else if (auto return_stmt = dynamic_cast<const ast::Return *>(statement))
        {
            visitReturnStmt(return_stmt);
        }
        else if (auto expr_stmt = dynamic_cast<const ast::ExprStmt *>(statement))
        {
            visitExprStmt(expr_stmt);
        }
    }

    void TyperVisitor::visitIfElseStmt(const ast::IfElse *ifelse_stmt)
    {
        auto cond_type = visitExpr(ifelse_stmt->cond.get());
        visitStatement(ifelse_stmt->then.get());
        if (ifelse_stmt->other != nullptr)
        {
            visitStatement(ifelse_stmt->other.get());
        }
    }

    void TyperVisitor::visitWhileStmt(const ast::While *while_stmt)
    {
        auto cond_type = visitExpr(while_stmt->cond.get());
        visitStatement(while_stmt->body.get());
    }

    void TyperVisitor::visitBreakStmt(const ast::Break *break_stmt)
    {
        SyError().throw_error(ErrorTypeEnum::UnimplementedError, "break statement not implemented");
    }

    void TyperVisitor::visitContinueStmt(const ast::Continue *continue_stmt)
    {
        SyError().throw_error(ErrorTypeEnum::UnimplementedError, "continue statement not implemented");
    }

    void TyperVisitor::visitReturnStmt(const ast::Return *return_stmt)
    {
        auto cur_func_scope = scope_stack->get_cur_func_scope();
        if (cur_func_scope == nullptr)
        {
            SyError().throw_error(ErrorTypeEnum::SemanticError, "return statement not in function");
        }

        auto ret_type = cur_func_scope->ret_type;
        if (ret_type->type == static_cast<int>(TypeEnum::VOID))
        {
            if (return_stmt->expr != nullptr)
            {
                SyError().throw_warning("return value in void function will be ignored");
            }
        }
        else
        {
            if (return_stmt->expr == nullptr)
            {
                SyError().throw_error(ErrorTypeEnum::SemanticError, "return value required in non-void function");
            }
            auto expr_type = visitExpr(return_stmt->expr.get());
            if(expr_type->type != ret_type->type){
                SyError().throw_error(ErrorTypeEnum::SemanticError, "return type mismatch");
            }
        }
    }

    void TyperVisitor::visitLVal(const ast::LValue *lval)
    {
        auto symbol = scope_stack->lookup_stack(lval->ident->name);
        if (symbol == nullptr)
        {
            SyError().throw_error(ErrorTypeEnum::SemanticError, "use of undeclared variable " + lval->ident->name);
        }
    }

    Type *TyperVisitor::visitExpr(const ast::Expression *expr)
    {
        if (auto lval = dynamic_cast<const ast::LValue *>(expr))
        {
            visitLVal(lval);
            auto symbol = scope_stack->lookup_stack(lval->ident->name);
            return symbol->type;
        }
        else if (auto int_literal = dynamic_cast<const ast::IntLiteral *>(expr))
        {
            return new Type(TypeEnum::INT);
        }
        else if (auto float_literal = dynamic_cast<const ast::FloatLiteral *>(expr))
        {
            return new Type(TypeEnum::FLOAT);
        }
        else if (auto binop = dynamic_cast<const ast::Binary *>(expr))
        {
            auto lhs_type = visitExpr(binop->lhs.get());
            auto rhs_type = visitExpr(binop->rhs.get());
            if (lhs_type->type != rhs_type->type)
            {
                SyError().throw_error(ErrorTypeEnum::SemanticError, "type mismatch in binary operation");
            }
            return lhs_type;
        }
        else if (auto unop = dynamic_cast<const ast::Unary *>(expr))
        {
            auto expr_type = visitExpr(unop->oprand.get());
            return expr_type;
        }
        else if (auto func_call = dynamic_cast<const ast::Call *>(expr))
        {
            auto symbol = scope_stack->lookup_stack(func_call->ident->name);
            if (symbol == nullptr)
            {
                SyError().throw_error(ErrorTypeEnum::SemanticError, "use of undeclared function " + func_call->ident->name);
            }
            if (auto func_symbol = dynamic_cast<FuncSymbol *>(symbol.get()))
            {
                if (func_symbol->num_param() != func_call->argument_list->children.size())
                {
                    SyError().throw_error(ErrorTypeEnum::SemanticError, "type mismatch in function call");
                }
                for (int i = 0; i < func_call->argument_list->children.size(); i++)
                {
                    auto arg_type = visitExpr(func_call->argument_list->children[i].get());
                    if (arg_type->type != func_symbol->get_param_type(i)->type)
                    {
                        SyError().throw_error(ErrorTypeEnum::SemanticError, "type mismatch in function call");
                    }
                }
                return func_symbol->type;
            }
            else
            {
                SyError().throw_error(ErrorTypeEnum::SemanticError, "use of undeclared function " + func_call->ident->name);
            }
        }
    }

    void TyperVisitor::visitExprStmt(const ast::ExprStmt *expr_stmt)
    {
        visitExpr(expr_stmt->expr.get());
    }
}