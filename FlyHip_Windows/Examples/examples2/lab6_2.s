		.data 
		.org 0x400
stavek:	.asciiz "Danes je 10. november 2014"
		.align 4
N:		.space 4	; stevilo cifer
		
		.text
		.org 0
		add r2, r0, r0		; indeks niza
		add r6, r0, r0		; stevec cifer
zanka:	lbu r1, stavek(r2)
		sgtui r3, r1, 47
		sltui r4, r1, 58
		and r5, r3, r4
		beq r5, if
		addui r6, r6, 1
if:		addui r2, r2, 1
		bne r1, zanka
		sw N(r0), r6
		halt
