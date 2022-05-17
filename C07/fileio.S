// Various macros to perform file I/O

// The fd parameter needs to be a register.
// Uses X0-X3, X16.
// Return code is in X0.

#include <sys/syscall.h>

.equ	O_RDONLY, 0
.equ	O_WRONLY, 1
.equ	O_CREAT,  0x00000200
.equ	S_RDWR,   0666
.equ	AT_FDCWD, -2

.macro openFile fileName, flags
    MOV X0, AT_FDCWD
    ADRP X1, \fileName@PAGE
    ADD X1, X1, \fileName@PAGEOFF
    MOV X2, #\flags
    MOV X3, #S_RDWR
    MOV X16, #SYS_openat
    SVC #0x80
.endm

.macro readFile fd, buffer, length
    MOV X0, \fd
    ADRP X1, \buffer@PAGE
    ADD X1, X1, \buffer@PAGEOFF
    MOV X2, \length
    MOV X16, #SYS_read
    SVC #0x80
.endm

.macro writeFile fd, buffer, length
    MOV X0, \fd
    ADRP X1, \buffer@PAGE
    ADD X1, X1, \buffer@PAGEOFF
    MOV X2, \length
    MOV X16, #SYS_write
    SVC #0x80
.endm

.macro flushClose fd
    ; fsync syscall
    MOV X0, \fd
    MOV X16, #SYS_fsync
    SVC #0x80
    ; close syscall
    MOV X0, \fd
    MOV X16, #SYS_close
    SVC #0x80
.endm