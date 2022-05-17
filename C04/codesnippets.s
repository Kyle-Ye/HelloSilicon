.global _start
.p2align 2

_start:
// infinite loop
; l1:
    ; mov x1, #1
    ; b _start
    
l2:
    cmp x4, #45
    beq _start
    cmp w4, #45
    beq _start

// For loops
    mov w2, #1
loop:
    ; Body of loop
    add w2, w2, #1
    cmp w2, #10
    ble loop

l4:
    mov w2, #10
loop2:
    ; Body of loop2
    subs w2, w2, #1
    bne loop2

// While Loops
l5:	// W4 is X and has been initialized
loop3:
    cmp w4, #5
    bge loopdone
    ; Body of loop
    b loop3
loopdone: // program continues

l6: cmp w5, #10
    bge elseclause
    ; if statements
    b endif
elseclause:
    ; Else statements
endif: ; continue on after if/else

l7: and w6, w6, #0xff000000
    lsr w6, w6, #24

l8: orr x6, x6, #0xff
l9: bic x6, x6, #0xff

mov w0, #0
mov x16, #1
svc #0x80


