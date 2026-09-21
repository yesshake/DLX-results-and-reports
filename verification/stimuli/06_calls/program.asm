; JAL and JALR write the return byte address (PC+4) to R31
; RET is JR R31.
; Results: [64]=42 after doubling, [68]=126 after tripling

.data
.word 21
.text
_main:
    lw r1, 0(r0)
    jal double_value
    sw 64(r0), r1
    addi r10, r0, triple_value
    jalr r10
    sw 68(r0), r1
    j Completion
    sw 128(r0), r1
double_value:
    add r1, r1, r1
    ret
    nop
triple_value:
    add r2, r1, r1
    add r1, r2, r1
    jr r31
    nop

Completion:
    addi r30, r0, 1
    sw   508(r0), r30

done:
    j done
    nop
    nop
    nop
    nop