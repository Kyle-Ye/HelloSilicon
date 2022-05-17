// AArch64 Assembly Code
// Programming with 64-Bit ARM Assembly Language
// Chapter #4: Excercise #2 (Page 81)
// KyleYe 2022/05/17

//
// Create assembly code to emulate a switch/case statement

// REGISTERS USED IN CODE
// w11 	- 	holds switch variable (1 thru 3 for this case statement)
// w12 	-	holds the exit value that can be queried at the OS level with: echo $?
//			NOTE:  w12 is transferred to w0 just before program exit so the
//				   user can query the value with $?
// w13 	-	work register used during calculation of mesg length

// X0 - X2  hold parameters for Darwin/kernel system call
// X0	-	holds FD (file device) for output (stdout in this case)
// X1	-	holds address of mesg
// X2 	-	holds length of mesg 

// X16	-	used to hold Darwin/Kernel system call ID
// X9	-	holds calculated length of mesg

.global _start
.align 4
_start:
    mov w12, #0xff
    cmp x0, #2; check for 2 arguments
    bne exit
    ldr x11, [x1, #8]
    ldrb w11, [x11]
    sub w11, w11, #'0'

    cmp w11, #1
    beq select1
    cmp w11, #2
    beq select2
    cmp w11, #3
    beq select3
default:
    mov w12, #99
    b break
select1:
    mov w12, #1
    b break
select2:
    mov w12, #2
    b break
select3:
    mov w12, #3
break:
    nop
    adrp x1, message@PAGE
    add x1, x1, message@PAGEOFF
    mov x9, #0
cloop:
    ldrb w13, [x1, x9] ; get the next digit in mesg
    cmp w13, #255
    beq cend
    add x9, x9, #1
    b cloop
cend:
    mov x0, #1 ; stdout
    mov x2, x9 ; length
    mov x16, #4
    svc #0x80
exit:
    mov w0, w12
    mov x16, #1
    svc #0x80
.data
message: 
    .byte 0x1B ; clear screen
    .byte 'c' ; and start msg at
    .byte 0 ; top of screen
    .asciz	"Chapter 4; Excercise #2\n"
    .asciz	" - Emulate switch/case in assembly code\n\n"
    .asciz	" -By Jeff Rosengarden\n"
    .asciz	" -Created on Apple DTK\n\n" 
    .asciz	" Use: echo $? to see result of program\n"
    .asciz	"\n\n\n" ; 3 blank lines
    .byte	255	
		
