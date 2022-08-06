		.data 
		.org 0x400
Ab:		.space 1
Bb:		.space 1
		.align 4
Aw:		.space 4
Bw:		.space 4

		.data 
		.org 0x40000000
Ah:		.space 2
Bh:		.space 2

		.text
		.org 0

		lbu r1, Ab(r0)
		sb Bb(r0), r1

		lw r1, Aw(r0)
		sw Bw(r0), r1
	
		lhi r2, #Ah
		addui r2, r2, #Ah
		lhu r1, 0(r2)
		lhi r2, #Bh
		addui r2, r2, #Bh
		sh 0(r2), r1
		
		halt
