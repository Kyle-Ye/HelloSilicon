//
// Assembler program to convert a string to
// all upper case by calling a function.
//
// X0-X2, X16 - used by macros to call kernel
// X11 - input file descriptor
// X9 - output file descriptor
// X10 - number of characters read
//

#include "fileio.S"

.equ	BUFFERLEN, 250

.global _start	            // Provide program starting address to linker
.align 4

_start:
	ADRP	X0, inFile@PAGE
	ADD	X0, X0, inFile@PAGEOFF
	MOV	X1, #O_RDONLY
	BL openFile

	MOV		X11, X0	// save file descriptor (or error)
	B.CC		nxtfil  // carry clear, file opened ok

	MOV		X0, #1
	ADRP	X1, inpErr@PAGE
	ADD	X1, X1, inpErr@PAGEOFF
	ADRP		X2, inpErrsz@PAGE
	ADD		X2, X2, inpErrsz@PAGEOFF
	LDR		W2, [X2]
	BL	writeFile
	B		exit

nxtfil: 
	ADRP	X0, outFile@PAGE
	ADD	X0, X0, outFile@PAGEOFF
	MOV	X1, #(O_CREAT+O_WRONLY)
	BL openFile

	MOV		X9 , X0	// save file descriptor (or error)
	B.CC		loop    // carry clear, file opened ok
	
	MOV		X0, #1
	ADRP	X1, outErr@PAGE
	ADD	X1, X1, outErr@PAGEOFF
	ADRP		X2, outErrsz@PAGE
	ADD		X2, X2, outErrsz@PAGEOFF
	LDR		W2, [X2]
	BL	writeFile
	B		exit

// loop through file until done.
// X11 is input fd
// X9 is output fd
loop:
	MOV	X0, X11
	ADRP	X1, buffer@PAGE
	ADD	X1, X1, buffer@PAGEOFF
	MOV X2, #BUFFERLEN
	BL readFile
	MOV	X10, X0 ; save the result value

	ADRP	X0, buffer@PAGE
	ADD	X0, X0, buffer@PAGEOFF

	MOV X1, #0
	STRB	W1, [X0, X10] ;replace the end with Null termiator

	ADRP	X1, outBuf@PAGE
	ADD	X1, X1, outBuf@PAGEOFF
	BL lower

	MOV	X0, X9
	ADRP	X1, outBuf@PAGE
	ADD	X1, X1, outBuf@PAGEOFF
	MOV	X2,	X10
	BL	writeFile

	CMP	X10, #BUFFERLEN
	BEQ	loop
	
	MOV X0, X11
	BL flushClose
	MOV X0, X9
	BL flushClose
exit:
	MOV     X0, #0
	MOV     X16, #SYS_exit
	SVC     #0x80

.data
inFile:  .asciz  "main.S"
outFile: .asciz	 "lower.txt"
buffer:	.fill	BUFFERLEN + 1, 1, 0
outBuf:	.fill	BUFFERLEN + 1, 1, 0
inpErr: .asciz	"Failed to open input file.\n"
inpErrsz: .word  .-inpErr 
outErr:	.asciz	"Failed to open output file.\n"
outErrsz: .word	.-outErr