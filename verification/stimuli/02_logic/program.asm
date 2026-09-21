; Results at 64 to 88: AND, OR, XOR, ANDI, ORI, XORI, constructed constant.
.data
.word 0
.text
_main:
    lhi r1, 0x1234
    ori r1, r1, 0x5678
    lhi r2, 0x00FF
    ori r2, r2, 0x0F0F
    and r3, r1, r2
    or r4, r1, r2
    xor r5, r1, r2
    andi r6, r1, 0xF0F0
    ori r7, r1, 0x8000
    xori r8, r1, 0xFFFF
    sw 64(r0), r3
    sw 68(r0), r4
    sw 72(r0), r5
    sw 76(r0), r6
    sw 80(r0), r7
    sw 84(r0), r8
    sw 88(r0), r1

; Completion
    addi r30, r0, 1
    sw   508(r0), r30

done:
    j done
    nop
    nop
    nop
    nop