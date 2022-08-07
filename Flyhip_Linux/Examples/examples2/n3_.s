		.data 
		.org 0x400
Ab:		.byte 12
Bb:		.space 1
		.align 4
Aw:		.word 50
Bw:		.space 4

		.data 
		.org 0x20000000
Ah:		.word16 9
Bh:		.space 2

		.text
		.org 0
		lbu r1, Ab(r0)
		sb Bb(r0), r1
		lw r1, Aw(r0)
		sw Bw(r0), r1
        call r31, fun(r0)
		lhi r2, #Ah
		addui r2, r2, #Ah
		lhu r1, 0(r2)
		lhi r2, #Bh
		addui r2, r2, #Bh
		sh Bh(r2), r1
		halt

        .code
        .org 0x10000000
fun:    addi r1, r0, 1
        j 0(r31)


