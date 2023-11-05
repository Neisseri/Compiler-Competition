#include "../../common/common.hpp"

class AstNode{
public:
};

class Program : public AstNode{
public:
    Program(std::vector<std::unique_ptr<AstNode>>children) : children(children) {}
    
    std::vector<std::unique_ptr<AstNode>> children;
};

class Identifier : public AstNode{
public:
    Identifier(std::string name) : name(name){}

    std::string name;
};

class FunctionDeclaration : public AstNode{
public:
    FunctionDeclaration(std::unique_ptr<Type> ret_type, std::unique_ptr<Identifier> ident, std::unique_ptr<ParameterList> params) : ret_type(std::move(ret_type)), ident(std::move(ident)), params(std::move(params)) {}

    std::unique_ptr<Type> ret_type;
    std::unique_ptr<Identifier> ident;
    std::unique_ptr<ParameterList> params;
};

class Function : public AstNode{
public:
    Function(std::unique_ptr<Type> ret_type, std::unique_ptr<Identifier> ident, std::unique_ptr<ParameterList> params, std::unique_ptr<Block> body) : ret_type(std::move(ret_type)), ident(std::move(ident)), params(std::move(params)), body(std::move(body)) {}

    std::unique_ptr<Type> ret_type;
    std::unique_ptr<Identifier> ident;
    std::unique_ptr<ParameterList> params;
    std::unique_ptr<Block> body;
};

class Call : public AstNode{
public:
    Call(std::unique_ptr<Identifier> ident, std::unique_ptr<ExpressionList> argument_list) : ident(std::move(ident)), argument_list(std::move(argument_list)) {}

    std::unique_ptr<Identifier> ident;
    std::unique_ptr<ExpressionList> argument_list;
};

class Statement : public AstNode{
public:
};

class Return : public Statement{
public:
    Return(std::unique_ptr<Expression> expr) : expr(std::move(expr)) {}

    std::unique_ptr<Expression> expr;
};

class If : public Statement{
public:
    If(std::unique_ptr<Expression> cond, std::unique_ptr<Statement> then, std::unique_ptr<Statement> other) : cond(std::move(cond)), then(std::move(then)), other(std::move(other)), has_otherwise(true) {}
    If(std::unique_ptr<Expression> cond, std::unique_ptr<Statement> then) : cond(std::move(cond)), then(std::move(then)), has_otherwise(false) {}

    std::unique_ptr<Expression> cond;
    std::unique_ptr<Statement> then;
    std::unique_ptr<Statement> other;
    bool has_otherwise;
};

class While : public Statement{
public:
    While(std::unique_ptr<Expression> cond, std::unique_ptr<Statement> body) : cond(std::move(cond)), body(std::move(body)) {}

    std::unique_ptr<Expression> cond;
    std::unique_ptr<Statement> body;
};

class For : public Statement{
public:
    For(std::unique_ptr<Statement> init, std::unique_ptr<Expression> cond, std::unique_ptr<Statement> update, std::unique_ptr<Statement> body) : init(std::move(init)), cond(std::move(cond)), update(std::move(update)), body(std::move(body)) {}

    std::unique_ptr<Statement> init;
    std::unique_ptr<Expression> cond;
    std::unique_ptr<Statement> update;
    std::unique_ptr<Statement> body;
};

class Break : public Statement{
public:
};

class Continue : public Statement{
public:
};

class Parameter : public AstNode{
public:
    Parameter(std::unique_ptr<Type> var_type, std::unique_ptr<Identifier> ident) : var_type(std::move(var_type)), ident(std::move(ident)) {}

    std::unique_ptr<Type> var_type;
    std::unique_ptr<Identifier> ident;
};

class ParameterList : public AstNode{
public:
    ParameterList(std::vector<std::unique_ptr<Parameter>> children) : children(children) {}

    std::vector<std::unique_ptr<Parameter>> children;
};

class Block : public Statement{
public:
    Block(std::vector<std::unique_ptr<AstNode>> children) : children(children) {}

    std::vector<std::unique_ptr<AstNode>> children;
};

class Declaration : public AstNode{
public:
    Declaration(std::unique_ptr<Type> var_type, std::unique_ptr<Identifier> ident, std::unique_ptr<Expression> init_expr) : var_type(std::move(var_type)), ident(std::move(ident)), init_expr(std::move(init_expr)), has_init(true) {}
    Declaration(std::unique_ptr<Type> var_type, std::unique_ptr<Identifier> ident) : var_type(std::move(var_type)), ident(std::move(ident)), has_init(false) {}
    

    std::unique_ptr<Type> var_type;
    std::unique_ptr<Identifier> ident;
    std::unique_ptr<Expression> init_expr;
    bool has_init;
};

class Expression : public AstNode{
public:
};

class ExpressionList : public AstNode{
public:
    ExpressionList(std::vector<std::unique_ptr<Expression>> children) : children(children) {}

    std::vector<std::unique_ptr<Expression>> children;
};

class Operator : public AstNode{

};

class UnaryOp : public Operator{

};

class BinaryOp : public Operator{

};

class Unary : public Expression{
public:
    Unary(std::unique_ptr<UnaryOp> op, std::unique_ptr<Expression> oprand) : op(std::move(op)), oprand(std::move(oprand)) {}

    std::unique_ptr<UnaryOp> op;
    std::unique_ptr<Expression> oprand;
};

class Binary : public Expression{
public:
    Binary(std::unique_ptr<Expression> lhs, std::unique_ptr<BinaryOp> op, std::unique_ptr<Expression> rhs) : lhs(std::move(lhs)), op(std::move(op)), rhs(std::move(rhs)) {}

    std::unique_ptr<Expression> lhs;
    std::unique_ptr<BinaryOp> op;
    std::unique_ptr<Expression> rhs;
};

class Assignment : public Binary{
public:
    
};
