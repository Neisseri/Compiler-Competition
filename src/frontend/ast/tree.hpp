#pragma once
#include "../../common/common.hpp"
#include "../../common/const.hpp"
namespace frontend
{

    namespace ast
    {
        class AstNode
        {
        public:
            virtual std::string toString() const = 0;
            virtual ~AstNode() = default;
            virtual void print(std::ostream &os, int indent) const = 0;
            friend std::ostream &operator<<(std::ostream &os, const AstNode &node)
            {
                node.print(os, 0);
                return os;
            }
        };

        class Program : public AstNode
        {
        public:
            Program(std::vector<std::unique_ptr<AstNode>> children) : children(std::move(children)) {}
            ~Program() = default;
            std::string toString() const override
            {
                return "Program";
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
                for (auto &child : children)
                {
                    child->print(os, indent + 2);
                }
                os << std::string(indent, ' ') << "End of Program" << std::endl;
            }

            std::vector<std::unique_ptr<AstNode>> children;
            // TODO:这里目前先只考虑函数，不考虑全局变量
        };

        class Expression : public AstNode
        { // abstract type that represents an expression
        public:
            Expression() = default;
            virtual ~Expression() = default;
        };

        class ExpressionList : public AstNode
        {
        public:
            ExpressionList(std::vector<std::unique_ptr<Expression>> children) : children(std::move(children)) {}
            ~ExpressionList()
            {
                for (auto &child : children)
                {
                    child.reset();
                }
            }
            bool is_empty() const
            {
                return children.empty();
            }
            std::string toString() const override
            {
                std::string ret;
                for (auto &child : children)
                {
                    ret += child->toString() + ", ";
                }
                if (!children.empty())
                {
                    ret.pop_back();
                    ret.pop_back();
                }
                return ret;
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }
            std::vector<std::unique_ptr<Expression>> children;
        };

        class IntLiteral : public Expression
        {
        public:
            IntLiteral(int value) : value(value) {}
            ~IntLiteral() = default;
            std::string toString() const override
            {
                return std::to_string(value);
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << std::to_string(value) << std::endl;
            }
            int value;
        };

        class FloatLiteral : public Expression
        {
        public:
            FloatLiteral(float value) : value(value) {}
            ~FloatLiteral() = default;
            std::string toString() const override
            {
                return std::to_string(value);
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << std::to_string(value) << std::endl;
            }
            float value;
        };

        class Identifier : public AstNode
        {
        public:
            Identifier(std::string name) : name(name) {}
            ~Identifier() = default;
            std::string toString() const override
            {
                return "@" + name;
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }

            std::string name;
        };

        class Call : public Expression
        {
        public:
            Call(std::unique_ptr<Identifier> ident, std::unique_ptr<ExpressionList> argument_list) : ident(std::move(ident)), argument_list(std::move(argument_list)) {}
            ~Call() = default;
            std::string toString() const override
            {
                return "Call " + ident->toString() + "(" + argument_list->toString() + ")";
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << "Call " << ident->toString() << std::endl;
                argument_list->print(os, indent + 2);
            }
            std::unique_ptr<Identifier> ident;
            std::unique_ptr<ExpressionList> argument_list;
        };

        class Statement : public AstNode
        {
            // abstract type that represents a statement
        public:
            Statement() = default;
            virtual ~Statement() = default;
            virtual std::string toString() const override = 0;
            virtual void print(std::ostream &os, int indent) const override = 0;
        };

        class Return : public Statement
        {
        public:
            Return(std::unique_ptr<Expression> expr) : expr(std::move(expr)) {}
            ~Return() = default;
            std::string toString() const override
            {
                return "Return " + expr->toString();
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }
            std::unique_ptr<Expression> expr;
        };

        class Parameter : public AstNode
        {
        public:
            Parameter(std::unique_ptr<Type> var_type, std::unique_ptr<Identifier> ident) : var_type(std::move(var_type)), ident(std::move(ident)) {}
            ~Parameter() = default;
            std::string toString() const override
            {
                return var_type->toString() + " " + ident->toString();
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }
            std::unique_ptr<Type> var_type;
            std::unique_ptr<Identifier> ident;
        };

        class ParameterList : public AstNode
        {
        public:
            ParameterList(std::vector<std::unique_ptr<Parameter>> children) : children(std::move(children)) {}
            ParameterList() = default;
            ~ParameterList() = default;
            const std::vector<std::unique_ptr<Parameter>> &getChildren() const
            {
                return children;
            }
            std::string toString() const override
            {
                std::string ret;
                for (auto &child : children)
                {
                    ret += child->toString() + ", ";
                }
                if (!children.empty())
                {
                    ret.pop_back();
                    ret.pop_back();
                }
                return ret;
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }

            bool is_empty() const
            {
                return children.empty();
            }

            std::vector<std::unique_ptr<Parameter>> children;
        };

        class Block : public Statement
        {
        public:
            Block(std::vector<std::unique_ptr<AstNode>> children) : children(std::move(children)) {}
            ~Block() = default;
            std::string toString() const override
            {
                return "";
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << "{" << std::endl;
                for (auto &child : children)
                {
                    child->print(os, indent + 2);
                }
                os << std::string(indent, ' ') << "}" << std::endl;
            }
            std::vector<std::unique_ptr<AstNode>> children;
        };

        class Declaration : public AstNode
        {
        public:
            Declaration(std::unique_ptr<Type> var_type, std::unique_ptr<Identifier> ident, std::unique_ptr<Expression> t_init_expr) : var_type(std::move(var_type)), ident(std::move(ident)), init_expr(std::move(t_init_expr))
            {
                // check if init_expr is Expression
                if (init_expr != nullptr)
                    has_init = true;
                else
                    has_init = false;
            }
            Declaration(std::unique_ptr<Type> var_type, std::unique_ptr<Identifier> ident, std::unique_ptr<Expression> t_init_expr, bool is_const) : var_type(std::move(var_type)), ident(std::move(ident)), init_expr(std::move(t_init_expr)), is_const(is_const)
            {
                if (init_expr != nullptr)
                    has_init = true;
                else
                    has_init = false;
            }

            ~Declaration() = default;
            std::string toString() const override
            {
                if (!has_init)
                    return (is_const ?"const ":"")+var_type->toString() + " " + ident->toString();
                else
                    return (is_const ? "const " : "")+var_type->toString() + " " + ident->toString() + " = " + init_expr->toString();
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }
            std::unique_ptr<Type> var_type;
            std::unique_ptr<Identifier> ident;
            std::unique_ptr<Expression> init_expr = nullptr;
            bool has_init;
            bool is_const = false;
        };

        class Operator : public AstNode
        { // abstract type that represents an operator
        public:
            Operator() = default;
            virtual ~Operator() = default;
            virtual std::string toString() const override = 0;
            virtual void print(std::ostream &os, int indent) const override = 0;
        };

        class UnaryOp : public Operator
        {
        public:
            UnaryOp(UnaryOpEnum op) : unary_op_type(static_cast<int>(op)) {}
            ~UnaryOp() = default;
            std::string toString() const override
            {
                std::string ret;
                switch (unary_op_type)
                {
                case static_cast<int>(UnaryOpEnum::POS):
                    ret = "+";
                    break;
                case static_cast<int>(UnaryOpEnum::NEG):
                    ret = "-";
                    break;
                case static_cast<int>(UnaryOpEnum::NOT):
                    ret = "!";
                    break;
                case static_cast<int>(UnaryOpEnum::REV):
                    ret = "~";
                    break;
                case static_cast<int>(UnaryOpEnum::UNARYADD):
                    ret = "++";
                    break;
                case static_cast<int>(UnaryOpEnum::UNARYSUB):
                    ret = "--";
                    break;
                default:
                    ret = "unknown";
                    break;
                }
                return ret;
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }
            int unary_op_type;
        };

        class BinaryOp : public Operator
        {
        public:
            BinaryOp(BinaryOpEnum op) : binary_op_type(static_cast<int>(op)) {}
            ~BinaryOp() = default;
            std::string toString() const override
            {
                std::string ret;
                switch (binary_op_type)
                {
                case static_cast<int>(BinaryOpEnum::ADD):
                    ret = "+";
                    break;
                case static_cast<int>(BinaryOpEnum::SUB):
                    ret = "-";
                    break;
                case static_cast<int>(BinaryOpEnum::MUL):
                    ret = "*";
                    break;
                case static_cast<int>(BinaryOpEnum::DIV):
                    ret = "/";
                    break;
                case static_cast<int>(BinaryOpEnum::MOD):
                    ret = "%";
                    break;
                case static_cast<int>(BinaryOpEnum::AND):
                    ret = "&&";
                    break;
                case static_cast<int>(BinaryOpEnum::OR):
                    ret = "||";
                    break;
                case static_cast<int>(BinaryOpEnum::SGT):
                    ret = ">";
                    break;
                case static_cast<int>(BinaryOpEnum::SLT):
                    ret = "<";
                    break;
                case static_cast<int>(BinaryOpEnum::SGE):
                    ret = ">=";
                    break;
                case static_cast<int>(BinaryOpEnum::SLE):
                    ret = "<=";
                    break;
                case static_cast<int>(BinaryOpEnum::EQ):
                    ret = "==";
                    break;
                case static_cast<int>(BinaryOpEnum::NE):
                    ret = "!=";
                    break;
                default:
                    ret = "unknown";
                    break;
                }
                return ret;
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }
            int binary_op_type;
        };

        class Unary : public Expression
        {
        public:
            Unary(std::unique_ptr<UnaryOp> op, std::unique_ptr<Expression> oprand) : op(std::move(op)), oprand(std::move(oprand)) {}
            ~Unary() = default;
            std::string toString() const override
            {
                return op->toString() + oprand->toString();
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }
            std::unique_ptr<UnaryOp> op;
            std::unique_ptr<Expression> oprand;
        };

        class Binary : public Expression
        {
        public:
            Binary(std::unique_ptr<Expression> lhs, std::unique_ptr<BinaryOp> op, std::unique_ptr<Expression> rhs) : lhs(std::move(lhs)), op(std::move(op)), rhs(std::move(rhs)) {}
            Binary(std::unique_ptr<Expression> lhs, std::unique_ptr<Expression> rhs) : lhs(std::move(lhs)), rhs(std::move(rhs)) {} // for assignment only
            ~Binary() = default;
            std::string toString() const override
            {
                return lhs->toString() + op->toString() + rhs->toString();
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }
            std::unique_ptr<Expression> lhs;
            std::unique_ptr<BinaryOp> op;
            std::unique_ptr<Expression> rhs;
        };

        class LValue : public Expression
        {
        public:
            LValue(std::unique_ptr<Identifier> ident, std::vector<std::unique_ptr<Expression>> indices) : ident(std::move(ident)), indices(std::move(indices)), has_index(true), var_type(new Type(1)) {}
            LValue(std::unique_ptr<Identifier> ident) : ident(std::move(ident)), has_index(false), var_type(new Type(0)) {}
            ~LValue() = default;
            std::string toString() const override
            {
                if (has_index){
                    std::string ret;
                    for (auto &index : indices)
                    {
                        ret += "[" + index->toString() + "]";
                    }
                    return ident->toString() + ret;
                }
                else
                    return ident->toString();
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString();
            }
            std::unique_ptr<Identifier> ident;
            std::vector<std::unique_ptr<Expression>> indices;

            // TODO:set type of lvalue. current default int.
            std::unique_ptr<Type> var_type;

            bool has_index;
        };

        class Assign : public Statement
        {
        public:
            Assign(std::unique_ptr<LValue> lvalue, std::unique_ptr<Expression> expr) : lvalue(std::move(lvalue)), expr(std::move(expr)) {}
            ~Assign() = default;
            std::string toString() const override
            {
                return "Assign" + lvalue->toString() + " = " + expr->toString();
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }
            std::unique_ptr<LValue> lvalue;
            std::unique_ptr<Expression> expr;
        };

        class Assignment : public Expression
        { // TODO：这里你可以简单的通过判断value是否为空来判断是单个赋值还是多个赋值
        public:
            Assignment(std::unique_ptr<Expression> value)
                : value{std::move(value)} {}
            Assignment(std::vector<std::unique_ptr<Expression>> values)
                : values{std::move(values)} {}

            ~Assignment() = default;
            std::string toString() const override
            {
                if (value)
                    return value->toString();
                else
                    {
                        std::string ret;
                        ret+="{";
                        for (auto &child : values)
                        {
                            ret += child->toString() + ", ";
                        }
                        if (!values.empty())
                        {
                            ret.pop_back();
                            ret.pop_back();
                        }
                        ret+="}";
                        return ret;

                    }
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }
            std::unique_ptr<Expression> value = nullptr;
            std::vector<std::unique_ptr<Expression>> values = {};
        };

        class ExprStmt : public Statement
        { // expression statement, e.g. a+b;
        public:
            ExprStmt(std::unique_ptr<Expression> expr) : expr(std::move(expr)) {}
            ~ExprStmt() = default;
            std::string toString() const override
            {
                return expr->toString();
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << expr->toString() << std::endl;
            }
            std::unique_ptr<Expression> expr;
        };

        class IfElse : public Statement
        {
        public:
            IfElse(std::unique_ptr<Expression> cond, std::unique_ptr<Statement> then, std::unique_ptr<Statement> other) : cond(std::move(cond)), then(std::move(then)), other(std::move(other)) {}
            ~IfElse() = default;
            std::string toString() const override
            {
                return "IfElse";
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << "If";
                cond->print(os, indent + 2);
                then->print(os, indent + 2);
                if (other != nullptr)
                {
                    os << std::string(indent, ' ') << "Else" << std::endl;
                    other->print(os, indent + 2);
                }
            }
            bool has_else() const
            {
                return other != nullptr;
            }
            std::unique_ptr<Expression> cond;
            std::unique_ptr<Statement> then;
            std::unique_ptr<Statement> other;
        };

        class While : public Statement
        {
        public:
            While(std::unique_ptr<Expression> cond, std::unique_ptr<Statement> body) : cond(std::move(cond)), body(std::move(body)) {}
            ~While() = default;
            std::string toString() const override
            {
                return "While";
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << "While";
                cond->print(os, indent + 2);
                body->print(os, indent + 2);
            }
            std::unique_ptr<Expression> cond;
            std::unique_ptr<Statement> body;
        };

        class Break : public Statement
        {
        public:
            Break() = default;
            ~Break() = default;
            std::string toString() const override
            {
                return "Break";
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }
        };

        class Continue : public Statement
        {
        public:
            Continue() = default;
            ~Continue() = default;
            std::string toString() const override
            {
                return "Continue";
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }
        };

        class FunctionDeclaration : public AstNode
        {
            // 这个类是函数声明，不是函数定义.函数定义是Function.
            // function_decl没有body
        public:
            FunctionDeclaration(std::unique_ptr<Type> ret_type, std::unique_ptr<Identifier> ident, std::unique_ptr<ParameterList> params) : ret_type(std::move(ret_type)), ident(std::move(ident)), params(std::move(params)) {}
            ~FunctionDeclaration() = default;
            std::string toString() const override
            {
                return "FunctionDeclaration";
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }
            std::unique_ptr<Type> ret_type;
            std::unique_ptr<Identifier> ident;
            std::unique_ptr<ParameterList> params;
        };

        class Function : public AstNode
        {
            // 这个类是函数定义，不是函数声明.函数声明是FunctionDeclaration.
            // function含有body
        public:
            Function(std::unique_ptr<Type> ret_type, std::unique_ptr<Identifier> ident, std::unique_ptr<ParameterList> params, std::unique_ptr<Block> body) : ret_type(std::move(ret_type)), ident(std::move(ident)), params(std::move(params)), body(std::move(body)) {}
            ~Function() = default;
            std::string toString() const override
            {
                std::string ret = ret_type->toString() + " " + ident->toString();
                ret += "(" + params->toString() + ")";
                return ret;
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
                body->print(os, indent + 2);
            }
            std::unique_ptr<Type> ret_type;
            std::unique_ptr<Identifier> ident;
            std::unique_ptr<ParameterList> params;
            std::unique_ptr<Block> body;
        };
    }
} // namespace frontend::ast