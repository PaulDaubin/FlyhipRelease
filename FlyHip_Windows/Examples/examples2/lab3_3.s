			.data 
			.org 0x400
VAR1:		.space 4
VAR2:		.space 4
MAX:		.space 4

			.code
			.org 0
			lw r1, VAR1(r0)
			lw r2, VAR2(r0)
			sgt r3, r1, r2
			beq r3, Druga
			sw MAX(r0), r1
			j Konec(r0)
Druga: 		sw MAX(r0), r2
Konec:		halt
