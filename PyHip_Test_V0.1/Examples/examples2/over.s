		.data 
		.org 0x400
A:		.word 0x7FFFFFFF
B:		.word 0x2
C:		.space 4

		.text
		.org 0
		lw r1, A(r0)
		lw r2, B(r0)
		add r3, r1, r2
		sw C(r0), r3
		halt

