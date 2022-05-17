.global _mytolower         // Allow other files to call this routine
.align 4

_mytolower:
    mov x4, x1; store the orignial position
loop:
    ldrb    w5,    [x0], #1
    cmp    w5,    #'A'
    blt    cont
    cmp w5, #'Z'
    bgt    cont
    add w5, w5, #('a'-'A')
cont:
    strb    w5,    [x1], #1
    cmp    w5, #0
    bne loop
    sub x0, x1, x4; calculate the length and return to caller
    RET
