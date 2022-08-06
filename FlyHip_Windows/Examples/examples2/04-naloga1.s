		.data
		.org 0x400
STEV1:	.word16 2323
STEV2:	.word16	4343
STEV3:	.byte -127
STEV4:	.byte 6
		.align 4
STEV5:	.word 23456
STEV6:	.word 43210
SUM:	.space 4
DIF:	.space 4
MUL:	.space 4
DIV:	.space 1
		.align 2
SUM16:	.space 2

		.code
		.org 0
		
		lhu r1,STEV1(r0)
		lhu r2,STEV2(r0)
		addu r1,r1,r2
		sh	SUM16(r0),r1
		
		lb r1,STEV3(r0)
		lb r2,STEV4(r0)
		sll r3,r1,r2
		sw MUL(r0),r3
		srai r1,r1,#5
		sb DIV(r0),r1
		
		lw r1,STEV5(r0)
		lw r2,STEV6(r0)
		add r3,r1,r2
		sw SUM(r0),r3
		sub r3,r2,r1
		sw DIF(r0),r3
	
		halt
		
		
		
		