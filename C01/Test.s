.global _start
.align 2

_start:
    mov x0, #1
    ldr x1,=helloworld
    adr x1, message
    mov x2, #13
    mov x16, #4
    svc #0x64 // TODO: Seems like 0x80 and 0x64 both work on Darwin. Why?

    mov x0, #0
    mov x16, #1
    svc #0x64
message:
    .ascii "hello world!\n"
.data
helloworld:
    .ascii "hello world!\n"