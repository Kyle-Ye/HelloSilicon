//
// This file contains the various code
// snippets from Chapter 5. This ensures
// they compile and gives you a chance
// to single step through them.
// They are labeled, so you can set a
// breakpoint at the one you are interested in.

.global _start
.p2align 2

_start:
l1:
	STR	X0, [SP, #-16]!
	LDR	X0, [SP], #16
	STP X0, X1, [SP, #-16]!
	LDP X0, X1, [SP], #16
l2: 
	; more code
	BL myfunc
	MOV X1, #4
	B l3

myfunc:
	MOV X1, #2
	RET

l3:
	BL myfunc1
	MOV X1, #4
	; more code
myfunc1:
	STR LR, [SP, #-16]!
	; do some work
	BL myfunc2
	LDR LR, [SP], #16
	RET
myfunc2:
	; do some work
	RET

.macro	PUSH1 register
		STR	\register, [SP, #-16]!
.endmacro
.macro	POP1 	register
		LDR	\register, [SP], #16
.endmacro
.macro 	PUSH2 register1, register2
		STP	\register1, \register2, [SP, #-16]!
.endmacro
.macro 	POP2	register1, register2
		LDP	\register1, \register2, [SP], #16
.endmacro
Myfunction:
	PUSH1	LR
	PUSH2	X20, X23
// function body …
	POP2	X20, X23
	POP1	LR
	RET
l10:
	MOV     X0, #0
	mov     X16, #1
	svc     #0x80
