//
// Assembler program to convert a string to
// all upper case.
//
// X0 - address of input string
// X1 - address of output string
// X4 - original output string for length calc.
// W5 - current character being processed
//

.global toupper
.p2align 2

toupper:
	mov x4, x1; store the orignial position
loop:
	ldrb	w5,	[x0], #1
	cmp	w5,	#'a'
	blt	cont
	cmp w5, #'z'
	bgt	cont
	add w5, w5, #('A'-'a')
cont:
	strb	w5,	[x1], #1
	cmp	w5, #0
	bne loop
	sub x0, x1, x4; calculate the length and return to caller
	RET