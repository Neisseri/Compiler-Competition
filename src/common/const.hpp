#pragma once

const int VOID = 0;
const int INT = 1;
const int FLOAT = 2;


enum class TypeEnum : int
{
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
