; Two initialized arrays: A=[1,2,3,4], B=[5,6,7,8].
; Loads, address increments, multiplication, accumulation, loop
; Results: [64 to 76]=[5,12,21,32]; [80]=dot(A,B)=70

.data
array_a: .word 1, 2, 3, 4
array_b: .word 5, 6, 7, 8
.org 64
products: .space 16
dot: .word 0
.text
_main:
    addi r1, r0, array_a
    addi r2, r0, array_b
    addi r3, r0, products
    addi r4, r0, 4
    addi r5, r0, 0
loop:
    lw r6, 0(r1)
    lw r7, 0(r2)
    mult r8, r6, r7
    sw 0(r3), r8
    add r5, r5, r8
    addi r1, r1, 4
    addi r2, r2, 4
    addi r3, r3, 4
    subi r4, r4, 1
    bnez r4, loop
    sw dot(r0), r5

; Completion
    addi r30, r0, 1
    sw   508(r0), r30

done:
    j done
    nop
    nop
    nop
    nop