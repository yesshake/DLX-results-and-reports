; Big-endian: byte offset 0 is bits 31-24, offset 3 is bits 7-0 SB stores the low 8 bits of the CPU register
; Results: [0]=AABBCCDD, [64]=AABBCCDD, [68]=FFFFFF80,
; [72]=00000080, [76]=FFFFFFFF, [80]=000000FF.

.data
.word 0x11223344, 0x80FF7F01
.text
_main:
    addi r1, r0, 0xAA
    sb 0(r0), r1
    addi r1, r0, 0xBB
    sb 1(r0), r1
    addi r1, r0, 0xCC
    sb 2(r0), r1
    addi r1, r0, 0xDD
    sb 3(r0), r1
    lw r2, 0(r0)
    lb r3, 4(r0)
    lbu r4, 4(r0)
    lb r5, 5(r0)
    lbu r6, 5(r0)
    sw 64(r0), r2
    sw 68(r0), r3
    sw 72(r0), r4
    sw 76(r0), r5
    sw 80(r0), r6

; Completion
    addi r30, r0, 1
    sw   508(r0), r30

done:
    j done
    nop
    nop
    nop
    nop