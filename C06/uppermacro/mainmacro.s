//
// Assembler program to convert a string to
// all upper case by calling a function.
//
// X0-X2 - parameters to linux function services
// X1 - address of output string
// X0 - address of input string
// X2 - original address of input string
// X8 - linux function number
//

.include "uppermacro/uppermacro.s"

.global _start	            // Provide program starting address to linker
.align 2

_start:
	// Convert tststr to uppercase
	toupper tststr, buffer

	MOV	X2, X0
	MOV	X0, #1
	ADRP	X1, buffer@PAGE
	ADD X1, X1, buffer@PAGEOFF
	MOV	X16, #4
	SVC	#0x80

	// Convert tststr2 to uppercase
	toupper tststr2, buffer

	MOV	X2, X0
	MOV	X0, #1
	ADRP	X1, buffer@PAGE
	ADD X1, X1, buffer@PAGEOFF
	MOV	X16, #4
	SVC	#0x80

	MOV     X0, #0
	MOV     X16, #1
	SVC     #0x80

.data
tststr:  .asciz  "This is our Test String that we will convert.\n"
tststr2: .asciz	 "A second string to upper case!!\n"
buffer:	.fill	255, 1, 0

