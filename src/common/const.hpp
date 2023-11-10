#pragma once

const int VOID = 0;
const int INT = 1;
const int FLOAT = 2;


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
