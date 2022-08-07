; vsota dveh 64 bitnih stevil

		.data
		.org 0x400
		
A:		.word64 0x10000000FFFFFFFF, 0x10000000FFFFFFFF
B:		.word64 0x1000000000000002, 0x1000000000000002
REZ:	.space 8

		.code
		.org 0
		
		addui r1, r0, B-A	; stevec besed od desne proti levi
		addui r7, r0, 0		; prenos
		
SUM:	subui r1, r1, 4		; zmanjsaj stevec
		lw r2, A(r1)
		lw r3, B(r1)
		addu r4, r2, r3		; vsota
		add r4, r4, r7		; dodaj prenos
		sw REZ(r1), r4
		
		; sgtu r5, r2, r4		; ali je prvi operand vecji od vsote
		; sgtu r6, r3, r4		; ali je drugi operand vecji od vsote
		; or r7, r6, r5			; ali je katerikoli operand vecji od vsote
		
		; subu r5, r0, r2
		; sltu r7, r3, r5		; ali je r3 < max - r2 (ce drzi: r7 <- 1, prenos <- 0)
		; xori r7, r7, 1
		
		not r6, r0, r0		; r6 <- 0xFFFFFFFF
		subu r5, r6, r2
		sgtu r7, r3, r5		; ali je r3 > max - 1 - r2 (ce drzi: r7 <- 1, prenos <- 1)
		
		bne r1, SUM
		
		halt
