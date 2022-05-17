//
// This file contains the various code
// snippets from Chapter 5. This ensures
// they compile and gives you a chance
// to single step through them.
// They are labeled, so you can set a
// breakpoint at the one you are interested in.

.global _start
.global _l9
.global _l16

.data
l1: .byte	74, 0112, 0b00101010, 0x4A, 0X4a, 'J', 'H' + 2
	.word	0x1234ABCD, -1434
	.quad	0x123456789ABCDEF0
	.ascii	"Hello World\n"
	.asciz	"Hello World\n"

l2:	.byte	-0x45, -33, ~0b00111001

l3:	.fill	10, 4, 0

l4: .rept	3
	.byte	0, 1, 2
	.endr

	.byte	0, 1, 2
	.byte	0, 1, 2
	.byte	0, 1, 2

l5:	.byte	0x3F
	.align	4
	.word	0x12345678

.text
_start:
l6:
	; ldr x1, =helloworld
	; ldr x1, =helloworld2
	adrp x1, helloworld@PAGE
	add x1, x1, helloworld@PAGEOFF
	adr x1, helloworld2 ; helloworld2 must at .text section
l7:	ldr x1, =0x1234ABCD1234ABCD

l8:	adrp	x1,	mynumber@PAGE
	add	x1, x1, mynumber@PAGEOFF
	ldr	x2, [x1]

_l9:	adrp	x1, arr1@PAGE
	add x1, x1, arr1@PAGEOFF
l10:
	ldr	w2, [x1]; Load element 1

	ldr	w2, [x1, #(2 * 4)]; Load element 3
	mov x3, #(2 * 4)
	ldr w2, [x1, x3]
	
	ldr w2, [x1, #-(2 * 4)]
	mov x3, #-(2 * 4)
	ldr w2, [x1, x3]

	mov x3, #2
	ldr w2, [x1, x3, lsl #2]

l14:
	ldr w2, [x1, #(2 * 4)]! ; Update x1
	; mov x3, #2
	; ldr w2, [x1, x3, lsl #2]! ; Error

	adrp x2, arr1@PAGE
	add	x2,	x2, arr1@PAGEOFF
l15:
	ldr	x1, [x2], #2

_l16:
	adrp x1, myoctaword@PAGE
	add	x1,	x1, myoctaword@PAGEOFF
	ldp x2, x3, [x1]
	stp x2, x3, [x1]

exit:
    mov x0, #1
    mov x16, #1
    svc #0x80

helloworld2: .ascii "Hello World!"

.data
helloworld:	.ascii "Hello World!"
.align 4
mynumber:	.quad	0x123456789ABCDEF0
arr1:	.fill	10, 4, 0
myoctaword:	.octa 0x12345678876543211234567887654322