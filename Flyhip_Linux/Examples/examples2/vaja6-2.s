; Vaja 6.2
		; Podatkovni segment - operandni pomnilnik    
		.data
		.org 0x400
MIN: 	.space 2
MAX: 	.space 2
BIT: 	.space 1
NEG:	.space 1
		
		.org 0x40002000
		.align 2
TAB:	.word16 29, -50, 59, 70, 150, 200, -36, -345, 22, 500, 945, -37, 11, 1234, 55

		; Kodni segment -  ukazni pomnilnik    
		.code
		.org 0x0
		
		; naslov tabele TAB damo v r20 (bazni register pri naslavljanju tabele)
		lhi r20,TAB
		addui r20,r20,TAB
		
		lh r1,0(r20)		; MIN = TAB[0]
		lh r11,0(r20)		; MAX = TAB[0]	
		add r19,r0,r0		; stevec zanke		
		add r15,r0,r0		; stevec za BIT
		add r16,r0,r0		; stevec za NEG
		
LOOP:	
		lh r2, 0(r20)		; r20 ima vlogo kazalca na tabelo (int16 *pTAB)
		 
		slt  r3,r2,r1		; r3 <- (r2 < r1)
		sgt  r13,r2,r11		; r13 <- (r2 > r11)
	    
		; naredimo maski za select operacijo za MIN:
		not r3,r3,r0		; r3 <- maska
		addui r3,r3,#1
		not r4,r3,r0		; r4 <- !maska
		
		; naredimo maski za select operacijo za MAX:
		not r13,r13,r0		; r3 <- maska
		addui r13,r13,#1
		not r14,r13,r0		; r4 <- !maska
		
		; vejitev if-else lahko realiziramo z multipleksorjem in masko, brez skočnih ukazov
		; is MIN?
		; r1 <- (r1 & !maska) V (r2 & maska) : 
		and  r5,r1,r4
		and  r6,r2,r3
		or 	 r1,r5,r6		; v r1 hranimo najmanjse stevilo
		; is MAX?
		; r11 <- (r11 & !maska) V (r2 & maska) : 
		and  r5,r11,r14
		and  r6,r2,r13
		or 	 r11,r5,r6		; v r11 hranimo najvecje stevilo
		
		; koliko stevil ima nastavljena bita 0 in 3, spet brez vejitev 
		andi r5, r2, 0x9	; maska 0x9 = 0b00001001
		seqi r6, r5, 0x9	; če je rezultat enak maski, sta oba bita na 1
		add r15,r15,r6		; prištej števcu BIT 1, če sta oba postavljena, sicer 0
		
		; koliko stevil je negativnih
		slt r5,r2,r0		; 	r5 <- (r2 < 0)
		add r16,r16,r5		;   prištej števcu negativnih 1, če je r2 < 0, sicer 0
		
		; povecamo bazo in stevec
		addui r20,r20,#2	; ! kazalčna aritmetika (pTAB++) 		
		addui r19,r19,#1
		; in skocimo nazaj, če še nismo prebrali vseh stevil iz TAB
		sltui r18,r19,#15	; 15 števil
		bne r18, LOOP		;-------------- konec zanke
		
		; shranimo rezultate
		sh MIN(r0),r1
		sh MAX(r0),r11
		sb BIT(r0),r15
		sb NEG(r0),r16
		
		halt