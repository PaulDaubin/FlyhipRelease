	.data 
	.org 0x400
A:	.byte 128
B:	.byte -55
C:	.word16 0xF123
D:	.word16	0xEC23
	.align 4
E:	.word 0x12345678
F:	.word 0

    .code
	.org 0
	lb r1,A(r0)
	lbu r2,B(r0)
	lh r3,C(r0)
	lhu r4,D(r0)
	lw r5,E(r0)
	lw r6,F(r0)
	
	sb A(r0),r2
	sb B(r0),r1
	sh C(r0),r4
	sh D(r0),r3
	sw E(r0),r6
	sw F(r0),r5
	
	halt