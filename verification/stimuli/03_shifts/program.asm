; Register/immediate shifts, negative input, counts 0,4,31.
; Results at 64 to 92: 00000100, 08000001, F8000001, 00000100, 08000001, F8000001, 80000010, FFFFFFFF

.data
.word 0x80000010
.text
_main:
    lw r1, 0(r0)
    addi r2, r0, 4
    sll r3, r1, r2
    srl r4, r1, r2
    sra r5, r1, r2
    slli r6, r1, 4
    srli r7, r1, 4
    srai r8, r1, 4
    slli r9, r1, 0
    srai r10, r1, 31
    sw 64(r0), r3
    sw 68(r0), r4
    sw 72(r0), r5
    sw 76(r0), r6
    sw 80(r0), r7
    sw 84(r0), r8
    sw 88(r0), r9
    sw 92(r0), r10

; Completion
    addi r30, r0, 1
    sw   508(r0), r30

done:
    j done
    nop
    nop
    nop
    nop