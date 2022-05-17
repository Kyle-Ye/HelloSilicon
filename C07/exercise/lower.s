//
// Assembler program to convert a string to
// all upper case.
//
// X0 - address of input string
// X1 - address of output string
// X4 - original output string for length calc.
// W5 - current character being processed
//

.global lower
.p2align 2

lower:
	mov x4, x1; store the orignial position
loop:
	ldrb	w5,	[x0], #1
	cmp	w5,	#'A'
	blt	cont
	cmp w5, #'Z'
	bgt	cont
	add w5, w5, #('a'-'A')
cont:
	strb	w5,	[x1], #1
	cmp	w5, #0
	bne loop
	sub x0, x1, x4; calculate the length and return to caller
	RET