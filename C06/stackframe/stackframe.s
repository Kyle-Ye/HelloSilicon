// Simple function that takes 2 parameters
// VAR1 and VAR2. The function adds them,
// storing the result in a variable SUM.
// The function returns the sum.
// It is assumed this function does other work,
// including other functions.

.global sumfn
.p2align 2

// Define our variables
.equ    VAR1, 0
.equ    VAR2, 4
.equ    SUM, 8

sumfn:
    STP LR, FP, [SP, #-16]!

    SUB FP, SP, #16
    SUB SP, SP, #16 ; room for 3 32-bit values
    STR W0, [FP, #VAR1]
    STR W1, [FP, #VAR2]
    ; do more work
    LDR W4, [FP, #VAR1]
    LDR W5, [FP, #VAR2]
    ADD W6, W4, W5
    STR W6, [FP, #SUM]
    ; do more work
    LDR W0, [FP, #SUM] ; load sum to return
    ADD SP, SP, #16 ; Release local vars
    LDP LR, FP, [SP], #16
    RET