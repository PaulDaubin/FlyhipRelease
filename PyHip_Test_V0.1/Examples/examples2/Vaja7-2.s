
		.data
		.org 0x400
ISBN: 	.byte 0,3,4,0,0,1,3,8,1,8
		
		.code
		.org 0x0
		addui r30, r0, 0x4FC
		addui r24, r0, ISBN
		call r31, CHECK_ISBN(r0)
		halt
		
CHECK_ISBN:
		sw 0(r30), r31		; PUSH R31
		subui r30, r30, #4
		sw 0(r30), r29		; PUSH R29
		subui r30, r30, #4
		add r29, r0, r30	; FP

		; <<
		sw 0(r30), r6		; PUSH R6
		subui r30, r30, #4
		sw 0(r30), r7		; PUSH R7
		subui r30, r30, #4
		sw 0(r30), r8		; PUSH R8
		subui r30, r30, #4
		
		addui r6, r0, 10	; števec (i)
		addui r7, r0, 0		; sum
LOOP1:	lbu r8, 0(r24)		; r8 = isbn(i)
		addu r7, r7, r8		; sum += isbn(i)
		subui r6, r6, 1		; r6--
		addui r24, r24, 1
		bne r6, LOOP1

		; r7 mod 11 == 0 ?
LOOP2:	subi r7, r7, 11		; r7 -= 11
		sgti r8, r7, 0		; r8 = (r7 > 0)?
		bne r8, LOOP2
		seqi r8, r7, 0		; r8 = (r7 == 0)?
		add r28, r0, r8						
		; >>
		
		addui r30, r30, #4		; POP R8
		lw r8, 0(r30)
		addui r30, r30, #4		; POP R7
		lw r7, 0(r30)
		addui r30, r30, #4		; POP R6
		lw r6, 0(r30)

		add r30,r0,r29 			; pobrisemo lokalne spremenljivke

		addui r30, r30, #4		; pop r29 (obnovi)
		lw r29, 0(r30)

		addui r30, r30, #4		; pop r31 (povratni naslov)
		lw r31, 0(r30)

		j 0(r31)