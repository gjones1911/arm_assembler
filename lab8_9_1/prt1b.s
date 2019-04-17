	.file	"prt1.cpp"
	.text
	.align	2
	_start:  .global	_start
				.global main
	.type	main, %function



main:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	mov	r3, #27
	str	r3, [fp, #-24]
	mov	r3, #4080
	str	r3, [fp, #-20]
	b	gcd

gcd:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	beq	end
	subgt r2,r2,r3					@if r2>r3(X>Y) then r2=r2-r3
	rsblt r3,r2,r3					@if r2<r3(X<Y)	then r3=r3-r2
	bgt X_g
	blt Y_g
	
	
X_g:
	str r2,[fp,#-24]
	b gcd
	
Y_g:
	str r3,[fp,#-20]	
	b gcd	

end:	
	ldr   r3,[fp,#-24]	
	str	r3, [fp, #-16]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	swi  0x11	
	
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
