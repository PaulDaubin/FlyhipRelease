		.data 
		.org 0x400
bajt:	.byte 128
		.align 2
polb:	.word16 0xF123
		.align 4
beseda:	.word 0x12345678
nula:	.word 0

        .code
		.org 0
		lb r1, bajt(r0)
		lbu r2, bajt(r0)
		lh r3, polb(r0)
		lhu r4, polb(r0)
		lw r5, beseda(r0)
		lw r6, nula(r0)
		addi r7, r0, 0xF123
		addui r8, r0, 0xF123
		lhi r9, 0x12345678			; isto kot lhi r9, 0x1234
		addi r9, r9, 0x12345678		; isto kot addi r9, r9, 0x5678
		addi r10, r0, 0
        halt
