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

        void visitPromgram(ast::Program *program);
        void visitFuncDef(ast::Function *func_def);
        void visitVarDef(const ast::Declaration *var_def);
        void visitParamDef(const ast::Parameter *param_def);
        void visitBlock(ast::Block *block);
        void visitAssignStmt(const ast::Assign *assign_stmt);
        void visitStatement(ast::Statement *statement);
        void visitIfElseStmt(const ast::IfElse *ifelse_stmt);
        void visitWhileStmt(const ast::While *while_stmt);
        void visitBreakStmt(const ast::Break *break_stmt);
        void visitContinueStmt(const ast::Continue *continue_stmt);
        void visitReturnStmt(const ast::Return *return_stmt);
        void visitLVal(const ast::LValue *lval);
        Type* visitExpr(const ast::Expression *expr); // 返回值是Type*
        void visitExprStmt(const ast::ExprStmt *expr_stmt);
    };
}