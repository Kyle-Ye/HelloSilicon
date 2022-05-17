//
// Assembler program to convert a string to
// all upper case.
//
// X0-X2 - parameters to linux function services
// X3 - address of output string
// X4 - address of input string
// W5 - current character being processed
// X8 - linux function number
//

.global _start
.p2align 2

.text
_start:
	adrp	x4, instr@PAGE
	add	x4, x4, instr@PAGEOFF
	adrp	x3, outstr@PAGE
	add	x3, x3, outstr@PAGEOFF
loop:
	ldrb	w5,	[x4], #1
	cmp	w5,	#'a'
	blt	cont
	cmp w5, #'z'
	bgt	cont
	add w5, w5, #('A'-'a')
cont:
	strb	w5,	[x3], #1
	cmp	w5, #0
	bne loop
exit:
	mov	x0, #0
	mov x16, #1
	svc #0x80
.data
instr:	.asciz	"This is our Test String that we will convert.\n"
outstr:	.fill	255, 1, 0
