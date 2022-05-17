//
// Assembler program to convert a string to
// all upper case.
//
// X1 - address of output string
// X0 - address of input string
// X2 - original output string for length calc.
// W3 - current character being processed
//

// label 1 = loop
// label 2 = cont

.macro	toupper instr, outstr
	ADRP	X0, \instr@PAGE
	ADD X0, X0, \instr@PAGEOFF
	ADRP	X1, \outstr@PAGE
	ADD X1, X1, \outstr@PAGEOFF
	MOV	X2, X1
1:
	LDRB	W3, [X0], #1
	CMP	W3,	#'a'
	BLT	2f ; f means forward
	CMP W5, #'z'
	BGT	2f
	ADD W5, W5, #('A'-'a')
2:
	STRB	W5,	[X1], #1
	CMP	W5, #0
	BNE 1b ; b means backward
	SUB X0, X1, X2
.endm