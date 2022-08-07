		.data 
		.org 0x400
A:		.byte	11
B:		.byte	11
P:		.space 2

TAB_A:	.word16 64, 4, -5, 4, 64
TAB_B:	.word16 8, 7, 3, -3, 8
TAB_EL:	.byte 5

		.code
		.org 0
		
		; Mnozenje dveh 8-bitnih nepredznacenih stevil s skoki
		
		lbu r1,A(r0)
		lbu r2,B(r0)
		add r3,r0,r0		; Rezultat
		addui r4,r0,0		; Stevec za zanko
		
ZANKA:	andi r5,r2,1		; Preverimo ali je skrajno desni bit enako 1
		beq r5, NI_ENA
		sll r5,r1,r4
		add r3,r3,r5

NI_ENA:	
		addui r4,r4,1
		seqi r5,r4,8
		srli r2,r2,1
		beq r5,ZANKA
		
		sh P(r0),r3
		
		; Utezena vsota elementov dveh polj
		
		lb r3,TAB_EL(r0)	; Nalozimo stevilo elementov
		slli r3,r3,1			; Stevilo elementov*2 -> za tvorbo naslova
		
VSOTA:	subui r3,r3,2

		lh r1,TAB_A(r3)		; Nalozi A[i]
		lh r2,TAB_B(r3)		; Nalozi B[i]
							; 7B[i] = B[i] + 2B[i] + 4B[i]
		add r4,r1,r2		; TEMP = B[i] + A[i]
		slli r2,r2,1		
		add r4,r4,r2		; TEMP = TEMP + 2B[i]
		slli r2,r2,1
		add r4,r4,r2		; TEMP = TEMP + 4B[i]
		
		srai r4,r4,3		; TEMP = TEMP/8
		
		sh TAB_A(r3),r4
		
		
		bne r3,VSOTA

		halt
		