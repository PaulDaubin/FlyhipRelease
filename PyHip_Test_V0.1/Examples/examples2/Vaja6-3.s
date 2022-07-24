; Naloga 6.3: Naloga 5.2 (Mnozenje dveh 8-bitnih nepredznacenih stevil) 
;             z uporabo skokov (za zanko)
		.data
		.org 0x400
A: 		.byte 101	;0xff
B: 		.byte 41	;0xff
P: 		.space 2

		.code
		.org 0
		lbu r1,A(r0)
		lbu r2,B(r0)
		addu r3,r0,r0 		; produkt
		addui r5,r0,#8		; stevec zanke
	
loop:
		andi r4,r2,#0x1 ; ali je LSb enak 1
		subi r4,r4,#1	; razsirimo enke/nicle:
		not r4,r4,r4 	;    0000->0000, 0001->1111
		and r4,r4,r1	; A*b[i]
		addu r3,r3,r4	; prištevanje delnega produkta	
		slli r1,r1,#1	; A<<1
		srli r2,r2,#1	; B>>1
		subui r5,r5,#1	; r5--
		bne r5,loop

		sh P(r0), r3
		halt
