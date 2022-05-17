//
// Assembler program to convert a string to
// all upper case by calling a function.
//
// X0-X2 - parameters to linux function services
// X1 - address of output string
// X0 - address of input string
// X8 - linux function number
//

.global _start
.p2align 2

.text
_start:
	MOV X0, #1
	MOV X1, #2
    BL sumfn
    MOV X2, X0 ; Get the return value
exit:
	MOV	X0, X2
	MOV X16, #1
	SVC #0x80
