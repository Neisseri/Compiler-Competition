#pragma once

#include "frontend/astNode.hpp"
#include "common/common.hpp"
#include <variant>

namespace frontend
{

    namespace ast
    {
        using UnaryOp = ::UnaryOp;
        using BinaryOp = ::BinaryOp;

        class SysYType : public AstNode
        {
        public:
            SysYType() = default;
            SysYType(int type) : type(type) {}
            virtual ~SysYType() = default;
            std::string toString() const override
            {
                switch (type)
                {
                case 1:
                    return "int";
                case 2:
                    return "float";
                case 3:
                    return "void";
                default:
                    std::cerr << "unknown type: " << type << std::endl;
                    assert(false);
                }
            }
            void print(std::ostream &os, int indent) const override
            {
                os << toString();
            }
            int getType() const { return type; }

        private:
            int type;
        };

        class ScalarType : public SysYType
        {
        public:
            ScalarType() = default;
            ScalarType(int type) : SysYType(type) {}
            virtual ~ScalarType() = default;
        };

        class Identifier : public AstNode
        {
        public:
            Identifier() = default;
            Identifier(std::string name) : name(name) {}
            virtual ~Identifier() = default;
            std::string toString() const override { return name; }
            void print(std::ostream &os, int indent) const override { os << name; }
            std::string getName() const { return name; }

        private:
            std::string name;
        };

        class Parameter : public AstNode
        {
            // abstract type that represents a parameter
        public:
            Parameter() = default;
            Parameter(std::shared_ptr<SysYType> type, Identifier id)
                : type(type), id(id) {}
            virtual ~Parameter() = default;
            std::string toString() const override { return type->toString() + " " + id.toString(); }
            void print(std::ostream &os, int indent) const override
            {
                os << type->toString() << " " << id.toString();
            }
            std::shared_ptr<SysYType> getType() const { return type; }
            Identifier getId() const { return id; }

        private:
            std::shared_ptr<SysYType> type;
            Identifier id;
        };

        class Expression : public AstNode
        {
            // abstract type that represents an expression
        public:
            Expression() = default;
            virtual ~Expression() = default;
            virtual std::string toString() const override = 0;
            virtual void print(std::ostream &os, int indent) const override = 0;
        };

        class UnaryExpression : public Expression
        {
        public:
            UnaryExpression() = default;
            UnaryExpression(UnaryOp op, std::shared_ptr<Expression> expr)
                : expr(expr), op(op) {}
            virtual ~UnaryExpression() = default;
            std::string toString() const override
            {
                std::string op_str;
                switch (op)
                {
                case UnaryOp::Add:
                    op_str = "+";
                    break;
                case UnaryOp::Sub:
                    op_str = "-";
                    break;
                case UnaryOp::Not:
                    op_str = "!";
                    break;
                default:
                    std::cerr << "unknown unary op: " << std::endl;
                    assert(false);
                }
                return op_str + expr->toString();
            }
            void print(std::ostream &os, int indent) const override
            {
                os << toString();
            }
            std::shared_ptr<Expression> getExpr() const { return expr; }
            UnaryOp getOp() const { return op; }

        private:
            std::shared_ptr<Expression> expr;
            UnaryOp op;
        };

        class BinaryExpression : public Expression
        {
        public:
            BinaryExpression() = default;
            BinaryExpression(BinaryOp op, std::shared_ptr<Expression> lhs, std::shared_ptr<Expression> rhs)
                : lhs(lhs), rhs(rhs), op(op) {}
            virtual ~BinaryExpression() = default;
            std::string toString() const override
            {
                std::string op_str;
                switch (op)
                {
                case BinaryOp::Add:
                    op_str = "+";
                    break;
                case BinaryOp::Sub:
                    op_str = "-";
                    break;
                case BinaryOp::Mul:
                    op_str = "*";
                    break;
                case BinaryOp::Div:
                    op_str = "/";
                    break;
                case BinaryOp::Mod:
                    op_str = "%";
                    break;
                case BinaryOp::Eq:
                    op_str = "==";
                    break;
                case BinaryOp::Neq:
                    op_str = "!=";
                    break;
                case BinaryOp::Lt:
                    op_str = "<";
                    break;
                case BinaryOp::Gt:
                    op_str = ">";
                    break;
                case BinaryOp::Leq:
                    op_str = "<=";
                    break;
                case BinaryOp::Geq:
                    op_str = ">=";
                    break;
                case BinaryOp::And:
                    op_str = "&&";
                    break;
                case BinaryOp::Or:
                    op_str = "||";
                    break;
                case BinaryOp::Shr:
                    op_str = ">>";
                    break;
                case BinaryOp::Shl:
                    op_str = "<<";
                    break;
                default:
                    std::cerr << "unknown binary op: " << std::endl;
                    assert(false);
                }
                return lhs->toString() + " " + op_str + " " + rhs->toString();
            }
            void print(std::ostream &os, int indent) const override
            {
                os << toString();
            }
            std::shared_ptr<Expression> getLhs()
            {
                return lhs;
            }
            std::shared_ptr<Expression> getRhs()
            {
                return rhs;
            }
            BinaryOp getOp() const { return op; }

        private:
            std::shared_ptr<Expression> lhs;
            std::shared_ptr<Expression> rhs;
            BinaryOp op;
        };

        class LValue : public Expression
        {
        public:
            LValue(Identifier ident)
                : m_ident{std::move(ident)} {}

            // move constructor
            LValue(LValue &&) = default;
            virtual ~LValue() = default;

            class AstNode
            {
            public:
                virtual ~AstNode() = default;
                virtual std::string toString() const = 0;
                virtual void print(std::ostream &out, int indent) const
                {
                    out << std::string(indent, ' ') << toString() << std::endl;
                }
            };

            const Identifier &ident() const { return m_ident; }

        private:
            Identifier m_ident;
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

        class Declaration : public AstNode
        {
        private:
            std::shared_ptr<SysYType> type;
            std::shared_ptr<Identifier> id;
            std::shared_ptr<Expression> expr = nullptr;

        public:
            Declaration() = default;
            Declaration(std::shared_ptr<SysYType> type, std::shared_ptr<Identifier> id, std::shared_ptr<Expression> expr)
                : type(type), id(id), expr(expr) {}
            virtual ~Declaration() = default;
            std::string toString() const override
            {
                if (expr == nullptr)
                    return type->toString() + " " + id->toString();
                else
                    return type->toString() + " " + id->toString() + " = " + expr->toString();
            }
            void print(std::ostream &os, int indent) const override
            {
                os << toString();
            }
            std::shared_ptr<SysYType> getType() const { return type; }
            std::shared_ptr<Identifier> getId() const { return id; }
            std::shared_ptr<Expression> getExpr() const { return expr; }
        };

        class Assignment : public Statement
        {
        public:
            Assignment() = default;
            Assignment(std::unique_ptr<LValue> lhs, std::unique_ptr<Expression> rhs)
                : m_lhs{std::move(lhs)}, m_rhs{std::move(rhs)} {}
            virtual ~Assignment() = default;
            std::string toString() const override
            {
                //"assignment+lhs+'='+rhs"
                return m_lhs->toString() + " = " + m_rhs->toString();
            }

            const std::unique_ptr<LValue> &lhs() const { return m_lhs; }
            const std::unique_ptr<Expression> &rhs() const { return m_rhs; }
            void print(std::ostream &os, int indent) const override
            {
                os << toString();
            }

        private:
            std::unique_ptr<LValue> m_lhs;
            std::unique_ptr<Expression> m_rhs;
        };

        class IntLiteral : public Expression
        {
        public:
            using Value = std::int32_t;
            IntLiteral() = default;
            IntLiteral(int value) : value(value) {}
            virtual ~IntLiteral() = default;
            std::string toString() const override { return std::to_string(value); }
            void print(std::ostream &os, int indent) const override { os << value; }
            int getValue() const { return value; }

        private:
            Value value;
        };

        class Block : public Statement
        {
        public:
            using Child = std::variant<std::unique_ptr<Declaration>, std::unique_ptr<Statement>>;

            Block(std::vector<Child> children) : m_children{std::move(children)} {}
            virtual ~Block() = default;
            std::string toString() const override
            {
                std::string ret = "{\n";
                for (auto &child : m_children)
                {
                    std::visit([&](auto &child)
                               { ret += child->toString() + "\n"; },
                               child);
                }
                ret += "}";
                return ret;
            }
            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }

        private:
            std::vector<Child> m_children;
        };

        class Function : public AstNode
        {
        public:
            Function(std::unique_ptr<ScalarType> type, Identifier ident,
                     std::vector<std::unique_ptr<Parameter>> params,
                     std::unique_ptr<Block> body)
                : m_type{std::move(type)}, m_ident{std::move(ident)},
                  m_params{std::move(params)}, m_body{std::move(body)} {}
            virtual ~Function() = default;

            std::string toString() const override
            {
                std::string ret = m_type->toString() + " " + m_ident.toString() + "(";
                for (auto &param : m_params)
                {
                    // TODO: check if this is correct
                    ret +=" param , ";
                }
                if (!m_params.empty())
                {
                    ret.pop_back();
                    ret.pop_back();
                }
                ret += ")\n";
                ret += m_body->toString();
                return ret;
            }

            void print(std::ostream &os, int indent) const override
            {
                os << std::string(indent, ' ') << toString() << std::endl;
            }

            const std::unique_ptr<ScalarType> &type() const { return m_type; }
            const Identifier &ident() const { return m_ident; }
            const std::vector<std::unique_ptr<Parameter>> &params() const
            {
                return m_params;
            }
            const std::unique_ptr<Block> &body() const { return m_body; }

        private:
            std::unique_ptr<ScalarType> m_type;
            Identifier m_ident;
            std::vector<std::unique_ptr<Parameter>> m_params;
            std::unique_ptr<Block> m_body;
        };


        class CompileUnit : public AstNode
        {
        public:
            using Child =
                std::variant<std::unique_ptr<Declaration>, std::unique_ptr<Function>>;

            explicit CompileUnit(std::vector<Child> children)
                : m_children{std::move(children)} {}
            virtual ~CompileUnit() = default;

            std::string toString() const override
            {
                std::string ret;
                for (auto &child : m_children)
                {
                    std::visit([&](auto &child)
                               { ret += child->toString() + "\n"; },
                               child);
                }
                return ret;
            }

            void print(std::ostream &out, int indent)const override{
                // TODO: implement this
                out << std::string(indent, ' ') << "CompileUnit" << std::endl;
                for (auto &child : m_children)
                {
                    std::visit([&](auto &child)
                               { child->print(out, indent); },
                               child);
                }
            }

            const std::vector<Child> &children() const { return m_children; }

        private:
            std::vector<Child> m_children;
        };

    } // namespace ast

} // namespace frontend