.text

.global _start
.align

_start:
	ldr r0, =N			@get address of N and store it in r0(points to number of letters)
	ldrb r1, [r0]		@get the number of letters to be sorted and store it in r0
							
b_loop:					@this section of code performs the first part of a nested loop 
	mov r5,r1			@r5 will be used to control the nested loop
	add r0,r0,#1		@this instruction will make r0 point to the next element
	add r4,r0,#1		@this will cause r4 to point to the element 1 up from that pointed to by r0
	subs r1,r1,#1		@this is used to check for completion of the sorting list
	beq Done				@if r1-1=0 then you are done sorting
s_loop:					@this portion of code represents the loop nested inside the larger loop
	subs r5,r5,#1		@sub 1 from r5 to decrement the smaller loop counter
	beq b_loop			@when r5=0 then go back to the larger loop
	ldrb r6,[r0]		@get the value at the r0 position and load it to r6
	ldrb r7,[r4]		@get the value at the r4 position and load it to r7
	cmp r6,r7			@compare r6, and r7(i.e. perform r6-r7, and set flags)
	bgt switch			@if r6-r7 > 0 (i.e. positive, meaning r6>r7) go to the switch algorithm
	blt go_on			@if r6-r7 < 0 (i.e. negative, meaning r6 < r7) go to the go_on algorithm
	ldrb r10,[r0,#1]	@if they are equal the rearrange list so that the numbers that equal are next to each other
	strb r7,[r0,#1]
	strb r10,[r4]
	add r4,r4,#1		@increment r4 to get next number, note done by 1 b/c dealing with bytes
	b   s_loop			@go back through small(nested) loop

switch:					@this portion of code does the switching of two elements if the element on the left is larger than the one on the right
	strb r6,[r4]
	strb r7,[r0]
	add r4,r4,#1
	b   s_loop

go_on:					@these set if instructions increment r4 to get the next number to be compared and loops back into the nested loop
	add r4,r4,#1
	b   s_loop

.data						@the below code sets uo the data to be sorted
.align
.global N
N:
	.byte 4,0x45,0x41,0x43,0x41
	
Done:	
		 swi     0x11                   @ Software interrupt to terminate
.end	
