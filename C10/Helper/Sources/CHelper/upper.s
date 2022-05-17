.global _mytoupper         // Allow other files to call this routine
.align 4

_mytoupper:
    mov x4, x1; store the orignial position
loop:
    ldrb    w5,    [x0], #1
    cmp    w5,    #'a'
    blt    cont
    cmp w5, #'z'
    bgt    cont
    add w5, w5, #('A'-'a')
cont:
    strb    w5,    [x1], #1
    cmp    w5, #0
    bne loop
    sub x0, x1, x4; calculate the length and return to caller
    RET
