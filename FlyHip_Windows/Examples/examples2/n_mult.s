		.data 
		.org 0x400
A:		.byte	33
B:		.byte	72
P:		.space 2

        .code
		.org 0
		lbu r1, A(r0)
		lbu r2, B(r0)		; PB
		slli r3, r1, 8		; A << 8
		addui r6, r0, 8		; stevec
for:	andi r5, r2, 1
		beq r5, if
		addu r2, r2, r3
if:		srli r2, r2, 1
		subui r6, r6, 1
		bne r6, for
		sh P(r0), r2
        halt
