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
	ADRP	X0, instr@PAGE
	ADD	X0, X0, instr@PAGEOFF
	ADRP	X1, outstr@PAGE
	ADD	X1, X1, outstr@PAGEOFF
    BL toupper
    MOV X2, X0 ; Get the return value
print:
    MOV X0, #1
	ADRP	X1, outstr@PAGE
	ADD	X1, X1, outstr@PAGEOFF
    MOV X16, #4
    SVC #0x80
exit:
	MOV	X0, #0
	MOV X16, #1
	SVC #0x80
.data
instr:	.asciz	"This is our Test String that we will convert.\n"
outstr:	.fill	255, 1, 0
