/*
author: ggx
date: 2023/11/1
这是一个
*/

#include <cassert>
#include <memory>
#include <string>

#include "frontend/ast.hpp"
#include "frontend/astVisitor.hpp"

using namespace frontend;

CompileUnit const &AstVisitor::compileUnit() const
{
    return *this->m_compile_unit;
}

antlrcpp::Any AstVisitor::visitCompUnit(SysYParser::CompUnitContext *ctx)
{
    std::cout << "visitCompUnit" << std::endl;
    std::vector<CompileUnit::Child> children;
    for (auto item : ctx->compUnitItem())
    {
        std::cout << "dec123" << std::endl;
        if (auto decl = item->decl())
        {
            std::cout << "decl" << std::endl;
            auto const decls = decl->accept(this).as<std::shared_ptr<std::vector<Declaration *>>>();
            std::cout << "decls size:" << std::endl;
            for (auto d : *decls)
            {
                children.emplace_back(std::unique_ptr<Declaration>(d));
            }
        }
        else if (auto func_ = item->funcDef())
        {
            auto const func = func_->accept(this).as<Function *>();
            children.emplace_back(std::unique_ptr<Function>(func));
        }
        else
        {
            assert(false);
        }
    }
    auto compile_unit = new CompileUnit(std::move(children));
    m_compile_unit.reset(compile_unit);
    std::cout << "visitCompUnit end" << std::endl;
    return compile_unit;
}

antlrcpp::Any AstVisitor::visitCompUnitItem(SysYParser::CompUnitItemContext *ctx)
{
    return SysYBaseVisitor::visitCompUnitItem(ctx);
}

antlrcpp::Any AstVisitor::visitDecl(SysYParser::DeclContext *ctx)
{
    return SysYBaseVisitor::visitDecl(ctx);
}

antlrcpp::Any AstVisitor::visitInt(SysYParser::IntContext *ctx)
{
    return new ScalarType(Int);
}

antlrcpp::Any
AstVisitor::visitScalarParam(SysYParser::ScalarParamContext *const ctx)
{
    auto const type_ = ctx->bType()->accept(this).as<ScalarType *>();
    std::unique_ptr<SysYType> type(type_);
    Identifier ident(ctx->Ident()->getText());
    return new Parameter(std::move(type), std::move(ident));
}

antlrcpp::Any AstVisitor::visitArrayParam(SysYParser::ArrayParamContext *ctx)
{
    std::cerr << "array param not implemented" << std::endl;
    assert(false);

    // auto const basic_type_ = ctx->bType()->accept(this).as<ScalarType *>();
    // std::unique_ptr<ScalarType> basic_type(basic_type_);
    // Identifier ident(ctx->Ident()->getText());
    // auto dimensions = this->visitDimensions(ctx->exp());
    // std::unique_ptr<SysYType> type(
    //     new ArrayType(*basic_type, std::move(dimensions), true));
    // return new Parameter(std::move(type), std::move(ident));
}

antlrcpp::Any AstVisitor::visitFuncDef(SysYParser::FuncDefContext *const ctx)
{
    auto const type_ = (ctx->funcType()->accept(this)).as<ScalarType *>();
    // print the class name of type_
    std::cout << "type_ class name:" << typeid(ctx->funcType()->accept(this)).name() << std::endl;
    std::cout << "functtype_ class name:" << typeid(ctx->funcType()).name() << std::endl;
    std::cout << "type_name:" << ctx->funcType()->getText() << std::endl;
    // return nullptr;

    std::unique_ptr<ScalarType> type(type_);

    std::cout << "visitFuncDef" << std::endl;
    Identifier ident(ctx->Ident()->getText());
    std::cout << "ident:" << ctx->Ident()->getText() << std::endl;
    std::vector<std::unique_ptr<Parameter>> params;
    // if (auto params_ = ctx->funcFParams())
    // {
    //     std::cout << "params_ class name:" << typeid(params_).name() << std::endl;
    //     for (auto param_ : params_->funcFParam())
    //     {
    //         auto const param = param_->accept(this).as<Parameter *>();
    //         params.emplace_back(param);
    //     }
    // }
    std::cout << "params size:" << params.size() << std::endl;
    auto const body_ = ctx->block()->accept(this).as<Block *>();
    std::cout << "body_ class name:" << typeid(body_).name() << std::endl;
    std::unique_ptr<Block> body(body_);

    std::cout << "visitFuncDef end" << std::endl;
    return new Function(std::move(type), std::move(ident), std::move(params),
                        std::move(body));
}

antlrcpp::Any AstVisitor::visitBlock(SysYParser::BlockContext *const ctx)
{
    std::cout << "visitBlock" << std::endl;
    std::vector<Block::Child> children;
    for (auto item : ctx->blockItem())
    {
        if (auto decl = item->decl())
        {
            std::cout << "decl" << std::endl;
            auto const decls = decl->accept(this).as<std::shared_ptr<std::vector<Declaration *>>>();
            std::cout << "decls size:" << std::endl;
            for (auto d : *decls)
            {
                children.emplace_back(std::unique_ptr<Declaration>(d));
            }
        }
        else if (auto stmt_ = item->stmt())
        {
            std::cout << "stmt" << std::endl;
            auto const stmt = stmt_->accept(this).as<Statement *>();
            children.emplace_back(std::unique_ptr<Statement>(stmt));
        }
        else
        {
            assert(false);
        }
    }
    std::cout << "visitBlock end" << std::endl;
    return new Block(std::move(children));
}

antlrcpp::Any AstVisitor::visitAssign(SysYParser::AssignContext *const ctx)
{
    auto const lhs_ = ctx->lVal()->accept(this).as<LValue *>();
    std::unique_ptr<LValue>
        lhs(lhs_);
    auto const rhs_ = ctx->exp()->accept(this).as<Expression *>();
    std::unique_ptr<Expression>
        rhs(rhs_);
    auto const ret = new Assignment(std::move(lhs), std::move(rhs));
    return static_cast<Statement *>(ret);
}

antlrcpp::Any AstVisitor::visitVoid(SysYParser::VoidContext *const ctx)
{
    return static_cast<ScalarType *>(nullptr);
}

antlrcpp::Any
AstVisitor::visitLValExpr(SysYParser::LValExprContext *const ctx)
{
    auto const lval = ctx->lVal()->accept(this).as<LValue *>();
    return static_cast<Expression *>(lval);
}

antlrcpp::Any
AstVisitor::visitDecIntConst(SysYParser::DecIntConstContext *const ctx)
{
    return int(std::stoll(ctx->getText(), nullptr, 10));
}

antlrcpp::Any
AstVisitor::visitOctIntConst(SysYParser::OctIntConstContext *const ctx)
{
    return int(std::stoll(ctx->getText(), nullptr, 8));
}

antlrcpp::Any
AstVisitor::visitHexIntConst(SysYParser::HexIntConstContext *const ctx)
{
    return int(std::stoll(ctx->getText(), nullptr, 16));
}

antlrcpp::Any
AstVisitor::visitDecFloatConst(SysYParser::DecFloatConstContext *const ctx)
{
    return std::stof(ctx->getText());
}

antlrcpp::Any
AstVisitor::visitHexFloatConst(SysYParser::HexFloatConstContext *const ctx)
{
    return std::stof(ctx->getText());
}

antlrcpp::Any
AstVisitor::visitUnaryAdd(SysYParser::UnaryAddContext *const ctx)
{
    auto const operand = ctx->unaryExp()->accept(this).as<Expression *>();
    auto const ret =
        new UnaryExpression(UnaryOp::Add, std::unique_ptr<Expression>(operand));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any
AstVisitor::visitUnarySub(SysYParser::UnarySubContext *const ctx)
{
    auto const operand = ctx->unaryExp()->accept(this).as<Expression *>();
    auto const ret =
        new UnaryExpression(UnaryOp::Sub, std::unique_ptr<Expression>(operand));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any AstVisitor::visitNot(SysYParser::NotContext *const ctx)
{
    auto const operand = ctx->unaryExp()->accept(this).as<Expression *>();
    auto const ret =
        new UnaryExpression(UnaryOp::Not, std::unique_ptr<Expression>(operand));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any
AstVisitor::visitStringConst(SysYParser::StringConstContext *const ctx)
{
    return std::make_shared<std::string>(ctx->getText());
}

antlrcpp::Any AstVisitor::visitMul(SysYParser::MulContext *const ctx)
{
    auto const lhs = ctx->mulExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->unaryExp()->accept(this).as<Expression *>();
    auto const ret =
        new BinaryExpression(BinaryOp::Mul, std::unique_ptr<Expression>(lhs),
                             std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any AstVisitor::visitDiv(SysYParser::DivContext *const ctx)
{
    auto const lhs = ctx->mulExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->unaryExp()->accept(this).as<Expression *>();
    auto const ret =
        new BinaryExpression(BinaryOp::Div, std::unique_ptr<Expression>(lhs),
                             std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any AstVisitor::visitMod(SysYParser::ModContext *const ctx)
{
    auto const lhs = ctx->mulExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->unaryExp()->accept(this).as<Expression *>();
    auto const ret =
        new BinaryExpression(BinaryOp::Mod, std::unique_ptr<Expression>(lhs),
                             std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any AstVisitor::visitAdd(SysYParser::AddContext *const ctx)
{
    auto const lhs = ctx->addExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->mulExp()->accept(this).as<Expression *>();
    auto const ret =
        new BinaryExpression(BinaryOp::Add, std::unique_ptr<Expression>(lhs),
                             std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any AstVisitor::visitSub(SysYParser::SubContext *const ctx)
{
    auto const lhs = ctx->addExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->mulExp()->accept(this).as<Expression *>();
    auto const ret =
        new BinaryExpression(BinaryOp::Sub, std::unique_ptr<Expression>(lhs),
                             std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any AstVisitor::visitLt(SysYParser::LtContext *const ctx)
{
    auto const lhs = ctx->relExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->addExp()->accept(this).as<Expression *>();
    auto const ret =
        new BinaryExpression(BinaryOp::Lt, std::unique_ptr<Expression>(lhs),
                             std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any AstVisitor::visitGt(SysYParser::GtContext *const ctx)
{
    auto const lhs = ctx->relExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->addExp()->accept(this).as<Expression *>();
    auto const ret =
        new BinaryExpression(BinaryOp::Gt, std::unique_ptr<Expression>(lhs),
                             std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any AstVisitor::visitLeq(SysYParser::LeqContext *const ctx)
{
    auto const lhs = ctx->relExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->addExp()->accept(this).as<Expression *>();
    auto const ret =
        new BinaryExpression(BinaryOp::Leq, std::unique_ptr<Expression>(lhs),
                             std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any AstVisitor::visitGeq(SysYParser::GeqContext *const ctx)
{
    auto const lhs = ctx->relExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->addExp()->accept(this).as<Expression *>();
    auto const ret =
        new BinaryExpression(BinaryOp::Geq, std::unique_ptr<Expression>(lhs),
                             std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any AstVisitor::visitEq(SysYParser::EqContext *const ctx)
{
    auto const lhs = ctx->relExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->eqExp()->accept(this).as<Expression *>();
    auto const ret =
        new BinaryExpression(BinaryOp::Eq, std::unique_ptr<Expression>(lhs),
                             std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any AstVisitor::visitNeq(SysYParser::NeqContext *const ctx)
{
    auto const lhs = ctx->eqExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->relExp()->accept(this).as<Expression *>();
    auto const ret =
        new BinaryExpression(BinaryOp::Neq, std::unique_ptr<Expression>(lhs),
                             std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any AstVisitor::visitAnd(SysYParser::AndContext *const ctx)
{
    auto const lhs = ctx->lAndExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->eqExp()->accept(this).as<Expression *>();
    auto const ret =
        new BinaryExpression(BinaryOp::And, std::unique_ptr<Expression>(lhs),
                             std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any AstVisitor::visitOr(SysYParser::OrContext *const ctx)
{
    auto const lhs = ctx->lOrExp()->accept(this).as<Expression *>();
    auto const rhs = ctx->lAndExp()->accept(this).as<Expression *>();
    auto const ret =
        new BinaryExpression(BinaryOp::Or, std::unique_ptr<Expression>(lhs),
                             std::unique_ptr<Expression>(rhs));
    return static_cast<Expression *>(ret);
}

antlrcpp::Any AstVisitor::visitNumber(SysYParser::NumberContext *const ctx)
{
    if (ctx->intConst())
    {
        auto val = ctx->intConst()->accept(this).as<IntLiteral::Value>();
        auto literal = new IntLiteral{val};
        return static_cast<Expression *>(literal);
    }
    if (ctx->floatConst())
    {
        assert(false);
        // TODO: float literal
    }
    assert(false);
    return static_cast<Expression *>(nullptr);
}

antlrcpp::Any AstVisitor::visitExprStmt(SysYParser::ExprStmtContext *const ctx)
{
    auto const expr = ctx->exp()->accept(this).as<Expression *>();
    auto const ret = new ExpressionStatement(std::unique_ptr<Expression>(expr));
    return static_cast<Statement *>(ret);
}

antlrcpp::Any AstVisitor::visitBlockStmt(SysYParser::BlockStmtContext *const ctx)
{
    auto const block = ctx->block()->accept(this).as<Block *>();
    return static_cast<Statement *>(block);
}

antlrcpp::Any AstVisitor::visitVarDecl(SysYParser::VarDeclContext *const ctx)
{
    std::cout<<"visitVarDecl"<<std::endl;
    auto const type_ = ctx->bType()->accept(this).as<ScalarType *>();
    std::unique_ptr<ScalarType> type(type_);
    std::vector<Declaration *> ret;
    for (auto item : ctx->varDef())
    {
        std::cout<<"varDef"<<std::endl;
        auto const ident = Identifier(item->Ident()->getText());
        std::cout<<"ident:"<<ident<<std::endl;
        if (auto init_ = item->initVal())
        {
            std::cout<<"init_"<<std::endl;
            auto const init = init_->accept(this).as<Initializer *>();
            auto const decl = new Declaration(std::move(type), ident, std::unique_ptr<Initializer>(init));
            std::cout<<"decl:"<<decl<<std::endl;
            ret.push_back(decl);
        }
        else
        {
            auto const decl = new Declaration(std::move(type), ident, nullptr);
            ret.push_back(decl);
        }
    }
    std::cout<<"visitVarDecl end"<<std::endl;
    return std::make_shared<std::vector<Declaration *>>(std::move(ret));
}

antlrcpp::Any AstVisitor::visitInit(SysYParser::InitContext *const ctx)
{
    auto expr_ = ctx->exp()->accept(this).as<Expression *>();
    std::unique_ptr<Expression> expr(expr_);
    return new Initializer(std::move(expr));
}

antlrcpp::Any AstVisitor::visitConstDecl(SysYParser::ConstDeclContext *const ctx)
{
    auto const type_ = ctx->bType()->accept(this).as<ScalarType *>();
    std::unique_ptr<ScalarType> type(type_);
    std::vector<Declaration *> ret;
    for (auto item : ctx->constDef())
    {
        auto const ident = Identifier(item->Ident()->getText());
        auto const init_ = item->initVal();
        auto const init = init_->accept(this).as<Initializer *>();
        auto const decl = new Declaration(std::move(type), ident, std::unique_ptr<Initializer>(init));
        ret.push_back(decl);
    }
    return std::make_shared<std::vector<Declaration *>>(std::move(ret));
}

antlrcpp::Any AstVisitor::visitReturn(SysYParser::ReturnContext *const ctx)
{
    if (auto expr_ = ctx->exp())
    {
        auto const expr = expr_->accept(this).as<Expression *>();
        auto const ret = new ReturnStatement(std::unique_ptr<Expression>(expr));
        return static_cast<Statement *>(ret);
    }
    else
    {
        auto const ret = new ReturnStatement(nullptr);
        return static_cast<Statement *>(ret);
    }
}
