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
    SGT,
    SLT,
    SGE,
    SLE,
    EQ,
    NE,

    SHL,
    LSHR,
    ASHR,
    XOR,
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

enum class LabelType : int
{
    FuncLabel,
    BlockLabel,
    TMP,
};

enum class ScopeType : int
{
    GlobalScope,
    FuncScope,
    BlockScope,
    LoopScope,
    ErrorScope,
};

enum class ErrorTypeEnum : int
{
    UnimplementedError,
    SyntaxError,
    TypeError,
    SemanticError,
    InternalError,
};
