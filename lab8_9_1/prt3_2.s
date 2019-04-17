	.file	"prt3_2.cpp"
	.global	x
	.bss
	.align	2
	.type	x, %object
	.size	x, 4
x:
	.space	4
	.global	ptr
	.align	2
	.type	ptr, %object
	.size	ptr, 4
ptr:
	.space	4
	.global	arr
	.data
	.align	2
	.type	arr, %object
	.size	arr, 24
arr:
	.word	1
	.word	23
	.word	17
	.word	4
	.word	-5
	.word	100
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	r3, .L6
	ldr	r2, .L6+4
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L3:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, .L6
	ldr	r3, [r3, #0]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, .L6+8
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-16]
	cmp	r3, #5
	ble	.L3
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	ptr
	.word	arr
	.word	x
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
