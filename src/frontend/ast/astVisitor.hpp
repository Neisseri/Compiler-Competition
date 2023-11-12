#pragma once

#include "../lexer_parser/SysYBaseVisitor.h"
#include "tree.hpp"

using namespace frontend;
using namespace ast;
class ASTVisitor : public SysYBaseVisitor
{
public:
  antlrcpp::Any visitCompUnit(SysYParser::CompUnitContext *ctx) override
  {
    std::cout << "visitCompUnit" << std::endl;
    std::vector<std::unique_ptr<AstNode>> children;
    for (auto item : ctx->compUnitItem())
    {
      if (item->funcDef())
      {
        auto function = item->funcDef()->accept(this).as<Function *>();
        children.push_back(std::unique_ptr<Function>(function));
      }
      else if (item->decl())
      {
        auto decl = item->decl()->accept(this).as<Declaration *>();
        children.push_back(std::unique_ptr<Declaration>(decl));
      }
      else
      {
        assert(false);
      }
    }
    std::cout << "visitCompUnit end create new program" << std::endl;
    auto program = new Program(std::move(children));
    std::cout << "visitCompUnit end create new program end" << std::endl;
    return program;
  }

  antlrcpp::Any visitStringConst(SysYParser::StringConstContext *ctx) override
  {
    std::cerr << "visitStringConst unimplemented" << std::endl;
    assert(false);
    return visitChildren(ctx);
  }

  antlrcpp::Any visitFuncRParam(SysYParser::FuncRParamContext *ctx) override
  {
    std::cerr << "visitFuncRParam unimplemented" << std::endl;
    assert(false);
    return visitChildren(ctx);
  }

  antlrcpp::Any visitFuncRParams(SysYParser::FuncRParamsContext *ctx) override
  {
    std::cerr << "visitFuncRParams unimplemented" << std::endl;
    assert(false);
    return visitChildren(ctx);
  }

  antlrcpp::Any visitConstDecl(SysYParser::ConstDeclContext *ctx) override
  {
    std::vector<Declaration *> decls;
    std::unique_ptr<Type> type(ctx->bType()->accept(this).as<Type *>());
    for (auto item : ctx->constDef())
    {
      std::unique_ptr<Identifier> ident(new Identifier(item->Ident()->getText()));
      std::unique_ptr<Expression> init(item->initVal()->accept(this).as<Expression *>());
      decls.push_back(new Declaration(std::move(type), std::move(ident), std::move(init)));
    }

    return decls;
  }

  antlrcpp::Any visitInt(SysYParser::IntContext *ctx) override
  {
    return new Type(TypeEnum::INT);
  }

  antlrcpp::Any visitFloat(SysYParser::FloatContext *ctx) override
  {
    return new Type(TypeEnum::FLOAT);
  }

  antlrcpp::Any visitConstDef(SysYParser::ConstDefContext *ctx) override
  {

    std::cerr << "visitConstDef unimplemented" << std::endl;
    assert(false);
    return visitChildren(ctx);
  }

  antlrcpp::Any visitVarDecl(SysYParser::VarDeclContext *ctx) override
  {
    std::vector<Declaration *> decls;
    std::unique_ptr<Type> type(ctx->bType()->accept(this).as<Type *>());
    std::cerr<<"visitVarDecl: "<<ctx->bType()->getText()<<std::endl;
    for (auto item : ctx->varDef())
    {
      auto dimensions = item->exp();
      std::unique_ptr<Type> temp_type;
      if (dimensions.empty()){
        temp_type = std::make_unique<Type>(*type);
      }
      else{
        std::cerr<<"array decl unimplemented"<<std::endl;
        assert(false);
      }
      std::unique_ptr<Identifier> ident(new Identifier(item->Ident()->getText()));
      std::unique_ptr<Assignment> init(item->initVal()->accept(this).as<Assignment *>()); // TODO:这里怎么改？
      auto decl = new Declaration(std::move(temp_type), std::move(ident), std::move(init));
      decls.push_back(decl);
    }
    return std::make_shared<std::vector<Declaration *>>(std::move(decls));
  }

  antlrcpp::Any visitVarDef(SysYParser::VarDefContext *ctx) override
  {
    std::cerr << "visitVarDef unimplemented" << std::endl;
    assert(false);
    return visitChildren(ctx);
  }

  antlrcpp::Any visitInit(SysYParser::InitContext *ctx) override
  {
    auto expr_ = ctx->exp()->accept(this).as<Expression *>();
    std::unique_ptr<Expression> expr(std::move(expr_));
    return new Assignment(std::move(expr));
  }

  antlrcpp::Any visitInitList(SysYParser::InitListContext *ctx) override
  {
    std::cerr << "visitInitList unimplemented" << std::endl;
    assert(false);
    return visitChildren(ctx);
  }

  antlrcpp::Any visitFuncDef(SysYParser::FuncDefContext *ctx) override
  {
    auto const type_ = (ctx->funcType()->accept(this)).as<Type *>();
    std::unique_ptr<Type> type(type_);
    std::unique_ptr<Identifier> ident(new Identifier(ctx->Ident()->getText()));
    std::vector<Declaration *> params;
    if (ctx->funcFParams())
    {
      auto const params_ = (ctx->funcFParams()->accept(this)).as<std::vector<Declaration *>>();
      params = std::move(params_);
    }
    std::vector<std::unique_ptr<Parameter>> params_children;
    if (auto params_ = ctx->funcFParams())
    {
      for (auto param_ : params_->funcFParam())
      {
        auto const param = param_->accept(this).as<Parameter *>();
        params_children.push_back(std::unique_ptr<Parameter>(param));
      }
    }
    std::unique_ptr<ParameterList> params_list(new ParameterList(std::move(params_children)));
    std::cerr<<"construct funct block: "<<ctx->Ident()->getText()<<std::endl;

    auto const body_ = (ctx->block()->accept(this)).as<Block *>();
    std::unique_ptr<Block> body(body_);

    std::cerr << "construct funct block done!" << std::endl;
    return new Function(std::move(type), std::move(ident), std::move(params_list), std::move(body));
  }

  antlrcpp::Any visitVoid(SysYParser::VoidContext *ctx) override
  {
    std::cerr << "visitVoid unimplemented" << std::endl;
    assert(false);
    return visitChildren(ctx);
  }

  antlrcpp::Any visitFuncFParams(SysYParser::FuncFParamsContext *ctx) override
  {
    std::cerr << "visitFuncFParams unimplemented" << std::endl;
    assert(false);
    return visitChildren(ctx);
  }

  antlrcpp::Any visitScalarParam(SysYParser::ScalarParamContext *ctx) override
  {
    std::cerr << "visitScalarParam unimplemented" << std::endl;
    assert(false);
    return visitChildren(ctx);
  }

  antlrcpp::Any visitArrayParam(SysYParser::ArrayParamContext *ctx) override
  {
    std::cerr << "visitArrayParam unimplemented" << std::endl;
    assert(false);
    return visitChildren(ctx);
  }

  antlrcpp::Any visitBlock(SysYParser::BlockContext *ctx) override
  {
    std::vector<std::unique_ptr<AstNode>> children;
    for (auto item : ctx->blockItem())
    {
      if (auto decl = item->decl())
      {
        auto const decls =
            decl->accept(this).as<std::shared_ptr<std::vector<Declaration *>>>();
        for (auto d : *decls)
        {
          children.push_back(std::unique_ptr<Declaration>(d));
        }
      }
      else if (auto stmt_ = item->stmt())
      {
        auto const stmt = stmt_->accept(this).as<Statement *>();
        children.emplace_back(std::unique_ptr<Statement>(stmt));
      }
      else
      {
        assert(false);
      }
    }
    std::cerr << "visitBlock done!" << std::endl;
    return new Block(std::move(children));
  }

  antlrcpp::Any visitAssign(SysYParser::AssignContext *ctx) override
  {
    auto const lhs = ctx->lVal()->accept(this).as<LValue *>();
    auto const rhs = ctx->exp()->accept(this).as<Expression *>();

    auto const ret = new Assign(std::unique_ptr<LValue>(lhs),
                                std::unique_ptr<Expression>(rhs));
    std::cerr<<"visitAssign done!"<<std::endl;
    return static_cast<Statement *>(ret);
  }

  antlrcpp::Any visitExprStmt(SysYParser::ExprStmtContext *ctx) override
  {
    auto const expr = ctx->exp()->accept(this).as<Expression *>();
    auto const ret = new ExprStmt(std::unique_ptr<Expression>(expr));
    return static_cast<Statement *>(ret);
  }

  antlrcpp::Any visitBlockStmt(SysYParser::BlockStmtContext *ctx) override
  {
    auto const block = ctx->block()->accept(this).as<Block *>();
    return static_cast<Statement *>(block);
  }

  antlrcpp::Any visitIfElse(SysYParser::IfElseContext *ctx) override
  {
    auto const cond = ctx->cond()->accept(this).as<Expression *>();
    auto const if_body = ctx->stmt(0)->accept(this).as<Statement *>();
    //check if there is else
    Statement *else_body = nullptr;
    if (ctx->stmt().size() > 1)
    {
      else_body = ctx->stmt(1)->accept(this).as<Statement *>();
    }
    auto const ret = new IfElse(std::unique_ptr<Expression>(cond),
                                std::unique_ptr<Statement>(if_body),
                                else_body ? std::unique_ptr<Statement>(else_body) : nullptr);
    return static_cast<Statement *>(ret);
  }

  antlrcpp::Any visitWhile(SysYParser::WhileContext *ctx) override
  {
    auto const cond = ctx->cond()->accept(this).as<Expression *>();
    auto const body = ctx->stmt()->accept(this).as<Statement *>();
    auto const ret = new While(std::unique_ptr<Expression>(cond),
                               std::unique_ptr<Statement>(body));
    return static_cast<Statement *>(ret);
  }

  antlrcpp::Any visitBreak(SysYParser::BreakContext *ctx) override
  {
    auto const ret = new Break();
    return static_cast<Statement *>(ret);
  }

  antlrcpp::Any visitContinue(SysYParser::ContinueContext *ctx) override
  {
    auto const ret = new Continue();
    return static_cast<Statement *>(ret);
  }

  antlrcpp::Any visitReturn(SysYParser::ReturnContext *ctx) override
  {
    std::unique_ptr<Expression> res;
    if (auto exp = ctx->exp())
    {
      res.reset(exp->accept(this).as<Expression *>());
    }
    auto const ret = new Return(std::move(res));
    return static_cast<Statement *>(ret);
  }

  antlrcpp::Any visitLVal(SysYParser::LValContext *ctx) override
  {
    auto const ident = ctx->Ident()->getText();
    auto const lval_ident = new Identifier(ident);
    std::vector<std::unique_ptr<Expression>> indices;
    for (auto exp : ctx->exp())
    {
      auto const index = exp->accept(this).as<Expression *>();
      indices.emplace_back(index);
    }
    return new LValue(std::unique_ptr<Identifier>(lval_ident));
  }

  antlrcpp::Any visitPrimaryExp_(SysYParser::PrimaryExp_Context *ctx) override
  {
    std::cerr<<"visitPrimaryExp_ warning"<<std::endl;
    if (ctx->number())
    {
      std::cerr
          << "visitPrimaryExp_ number" << std::endl;
      return ctx->number()->accept(this);
    }
    else
    {
      assert(ctx->exp());
      std::cerr<<"visitPrimaryExp_ exp"<<std::endl;
      return ctx->exp()->accept(this);
    }
  }

  antlrcpp::Any visitLValExpr(SysYParser::LValExprContext *ctx) override
  {
    auto const lval = ctx->lVal()->accept(this).as<LValue *>();
    return static_cast<Expression *>(lval);
  }

  antlrcpp::Any
  visitDecIntConst(SysYParser::DecIntConstContext *const ctx)
  {
    return int(std::stoll(ctx->getText(), nullptr, 10));
  }

  antlrcpp::Any
  visitOctIntConst(SysYParser::OctIntConstContext *const ctx)
  {
    return int(std::stoll(ctx->getText(), nullptr, 8));
  }

  antlrcpp::Any
  visitHexIntConst(SysYParser::HexIntConstContext *const ctx)
  {
    return int(std::stoll(ctx->getText(), nullptr, 16));
  }

  antlrcpp::Any
  visitDecFloatConst(SysYParser::DecFloatConstContext *const ctx)
  {
    return std::stof(ctx->getText());
  }

  antlrcpp::Any
  visitHexFloatConst(SysYParser::HexFloatConstContext *const ctx)
  {
    return std::stof(ctx->getText());
  }

  antlrcpp::Any visitNumber(SysYParser::NumberContext *ctx) override
  {
    if (ctx->intConst())
    {
      auto val = ctx->intConst()->accept(this).as<int>();
      auto literal = new IntLiteral(val);
      return static_cast<Expression *>(literal);
    }
    if (ctx->floatConst())
    {
      auto val = ctx->floatConst()->accept(this).as<float>();
      auto literal = new FloatLiteral{val};
      return static_cast<Expression *>(literal);
    }
    assert(false);
    return static_cast<Expression *>(nullptr);
  }


  antlrcpp::Any visitCall(SysYParser::CallContext *ctx) override
  {
    auto const ident = ctx->Ident()->getText();
    std::vector<std::unique_ptr<Expression>> args;
    if (auto args_ = ctx->funcRParams())
    {
      for (auto arg_ : args_->funcRParam())
      {
        auto const arg = arg_->accept(this).as<Expression *>();
        args.push_back(std::unique_ptr<Expression>(arg));
      }
    }
    std::unique_ptr<ExpressionList> args_list(new ExpressionList(std::move(args)));
    std::unique_ptr<Identifier> ident_(new Identifier(ident));
    auto const ret = new Call(std::move(ident_), std::move(args_list));
    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitUnaryAdd(SysYParser::UnaryAddContext *ctx) override
  {
    auto const operand = ctx->unaryExp()->accept(this).as<Expression *>();
    auto const op = new UnaryOp(UnaryOpEnum::UNARYADD);
    auto const ret =
        new Unary(std::unique_ptr<UnaryOp>(op), std::unique_ptr<Expression>(operand));
    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitUnarySub(SysYParser::UnarySubContext *ctx) override
  {
    auto const operand = ctx->unaryExp()->accept(this).as<Expression *>();
    auto const op = new UnaryOp(UnaryOpEnum::UNARYSUB);
    auto const ret =
        new Unary(std::unique_ptr<UnaryOp>(op), std::unique_ptr<Expression>(operand));
    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitNot(SysYParser::NotContext *ctx) override
  {
    auto const operand = ctx->unaryExp()->accept(this).as<Expression *>();
    auto const op = new UnaryOp(UnaryOpEnum::NOT);
    auto const ret =
        new Unary(std::unique_ptr<UnaryOp>(op), std::unique_ptr<Expression>(operand));
    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitDiv(SysYParser::DivContext *ctx) override
  {
    auto const lhs = ctx->mulExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->unaryExp()->accept(this).as<Expression *>();
    auto const op = new BinaryOp(BinaryOpEnum::DIV);
    auto const ret = new Binary(std::unique_ptr<Expression>(lhs),
                                std::unique_ptr<BinaryOp>(op),
                                std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitMod(SysYParser::ModContext *ctx) override
  {
    auto const lhs = ctx->mulExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->unaryExp()->accept(this).as<Expression *>();
    auto const op = new BinaryOp(BinaryOpEnum::MOD);
    auto const ret = new Binary(std::unique_ptr<Expression>(lhs),
                                std::unique_ptr<BinaryOp>(op),
                                std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitMul(SysYParser::MulContext *ctx) override
  {
    auto const lhs = ctx->mulExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->unaryExp()->accept(this).as<Expression *>();
    auto const op = new BinaryOp(BinaryOpEnum::MUL);
    auto const ret = new Binary(std::unique_ptr<Expression>(lhs),
                                std::unique_ptr<BinaryOp>(op),
                                std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitAdd(SysYParser::AddContext *ctx) override
  {
    auto const lhs = ctx->addExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->mulExp()->accept(this).as<Expression *>();
    auto const op = new BinaryOp(BinaryOpEnum::ADD);
    auto const ret = new Binary(std::unique_ptr<Expression>(lhs),
                                std::unique_ptr<BinaryOp>(op),
                                std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitSub(SysYParser::SubContext *ctx) override
  {
    auto const lhs = ctx->addExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->mulExp()->accept(this).as<Expression *>();
    auto const op = new BinaryOp(BinaryOpEnum::SUB);
    auto const ret = new Binary(std::unique_ptr<Expression>(lhs),
                                std::unique_ptr<BinaryOp>(op),
                                std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitGeq(SysYParser::GeqContext *ctx) override
  {
    auto const lhs = ctx->relExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->addExp()->accept(this).as<Expression *>();
    auto const op = new BinaryOp(BinaryOpEnum::GE);
    auto const ret = new Binary(std::unique_ptr<Expression>(lhs),
                                std::unique_ptr<BinaryOp>(op),
                                std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitLt(SysYParser::LtContext *ctx) override
  {
    auto const lhs = ctx->relExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->addExp()->accept(this).as<Expression *>();
    auto const op = new BinaryOp(BinaryOpEnum::LT);
    auto const ret = new Binary(std::unique_ptr<Expression>(lhs),
                                std::unique_ptr<BinaryOp>(op),
                                std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitLeq(SysYParser::LeqContext *ctx) override
  {
    auto const lhs = ctx->relExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->addExp()->accept(this).as<Expression *>();
    auto const op = new BinaryOp(BinaryOpEnum::LE);
    auto const ret = new Binary(std::unique_ptr<Expression>(lhs),
                                std::unique_ptr<BinaryOp>(op),
                                std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitGt(SysYParser::GtContext *ctx) override
  {
    auto const lhs = ctx->relExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->addExp()->accept(this).as<Expression *>();
    auto const op = new BinaryOp(BinaryOpEnum::GT);
    auto const ret = new Binary(std::unique_ptr<Expression>(lhs),
                                std::unique_ptr<BinaryOp>(op),
                                std::unique_ptr<Expression>(rhs));

    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitNeq(SysYParser::NeqContext *ctx) override
  {
    auto const lhs = ctx->eqExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->relExp()->accept(this).as<Expression *>();
    auto const op = new BinaryOp(BinaryOpEnum::NE);
    auto const ret = new Binary(std::unique_ptr<Expression>(lhs),
                                std::unique_ptr<BinaryOp>(op),
                                std::unique_ptr<Expression>(rhs));

    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitEq(SysYParser::EqContext *ctx) override
  {
    auto const lhs = ctx->eqExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->relExp()->accept(this).as<Expression *>();
    auto const op = new BinaryOp(BinaryOpEnum::EQ);
    auto const ret = new Binary(std::unique_ptr<Expression>(lhs),
                                std::unique_ptr<BinaryOp>(op),
                                std::unique_ptr<Expression>(rhs));

    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitAnd(SysYParser::AndContext *ctx) override
  {
    auto const lhs = ctx->lAndExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->eqExp()->accept(this).as<Expression *>();
    auto const op = new BinaryOp(BinaryOpEnum::AND);
    auto const ret = new Binary(std::unique_ptr<Expression>(lhs),
                                std::unique_ptr<BinaryOp>(op),
                                std::unique_ptr<Expression>(rhs));

    return static_cast<Expression *>(ret);
  }

  antlrcpp::Any visitOr(SysYParser::OrContext *ctx) override
  {
    auto const lhs = ctx->lOrExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->lAndExp()->accept(this).as<Expression *>();
    auto const op = new BinaryOp(BinaryOpEnum::OR);
    auto const ret = new Binary(std::unique_ptr<Expression>(lhs),
                                std::unique_ptr<BinaryOp>(op),
                                std::unique_ptr<Expression>(rhs));

    return static_cast<Expression *>(ret);
  }

};