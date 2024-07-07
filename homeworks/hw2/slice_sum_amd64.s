#include "textflag.h"

#define ZERO(r) \
    XORQ r, r

// TODO: comments

// func SumSlice(s []int32) int64
TEXT ·SumSlice(SB), NOSPLIT, $0
    MOVQ x_base+0(FP), AX // ptr
    MOVQ x_len+8(FP), DX // len
    ZERO(R10)

loop:
    CMPQ DX, $0
    JE done
    XORQ CX, CX
    MOVLQSX (AX), R9
    ADDQ R9, R10

    ADDQ $4, AX
    SUBQ $1, DX
    JMP loop

done:
    MOVQ R10, ret+24(FP)
    RET