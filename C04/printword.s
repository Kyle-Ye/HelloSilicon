//
// Assembler program to print a register in hex
// to stdout.
//
// X0-X2 - parameters to linux function services
// X1 - is also address of byte we are writing
// w4 - register to print
// W5 - loop index
// W6 - current character
// X8 - linux function number
//

.global _start
.align 2

_start:
    mov w4, #0x6E3A
    movk w4, #0x4F5D, lsl #16

    adrp x1, hexstr@PAGE
    add x1, x1, hexstr@PAGEOFF
    add x1, x1, #9

; loop w5 from 16 to 1
    mov w5, #8
loop:
    and w6, w4, #0xf
    cmp w6, #10
    bge letter
    add w6, w6, #'0'
    b cont
letter:
    add w6, w6, #('A'-10)
cont:
    strb w6, [x1]; store byte(save the low-order byte of the first register into the memory location containerd in X1)
    sub x1, x1, #1
    lsr x4, x4, #4
    // Next w5
    subs w5, w5, #1
    bne loop
print:
    mov x0, #1; stdout
    adrp x1, hexstr@PAGE
    add x1, x1, hexstr@PAGEOFF
    mov x2, #11; length
    mov x16, #4; print system call
    svc #0x80

kill:
    mov x0, #0
    mov x16, #1
    svc #0x80


.data
hexstr: .ascii "0x12345678\n"