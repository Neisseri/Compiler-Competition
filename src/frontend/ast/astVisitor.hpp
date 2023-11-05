#pragma once

#include "../lexer_parser/SysYBaseVisitor.h"
#include "tree.hpp"

using namespace frontend;

class ASTVisitor : public SysYBaseVisitor{
public:
    
  virtual antlrcpp::Any visitCompUnit(SysYParser::CompUnitContext *ctx) override {
    std::vector<std::unique_ptr<AstNode>> children;
    for (auto item : ctx->compUnitItem()){
        if (item->funcDef()){
            auto function = item->funcDef()->accept(this);
            children.push_back(std::unique_ptr<Function>(function));
        }
        else if (item->decl()){
            auto decl = item->decl()->accept(this);
            children.push_back(std::unique_ptr<Declaration>(decl));
        }
        else {
            assert(false);
        }
    }
    auto program = new Program(std::move(children));
    return program;
  }

  virtual antlrcpp::Any visitCompUnitItem(SysYParser::CompUnitItemContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitDecl(SysYParser::DeclContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitConstDecl(SysYParser::ConstDeclContext *ctx) override {
    std::vector<Declaration*> decls;

    std::unique_ptr<Type> type(ctx->bType()->accept(this));
    for (auto item : ctx->constDef()){
        std::unique_ptr<Identifier> ident(new Identifier(item->Ident()->getText()));
        std::unique_ptr<Expression> init(item->initVal()->accept(this));
        decls.push_back(new Declaration(std::move(type), std::move(ident), std::move(init)));
    }

    return decls;
  }

  virtual antlrcpp::Any visitInt(SysYParser::IntContext *ctx) override {
    return new Type(INT);
  }

  virtual antlrcpp::Any visitFloat(SysYParser::FloatContext *ctx) override {
    return new Type(FLOAT);
  }

  virtual antlrcpp::Any visitConstDef(SysYParser::ConstDefContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitVarDecl(SysYParser::VarDeclContext *ctx) override {
    std::vector<Declaration*> decls;

    std::unique_ptr<Type> type(ctx->bType()->accept(this));
    for (auto item : ctx->varDef()){
        std::unique_ptr<Identifier> ident(new Identifier(item->Ident()->getText()));
        std::unique_ptr<Expression> init(item->initVal()->accept(this));
        decls.push_back(new Declaration(std::move(type), std::move(ident), std::move(init)));
    }

    return decls;
  }

  virtual antlrcpp::Any visitVarDef(SysYParser::VarDefContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitInit(SysYParser::InitContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitInitList(SysYParser::InitListContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitFuncDef(SysYParser::FuncDefContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitFuncType_(SysYParser::FuncType_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitVoid(SysYParser::VoidContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitFuncFParams(SysYParser::FuncFParamsContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitScalarParam(SysYParser::ScalarParamContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitArrayParam(SysYParser::ArrayParamContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitBlock(SysYParser::BlockContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitBlockItem(SysYParser::BlockItemContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitAssign(SysYParser::AssignContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitExprStmt(SysYParser::ExprStmtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitBlockStmt(SysYParser::BlockStmtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitIfElse(SysYParser::IfElseContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitWhile(SysYParser::WhileContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitBreak(SysYParser::BreakContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitContinue(SysYParser::ContinueContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitReturn(SysYParser::ReturnContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitExp(SysYParser::ExpContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitCond(SysYParser::CondContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitLVal(SysYParser::LValContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitPrimaryExp_(SysYParser::PrimaryExp_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitLValExpr(SysYParser::LValExprContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitDecIntConst(SysYParser::DecIntConstContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitOctIntConst(SysYParser::OctIntConstContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitHexIntConst(SysYParser::HexIntConstContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitDecFloatConst(SysYParser::DecFloatConstContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitHexFloatConst(SysYParser::HexFloatConstContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitNumber(SysYParser::NumberContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitUnaryExp_(SysYParser::UnaryExp_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitCall(SysYParser::CallContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitUnaryAdd(SysYParser::UnaryAddContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitUnarySub(SysYParser::UnarySubContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitNot(SysYParser::NotContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitStringConst(SysYParser::StringConstContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitFuncRParam(SysYParser::FuncRParamContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitFuncRParams(SysYParser::FuncRParamsContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitDiv(SysYParser::DivContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitMod(SysYParser::ModContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitMul(SysYParser::MulContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitMulExp_(SysYParser::MulExp_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitAddExp_(SysYParser::AddExp_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitAdd(SysYParser::AddContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitSub(SysYParser::SubContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitGeq(SysYParser::GeqContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitLt(SysYParser::LtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitRelExp_(SysYParser::RelExp_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitLeq(SysYParser::LeqContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitGt(SysYParser::GtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitNeq(SysYParser::NeqContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitEq(SysYParser::EqContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitEqExp_(SysYParser::EqExp_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitLAndExp_(SysYParser::LAndExp_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitAnd(SysYParser::AndContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitOr(SysYParser::OrContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitLOrExp_(SysYParser::LOrExp_Context *ctx) override {
    return visitChildren(ctx);
  }
};