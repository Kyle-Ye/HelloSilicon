.global _start
.align 2

_start:
    mov x0, #1
    adr x1, message
    mov x2, #13
    mov x16, #4
    svc #0x80

    mov x0, #0 ; return value
    mov x16, #1
    svc #0x80
message:
    .ascii "hello world!\n"