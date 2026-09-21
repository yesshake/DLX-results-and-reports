; Signed arithmetic, negative immediates, unsigned arithmetic, and R0
; Results at byte addresses 64 to 92: 7,17,-17,7,17,9,-7,0
.data
.word 12, -5
.text
_main:
    lw r1, 0(r0)
    lw r2, 4(r0)
    add r3, r1, r2
    sub r4, r1, r2
    sub r5, r2, r1
    addu r6, r1, r2
    subu r7, r1, r2
    addi r8, r1, -3
    subi r9, r2, 2
    addi r0, r0, 123
    sw 64(r0), r3
    sw 68(r0), r4
    sw 72(r0), r5
    sw 76(r0), r6
    sw 80(r0), r7
    sw 84(r0), r8
    sw 88(r0), r9
    sw 92(r0), r0

; Completion
    addi r30, r0, 1
    sw   508(r0), r30

done:
    j done
    nop
    nop
    nop
    nop