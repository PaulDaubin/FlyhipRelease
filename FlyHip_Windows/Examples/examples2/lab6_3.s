		.data 
		.org 0x400
A:		.word16	-20, -10, 0, 10, 20
B:		.word16	-100, 0, 100, 200, 300
N:		.byte 5	; dolžina polj
		
		.text
		.org 0
		add r1, r0, r0		; indeks polj
		lbu r10, N(r0)		; stevec
zanka:	lh r2, A(r1)
		lh r3, B(r1)
		add r4, r2, r3
		slli r3, r3, 1
		add r4, r4, r3
		slli r3, r3, 1
		add r4, r4, r3
		srai r4, r4, 3
		sh A(r1), r4
		addui r1, r1, 2
		subui r10, r10, 1
		bne r10, zanka
		halt
