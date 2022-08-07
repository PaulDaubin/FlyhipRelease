		.data
		.org 0x40001000
TAB:	.byte 17,9,20,7,1
VEC:	.space 1
BIT:	.space 1

		.code
		.org 0
		
		lhi r1,TAB
		addui r1,r1,TAB

		add r4,r0,r0	; stevec stevil > 10
		add r5,r0,r0	; stevec stevil z nastavljenim tretjim ali petim bitom
		
		lb r3,0(r1)
		sgti r2,r3,10
		add r4,r4,r2	; stevilo > 10
		andi r3,r3,20
		sgti r2,r3,0
		add r5,r5,r2	; stevilo z nastavljenim bitom
		addi r1,r1,1

		lb r3,0(r1)
		sgti r2,r3,10
		add r4,r4,r2	; stevilo > 10
		andi r3,r3,20
		sgti r2,r3,0
		add r5,r5,r2	; stevilo z nastavljenim bitom
		addi r1,r1,1

		lb r3,0(r1)
		sgti r2,r3,10
		add r4,r4,r2	; stevilo > 10
		andi r3,r3,20
		sgti r2,r3,0
		add r5,r5,r2	; stevilo z nastavljenim bitom
		addi r1,r1,1

		lb r3,0(r1)
		sgti r2,r3,10
		add r4,r4,r2	; stevilo > 10
		andi r3,r3,20
		sgti r2,r3,0
		add r5,r5,r2	; stevilo z nastavljenim bitom
		addi r1,r1,1

		lb r3,0(r1)
		sgti r2,r3,10
		add r4,r4,r2	; stevilo > 10
		andi r3,r3,20
		sgti r2,r3,0
		add r5,r5,r2	; stevilo z nastavljenim bitom
		addi r1,r1,1

		sb 0(r1),r4
		sb 1(r1),r5

		halt
