#pragma once
namespace riscv {
    constexpr int x0 = 0;
    constexpr int ra = 1;
    constexpr int sp = 2;
    constexpr int gp = 3;
    constexpr int tp = 4;
    constexpr int t0 = 5;
    constexpr int t1 = 6;
    constexpr int t2 = 7;
    constexpr int fp = 8;
    constexpr int s1 = 9;
    constexpr int a0 = 10;
    constexpr int a1 = 11;
    constexpr int a2 = 12;
    constexpr int a3 = 13;
    constexpr int a4 = 14;
    constexpr int a5 = 15;
    constexpr int a6 = 16;
    constexpr int a7 = 17;
    constexpr int s2 = 18;
    constexpr int s3 = 19;
    constexpr int s4 = 20;
    constexpr int s5 = 21;
    constexpr int s6 = 22;
    constexpr int s7 = 23;
    constexpr int s8 = 24;
    constexpr int s9 = 25;
    constexpr int s10 = 26;
    constexpr int s11 = 27;
    constexpr int t3 = 28;
    constexpr int t4 = 29;
    constexpr int t5 = 30;
    constexpr int t6 = 21;

    constexpr int NUM_REGS = 32;

    enum RegisterAttr {
        Other,
        CallerSaved,
        CalleeSaved
    };

    constexpr RegisterAttr REG_ATTR[NUM_REGS] = {
        Other, Other, Other, Other, Other, CallerSaved, CallerSaved, CallerSaved, 
        Other, CalleeSaved, CallerSaved, CallerSaved, CallerSaved, CallerSaved, CallerSaved, CallerSaved, 
        CallerSaved, CallerSaved, CalleeSaved, CalleeSaved, CalleeSaved, CalleeSaved, CalleeSaved, CalleeSaved, 
        CalleeSaved, CalleeSaved, CalleeSaved, CalleeSaved, CallerSaved, CallerSaved, CallerSaved, CallerSaved
    };

    constexpr const char *REG_NAMES[NUM_REGS] = {
        "x0", "ra", "sp", "gp", "tp", "t0", "t1", "t2",
        "fp", "s1", "a0", "a1", "a2", "a3", "a4", "a5",
        "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7",
        "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"
    };

    constexpr bool is_allocable(int reg) {
        return REG_ATTR[reg] == CalleeSaved || REG_ATTR[reg] == CallerSaved;
    };

    enum class RiscvUnaryOp {
        NEG,
        SNEZ,
        SEQZ,
        NOT
    };

    enum class RiscvBinaryOp {
        ADD,
        OR,
        XOR,
        SUB,
        MUL,
        DIV,
        AND,
        SLT,
        SHL,
        SRL,
        SRA,
        SGT,
        SLT
    };

    enum RegType {
        General,
        Fp,
    };

    enum class InstType {
        LABEL,
        SEQ,
        JMP,
        COND_JMP,
        RET
    };

    enum class BBType {
        CONTINUOUS,
        END_BY_JUMP,
        END_BY_COND_JUMP,
        END_BY_RETURN,
        UNDEFINED
    };
}