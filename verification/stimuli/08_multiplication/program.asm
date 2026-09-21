; MULT returns the low 32 bits. Data dependent operations need hazard handling.
; Results: [64]=-21, [68]=63, [72]=156, [76]=0, [80]=120.
; Last result is 5! computed in a loop; 65536*65536 truncates to zero.

.data
.word 7, -3, 12, 13, 65536
.text
_main:
    lw r1, 0(r0)
    lw r2, 4(r0)
    lw r3, 8(r0)
    lw r4, 12(r0)
    lw r5, 16(r0)
    mult r6, r1, r2
    mult r7, r6, r2
    mult r8, r3, r4
    mult r9, r5, r5
    sw 64(r0), r6
    sw 68(r0), r7
    sw 72(r0), r8
    sw 76(r0), r9
    addi r10, r0, 5
    addi r11, r0, 1
factorial:
    mult r11, r11, r10
    subi r10, r10, 1
    bnez r10, factorial
    sw 80(r0), r11

; Completion
    addi r30, r0, 1
    sw   508(r0), r30

done:
    j done
    nop
    nop
    nop
    nop