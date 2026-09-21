; Exercise all six conditional branch instructions
; Immediate ALU to branch dependencies exercise Decode forwarding/stalls
; Results: [64]=10, [68]=0, [72]=1. Address 128 must remain zero: stores on the taken branches flushing test.

.data
.word 0
.text
_main:
    addi r1, r0, 4
    addi r2, r0, 0
loop:
    add r2, r2, r1
    subi r1, r1, 1
    bnez r1, loop
    sw 64(r0), r2
    sw 68(r0), r1
    addi r3, r0, -1
    bltz r3, negative
    sw 128(r0), r2
negative:
    bgez r0, nonnegative
    sw 128(r0), r2
nonnegative:
    blez r0, nonpositive
    sw 128(r0), r2
nonpositive:
    addi r3, r0, 1
    bgtz r3, positive
    sw 128(r0), r2
positive:
    beqz r0, zero
    sw 128(r0), r2
zero:
    addi r4, r0, 0
    beqz r3, finish
    addi r4, r4, 1
    nop
finish:
    sw 72(r0), r4

; Completion
    addi r30, r0, 1
    sw   508(r0), r30

done:
    j done
    nop
    nop
    nop
    nop