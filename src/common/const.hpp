#pragma once

enum class TypeEnum : int
{
    VOID,
    INT,
    FLOAT,
};

enum class BinaryOpEnum : int
{
    ADD,
    SUB,
    MUL,
    DIV,
    MOD,
    AND,
    OR,
    GT,
    LT,
    GE,
    LE,
    EQ,
    NE,
    ASSIGN,
};

enum class UnaryOpEnum : int
{
    POS,
    NEG,
    NOT,
    REV,
    UNARYADD,
    UNARYSUB,
};

enum class LabelType {
    FuncLabel,
    BlockLabel,
    TMP,
};


enum class ScopeType {
    GlobalScope,
    FuncScope,
    BlockScope,
    LoopScope,
};

enum class ErrorTypeEnum {
    UnimplementedError,
    SyntaxError,
    TypeError,
    SemanticError,
    InternalError,
};
