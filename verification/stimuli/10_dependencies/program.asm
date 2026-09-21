; Deliberate dependencies: Load use, ALU chain, load to store, store/load, multiply use, branch use,
; and ALU generated address. Results: [64 to 84]=[15,15,35,105,64,15]

.data
.word 5, 0
.text
_main:
    lw r1, 0(r0)
    add r2, r1, r1
    add r3, r2, r1
    sw 64(r0), r3
    lw r4, 64(r0)
    sw 68(r0), r4
    addi r5, r4, 20
    sw 72(r0), r5
    mult r6, r5, r3
    subi r7, r6, 420
    sw 76(r0), r7
    seqi r8, r7, 105
    bnez r8, correct
    sw 128(r0), r7
correct:
    addi r9, r0, 64
    lw r10, 0(r9)
    sw 80(r0), r9
    sw 84(r0), r10

; Completion
    addi r30, r0, 1
    sw   508(r0), r30

done:
    j done
    nop
    nop
    nop
    nop