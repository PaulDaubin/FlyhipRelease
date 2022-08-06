		.data 
		.org 0x400
AAU:	.word64 0x0000000080000000
BBU:	.word64 0x0000000080000000
SSU:	.space 8

		.text
		.org 0
		addui r10, r0, 4
		lw r1, AAU(r0)
		lw r2, AAU(r10)
		lw r3, BBU(r0)
		lw r4, BBU(r10)

		addu r6, r2, r4
		slt r24, r2, r4		; r24 = r2 < r4
		beq r24, L1			; if ( r2 >= r4) goto L1
		addu r15, r0, r2
		j Ven(r0)
L1:		addu r15, r0, r4
Ven:	slt r24, r6, r15
		addui r18, r0, 0
		beq r24, Cez
		addui r18, r0, 1
Cez:	addu r5, r1, r3
		addu r5, r5, r18
		sw SSU(r0), r5
		sw SSU(r10), r6		
		halt
