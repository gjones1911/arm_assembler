@Gerald Jones
@Lab 10 for 160
@will take in a set of ascii characters representing a BCD value, convert them to decimal digits and store the decimal value in memory	
	
	
.text
	
	.global	_start
	.align	


_start:
		mov	ip, sp
		stmfd	sp!, {fp, ip, lr, pc}
		sub	fp, ip, #4			@sets up frame pointer
		ldr 	r2,=N					@loads r2 with address value labeled N
		ldr 	r3,[r2]				@loads r3 with values stored at N
		str	r3,[fp]				@pushes N onto stack at fp		
		mov	r4,#4					@loads r4 with the value 4, will be used to calculate space needed for stack
		mov   r0,#0x0f				@r0=0x0f, will be used to convert ascii value into the correct decimal value		
		add 	r6,r3,#1				@r6= r3+1=N+1, will help calculate space needed for stack
		mul   r7,r4,r6				@r4=r4*r6=4*(N+1),
		sub	sp,sp,r7				@pushes stack up by r7(4*(N+1)) slots
		mov 	r6,#0					@r6=0, will hold intermidiate binary value
		mov   r5,#4					@r5=4, will be used to offset fp to get N,d0,d1,d2,..dn
		mov   r7,#0
	
loop:
	   ldr r4,[r2,#4]!				@r4=[r2+4]=[N+4], r2=r2+4, loads r4 with value in N+4,which is some asscii value
	   and r4, r0, r4					@r4 = 0x0f and r4, will convert ascii value for some digit into decimal value
	   str r4, [fp,-r5]				@pushes decimal value of BCD onto stack at fp+r5
	   add r5,r5,#-4					@r5=r5-4,move pointer
	   add r6,r6,r4					@gets intermidiate binary value  
	   subs r3,r3,#1					@r3=r3-1, and sets flags for branching	
	   beq 	Done						@if r3-1=0 go to done
		mov r7,r6						@store value of r6 into r7
		mov r8,#10   					@set r8=10
	   mul r6,r7,r8					@calculate binary value
	   b loop
	   
Done:
					
		ldr r9,=Answer		
		str r6, [r9]				@when done store binary value in Answer
		swi     0x11                   @ Software interrupt to terminate
	.global N	
	.data
	.align	
	
	
N:
	.word	4,0x31,0x39,0x31,0x31  @represents the ascii values to be converted and stored
	
	.global Answer
	.data
	.align
	
Answer:
	.word 0
				

.end

