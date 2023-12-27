#include "typer.hpp"
#include "../../common/error.hpp"
#include "../../common/const.hpp"

namespace frontend
{
    void TyperVisitor::visitPromgram(ast::Program *program)
    {
        SyError().throw_info("visitProgram" + program->toString());
        this->global_scope = std::make_unique<Scope>(ScopeType::GlobalScope);
        this->scope_stack = std::make_unique<ScopeStack>();
        scope_stack->scope_push(std::move(global_scope));
        for (auto &child : program->children)
        {
            // if child is a function
            if (auto decl = dynamic_cast<const ast::Declaration *>(child.get()))
            {
                visitVarDef(decl);
            }
            else if (auto func = dynamic_cast<ast::Function *>(child.get()))
            {
                visitFuncDef(func);
            }
        }
    }

    void TyperVisitor::visitFuncDef(ast::Function *func_def)
    {
        SyError().throw_info("visitFuncDef" + func_def->toString());
        auto name = func_def->ident->name;
        if (scope_stack->lookup_stack(name) != nullptr)
        {
            SyError().throw_error(ErrorTypeEnum::SemanticError, "redeclaration of function " + name);
        }
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
        if (func_def->ret_type->type == static_cast<int>(TypeEnum::VOID))
        {
            // create a return statement for void function
            auto int_literal = std::make_unique<ast::IntLiteral>(0);

            auto return_stmt = std::make_unique<ast::Return>(std::move(int_literal));
            func_def->body->children.push_back(std::move(return_stmt));
        }
        this->scope_stack->scope_pop();
    }

    void TyperVisitor::visitVarDef(const ast::Declaration *var_def)
    {
        SyError().throw_info("visitVarDef " + var_def->toString());
        auto name = var_def->ident.get()->name;
        if (scope_stack->lookup_top(name) != nullptr)
        {
            SyError().throw_error(ErrorTypeEnum::SemanticError, "redeclaration of variable " + name);
        }
        if (var_def->is_array)
        {
            // get children
            SyError().throw_info("var_def->indices->children.size() " + std::to_string(var_def->indices->children.size()));
            for (auto &child : var_def->indices->children)
            {
                SyError().throw_info("visitDims " + child->toString());
                auto expr_type = visitExpr(child.get());
                if (expr_type->type != static_cast<int>(TypeEnum::INT))
                {
                    SyError().throw_error(ErrorTypeEnum::SemanticError, "array index must be int");
                }
            }
        }

        auto var_symbol = std::make_shared<VarSymbol>(var_def->ident.get()->name, std::move(var_def->var_type.get()), scope_stack->stack.back()->type == ScopeType::GlobalScope);
        scope_stack->declare_symbol(var_def->ident.get()->name, var_symbol);
        if (var_def->init_expr != nullptr)
        {
            Type *expr_type = visitExpr(var_def->init_expr.get());
            if (!expr_type)
            {
                SyError().throw_info("expr_type is nullptr , its an array ,return");
            }
            if (expr_type && expr_type->type != var_symbol.get()->type->type)
            {
                SyError().throw_error(ErrorTypeEnum::SemanticError, "type mismatch in variable declaration");
            }
        }
        // rename var by adding scope_id
        var_def->ident->name = name + "#" + std::to_string(scope_stack->stack.back()->scope_id);
    }

    void TyperVisitor::visitParamDef(const ast::Parameter *param_def)
    {
        SyError().throw_info("visitParamDef" + param_def->toString());
        auto var_symbol = std::make_shared<VarSymbol>(param_def->ident.get()->name, std::move(param_def->var_type.get()), false);
        scope_stack->declare_symbol(param_def->ident.get()->name, var_symbol);
        param_def->ident->name = param_def->ident.get()->name + "#" + std::to_string(scope_stack->stack.back()->scope_id);
    }

    void TyperVisitor::visitBlock(ast::Block *block)
    {
        SyError().throw_info("visitBlock" + block->toString());
        scope_stack->scope_push(std::make_unique<Scope>(ScopeType::BlockScope));

        for (auto it = block->children.begin(); it != block->children.end();)
        {
            bool shouldRemove = false;

            if (auto decl = dynamic_cast<const ast::Declaration *>(it->get()))
            {
                visitVarDef(decl);
            }
            else if (auto stmt = dynamic_cast<ast::Statement *>(it->get()))
            {
                if (auto expr_stmt = dynamic_cast<ast::ExprStmt *>(stmt))
                {
                    if (!expr_stmt->expr)
                    {
                        // Mark this child for removal
                        shouldRemove = true;
                    }
                }
                // Visit the statement if it's not marked for removal
                if (!shouldRemove)
                {
                    visitStatement(stmt);
                }
            }

            if (shouldRemove)
            {
                it = block->children.erase(it); // Remove the child and update the iterator
            }
            else
            {
                ++it; // Move to the next element
            }
        }

        scope_stack->scope_pop();
    }

    void TyperVisitor::visitAssignStmt(const ast::Assign *assign_stmt)
    {
        SyError().throw_info("visitAssignStmt" + assign_stmt->toString());
        auto lval = assign_stmt->lvalue.get();
        auto rval = assign_stmt->expr.get();
        auto lval_type = visitExpr(lval);
        SyError().throw_info("visitAssignStmt" + lval_type->toString());
        auto rval_type = visitExpr(rval);
        if (!rval_type)
        {
            SyError().throw_info("rval_type is nullptr , its an array ,return");
        }
        if (rval_type && lval_type->type != rval_type->type)
        {
            SyError().throw_error(ErrorTypeEnum::SemanticError, "type mismatch in assignment");
        }
    }

    void TyperVisitor::visitStatement(ast::Statement *statement)
    {
        SyError().throw_info("visitStatement" + statement->toString());
        if (auto break_stmt = dynamic_cast<const ast::Break *>(statement))
        {
            visitBreakStmt(break_stmt);
        }
        else if (auto continue_stmt = dynamic_cast<const ast::Continue *>(statement))
        {
            visitContinueStmt(continue_stmt);
        }
        else if (auto assign_stmt = dynamic_cast<const ast::Assign *>(statement))
        {
            visitAssignStmt(assign_stmt);
        }
        else if (auto block = dynamic_cast<ast::Block *>(statement))
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
        else if (auto expr_stmt = dynamic_cast<ast::ExprStmt *>(statement))
        {
            visitExprStmt(expr_stmt);
        }
    }

    void TyperVisitor::visitIfElseStmt(const ast::IfElse *ifelse_stmt)
    {
        visitExpr(ifelse_stmt->cond.get());
        visitStatement(ifelse_stmt->then.get());
        if (ifelse_stmt->other)
        {
            visitStatement(ifelse_stmt->other.get());
        }
    }

    void TyperVisitor::visitWhileStmt(const ast::While *while_stmt)
    {
        visitExpr(while_stmt->cond.get());
        auto scope = std::make_unique<Scope>(ScopeType::LoopScope);
        scope_stack->scope_push(std::move(scope));
        visitStatement(while_stmt->body.get());
        scope_stack->scope_pop();
    }

    void TyperVisitor::visitBreakStmt(const ast::Break *break_stmt)
    {
        if (!scope_stack->is_in_loop())
        {
            SyError().throw_error(ErrorTypeEnum::SemanticError, "break statement not in loop");
        }
    }

    void TyperVisitor::visitContinueStmt(const ast::Continue *continue_stmt)
    {
        if (!scope_stack->is_in_loop())
        {
            SyError().throw_error(ErrorTypeEnum::SemanticError, "continue statement not in loop");
        }
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
            if (expr_type && expr_type->type != ret_type->type)
            {
                SyError().throw_error(ErrorTypeEnum::SemanticError, "return type mismatch");
            }
        }
    }

    void TyperVisitor::visitLVal(const ast::LValue *lval)
    {
        std::string name = lval->ident->name;
        auto symbol = scope_stack->lookup_stack(name);
        if (symbol == nullptr)
        {
            SyError().throw_error(ErrorTypeEnum::SemanticError, "use of undeclared variable " + name);
        }
        if (lval->indices.size() > 0)
        {
            SyError().throw_info("lval->indices->children.size() " + std::to_string(lval->indices.size()));
            for (auto &child : lval->indices)
            {
                SyError().throw_info("visitDims " + child->toString());
                auto expr_type = visitExpr(child.get());
            }
        }
    }

    Type *TyperVisitor::visitExpr(const ast::Expression *expr)
    {
        SyError().throw_info("visitExpr" + expr->toString());
        if (auto lval = dynamic_cast<const ast::LValue *>(expr))
        {
            SyError().throw_info("visitLvalExpr" + lval->toString());
            visitLVal(lval);
            auto symbol = scope_stack->lookup_stack(lval->ident->name);
            std::string new_name = lval->ident->name + "#" + std::to_string(symbol->scope_id);
            lval->ident->name = new_name;
            return symbol->type;
        }
        else if (auto int_literal = dynamic_cast<const ast::IntLiteral *>(expr))
        {
            SyError().throw_info("visitIntLiteralExpr" + int_literal->toString());
            Type *ret = new Type(TypeEnum::INT);
            std::cerr << "ret->type " << ret << std::endl;
            return ret;
        }
        else if (auto float_literal = dynamic_cast<const ast::FloatLiteral *>(expr))
        {
            return new Type(TypeEnum::FLOAT);
        }
        else if (auto binop = dynamic_cast<const ast::Binary *>(expr))
        {
            SyError().throw_info("visitBinopExpr" + binop->toString());
            auto lhs_type = visitExpr(binop->lhs.get());
            auto rhs_type = visitExpr(binop->rhs.get());
            if (lhs_type && rhs_type && lhs_type->type != rhs_type->type)
            {
                SyError().throw_error(ErrorTypeEnum::SemanticError, "type mismatch in binary operation");
            }
            return lhs_type;
        }
        else if (auto unop = dynamic_cast<const ast::Unary *>(expr))
        {
            SyError().throw_info("visitUnonExpr" + unop->toString());
            auto expr_type = visitExpr(unop->oprand.get());
            return expr_type;
        }
        else if (auto func_call = dynamic_cast<const ast::Call *>(expr))
        {
            SyError().throw_info("visiCalltExpr" + func_call->toString());
            auto symbol = scope_stack->lookup_stack(func_call->ident->name);
            if (symbol == nullptr)
            {
                SyError().throw_info("use of undeclared function " + func_call->ident->name);
                for (int i = 0; i < func_call->argument_list->children.size(); i++)
                {
                    auto arg_type = visitExpr(func_call->argument_list->children[i].get());
                }
                return nullptr;
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
                    if (arg_type && arg_type->type != func_symbol->get_param_type(i)->type)
                    {
                        SyError().throw_error(ErrorTypeEnum::SemanticError, "type mismatch in function call");
                    }
                }
                return func_symbol->type;
            }
            else
            {
                SyError().throw_error(ErrorTypeEnum::SemanticError, "Can't convert to function" + func_call->ident->name);
            }
        }
        else if (auto assignment = dynamic_cast<const ast::Assignment *>(expr))
        {
            SyError().throw_info("visitAssignmentExpr" + assignment->toString());
            if (assignment->value)
            {
                auto rval_type = visitExpr(assignment->value.get());
                return rval_type;
            }
            else
            {
                for (auto &child : assignment->values)
                {
                    auto rval_type = visitExpr(child.get());
                }
                return nullptr;
            }
        }
        else
        {
            SyError().throw_error(ErrorTypeEnum::UnimplementedError, "expression not implemented");
        }

        return nullptr;
    }

    void TyperVisitor::visitExprStmt(ast::ExprStmt *expr_stmt)
    {
        SyError().throw_info("visitExprStmt" + expr_stmt->toString());
        if (expr_stmt->expr)
        {
            visitExpr(expr_stmt->expr.get());
        }
    }
}