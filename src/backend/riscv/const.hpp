namespace riscv {
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
        SLT
    };

    enum RegType {
        General,
        Fp,
    };
}