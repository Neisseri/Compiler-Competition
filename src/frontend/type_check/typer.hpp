#pragma once

#include "../ast/tree.hpp"
#include "../scope/scope.hpp"
#include "../scope/symbol.hpp"
#include "../type/type.hpp"

namespace frontend{

    class TyperVisitor {
    public:
        std::unique_ptr<ScopeStack> scope_stack;
        std::unique_ptr<Scope> global_scope;

        void visitPromgram(const ast::Program &program);
        void visitFuncDef(const ast::FuncDef &func_def);
        void visitVarDef(const ast::VarDef &var_def);
        void visitBlock(const ast::Block &block);
        void visitAssignStmt(const ast::AssignStmt &assign_stmt);
        void visitStatement(const ast::Statement &statement);
        void visitLVal(const ast::LVal &lval);

        Type visitExpr(const ast::Expr &expr);//返回值是Type


    }
}