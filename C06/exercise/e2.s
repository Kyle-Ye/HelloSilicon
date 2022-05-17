.global _start
.p2align 2

_start:
    MOV X0, #2
    BL test

; Use X4, X5, W20, X23 and W27
; will call other function
test:
    STR LR, [SP, #-16]!
    SUB SP, SP, #-16
    STR X23, [SP]
    STR W20, [SP, #8]
    STR W27, [SP, #12]
    ; do work a
    STP X4, X5, [SP, #-16]! ; Push X4 and X5
    ; call other function
    LDP X4, X5, [SP], #16 ; Pop X4 and X5
    ; do work b
    LDR W27, [SP, #12]
    LDR W20, [SP, #8]
    LDR X23, [SP]
    ADD SP, SP, #16
    LDR LR, [SP], #16
    RET
