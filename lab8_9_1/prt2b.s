	.file	"prt2b.cpp"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	mov	r3, #11534336		@assigns x=
	add	r3, r3, #20992		@
	add	r3, r3, #5
	str	r3, [fp, #-24]
	ldr	r3, .L9
	str	r3, [fp, #-20]
	b	.L8
.L3:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L4
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	rsb	r3, r2, r3
	str	r3, [fp, #-20]
	b	.L2
.L4:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	rsb	r3, r2, r3
	str	r3, [fp, #-24]
.L2:
.L8:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L3
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-16]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L10:
	.align	2
.L9:
	.word	911555333
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
