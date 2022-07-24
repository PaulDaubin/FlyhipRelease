		.data 
		.org 0x400
A:		.space 4
B:		.space 4

		.text
		.org 0
		sw B(r0), r1
		sw A(r0), r2
		lw r1, A(r0)
		lw r2, B(r0)
		
		halt

