		.data 
		.org 0x400
A:		.byte 81		; 0xff, 11, 170
B:		.byte 27		; 0xff, 11, 85
P:		.space 2

		.code
		.org 0
		
		; Mnozenje dveh 8-bitnih nepredznacenih stevil brez skokov
		
		lbu r1,A(r0)
		lbu r2,B(r0)
		addu r3,r0,r0	; produkt
		
		
		andi r4,r1,1	; ali je desni bit enak 1
		
		; prvi nacin:
		subi r4,r4,1
		not r4,r4,r4	; razsirimo enke/nicle
		; drugi nacin:
		; slli r4,r4,31
		; srai r4,r4,31	; razsirimo enke/nicle
		
		and r4,r4,r2
		addu r3,r3,r4
		slli r2,r2,1
		srli r1,r1,1

		
		andi r4,r1,1	; ali je desni bit enak 1
		subi r4,r4,1
		not r4,r4,r4	; razsirimo enke/nicle
		and r4,r4,r2
		addu r3,r3,r4
		slli r2,r2,1
		srli r1,r1,1

		andi r4,r1,1	; ali je desni bit enak 1
		subi r4,r4,1
		not r4,r4,r4	; razsirimo enke/nicle
		and r4,r4,r2
		addu r3,r3,r4
		slli r2,r2,1
		srli r1,r1,1

		andi r4,r1,1	; ali je desni bit enak 1
		subi r4,r4,1
		not r4,r4,r4	; razsirimo enke/nicle
		and r4,r4,r2
		addu r3,r3,r4
		slli r2,r2,1
		srli r1,r1,1

		andi r4,r1,1	; ali je desni bit enak 1
		subi r4,r4,1
		not r4,r4,r4	; razsirimo enke/nicle
		and r4,r4,r2
		addu r3,r3,r4
		slli r2,r2,1
		srli r1,r1,1

		andi r4,r1,1	; ali je desni bit enak 1
		subi r4,r4,1
		not r4,r4,r4	; razsirimo enke/nicle
		and r4,r4,r2
		addu r3,r3,r4
		slli r2,r2,1
		srli r1,r1,1

		andi r4,r1,1	; ali je desni bit enak 1
		subi r4,r4,1
		not r4,r4,r4	; razsirimo enke/nicle
		and r4,r4,r2
		addu r3,r3,r4
		slli r2,r2,1
		srli r1,r1,1

		andi r4,r1,1	; ali je desni bit enak 1
		subi r4,r4,1
		not r4,r4,r4	; razsirimo enke/nicle
		and r4,r4,r2
		addu r3,r3,r4

		halt
