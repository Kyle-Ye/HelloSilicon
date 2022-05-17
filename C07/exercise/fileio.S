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

.global openFile
.global readFile
.global writeFile
.global flushClose

; X0 fileName
; X1 flags
openFile:
    MOV X2, X1
    MOV X1, X0
    MOV X0, AT_FDCWD
    MOV X3, #S_RDWR
    MOV X16, #SYS_openat
    SVC #0x80
    RET

; X0 fd
; X1 buffer
; X2 length
readFile:
    MOV X16, #SYS_read
    SVC #0x80
    RET

; X0 fd
; X1 buffer
; X2 length
writeFile:
    MOV X16, #SYS_write
    SVC #0x80
    RET

flushClose:
    MOV X1, X0
    ; fsync syscall
    MOV X0, X1
    MOV X16, #SYS_fsync
    SVC #0x80
    ; close syscall
    MOV X0, X1
    MOV X16, #SYS_close
    SVC #0x80
    RET