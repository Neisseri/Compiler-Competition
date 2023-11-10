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

    enum class InstType {
        LABEL,
        SEQ,
        JMP,
        COND_JMP,
        RET
    };

    enum class BBType {
        END_BY_JUMP,
        END_BY_COND_JUMP,
        END_BY_RETURN,
        UNDEFINED
    };
}