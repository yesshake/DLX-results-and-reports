; signed/unsigned corner case comparison
; Results at 64 to 108: 1,0,0,1,1,1,1,1,1,1,0,1.

.data
.word -1, 1
.text
_main:
    lw r1, 0(r0)
    lw r2, 4(r0)
    slt r3, r1, r2
    sltu r4, r1, r2
    sgt r5, r1, r2
    sgtu r6, r1, r2
    seq r7, r1, r1
    sne r8, r1, r2
    sle r9, r1, r2
    sge r10, r2, r1
    seqi r11, r1, -1
    slti r12, r1, 0
    sltui r13, r1, 0xFFFF
    sgeui r14, r2, 1
    sw 64(r0), r3
    sw 68(r0), r4
    sw 72(r0), r5
    sw 76(r0), r6
    sw 80(r0), r7
    sw 84(r0), r8
    sw 88(r0), r9
    sw 92(r0), r10
    sw 96(r0), r11
    sw 100(r0), r12
    sw 104(r0), r13
    sw 108(r0), r14

; Completion
    addi r30, r0, 1
    sw   508(r0), r30

done:
    j done
    nop
    nop
    nop
    nop