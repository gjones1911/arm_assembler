/* ==================================================================
 *
 * CS 160 (Gregor) -- arm1: Introduction to ARM
 *by Gerald Jones
 * block.s
 *
 * Example of performing word-block copies of memory.
 * [GNU ARM Assembler Workbook, Section 7]
 *
 * ================================================================== */
 .text
 
 .global _start
 
 .equ		num,20			@number of words to copy
 
 _start:
 			ldr r0,=src		@r0=&src
 			ldr r1,=dst		@r1=&dst
 			mov r2,#num		@r2=number of words to copy
 			mov r3,r2,lsr #3	@r3=r2/8,the # of 8 word multiples
 			cmp r3,#1
			blo endcopy 			
 			
blockcopy:
			ldmia r0!,{r4,r5,r6,r7,r8,r9,r10,r11} 	@r4=[r0],r5=[r0+4],r6=[r0+8]	ect.
			stmia r1!,{r4,r5,r6,r7,r8,r9,r10,r11}	@[r1]=r4,[r1+4]=r5, ect.	
			subs r3,r3,#1									@r3=r3-1
			bne blockcopy									@if r3 d.n.e. 0 go to copy
			ands r2,r2,#7									@get number of single word copys left =r2
																@above will get the number left < 8 or from bit 3 dwn
endcopy:
		  ldr r12,[r0],#4
		  str r12,[r1],#4
		  subs r2,r2,#1
		  bne endcopy
		  
exit:   swi     0x11


        .data                   @ Read/write data follows
        .align                  @ Make sure data is aligned on 32-bit 
                                @   boundaries

src:    .word     1,  2,  3,  4,  5,  6,  7,  8,  9, 10
        .word    11, 12, 13, 14, 15, 16, 17, 18, 19, 20

dst:    .word     0,  0,  0,  0,  0,  0,  0,  0,  0,  0
        .word     0,  0,  0,  0,  0,  0,  0,  0,  0,  0

        .end		  