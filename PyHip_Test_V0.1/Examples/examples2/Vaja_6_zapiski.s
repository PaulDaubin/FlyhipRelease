;if (x < 5)
;	x = x + 1;		// TRUE
;else
;	x = x - 1;		// FALSE

		.data
		.org 0x400
X:		.byte 10
		.align 4
TAB:	.word 34, 15, -17, 9, -23
TAB2:	.byte 34, 15, -17, 9, -23

		.code
		.org 0x0
	
; pogojni stavek
		lb r1, X(r0)		; r1 <- 10
		slti r2, r1, 5		; r2 = 1, če je r1 < 5		// TRUE
							; r2 = 0, če je r1 >= 5		// FALSE
		; beq r1, OZNAKA	skoči na OZNAKA, če je r1 == 0
		; bne r1, OZNAKA	skoči na OZNAKA, če je r1 != 0
		beq r2, FALSE
						
TRUE:	addi r1, r1, 1
		j END(r0)

FALSE:	subi r1, r1, 1

END:	sb X(r0), r1
		halt
		
		
		
; zanka
; vsakemu elementu v tabeli TAB prištejemo 3 in rezultat shranimo na
; isti naslov
		addi r3, r0, 0		; v r3 zapišemo indeks
		
ZANKA:	lw r1, TAB(r3)
		addi r1, r1, 3
		sw TAB(r3), r1
		
		addi r3, r3, 4		; povečamo indeks
		seqi r2, r3, 20		; ko bo r3 = 4*5, zaključimo zanko
		beq r2, ZANKA
		
		halt

; zanka drugi primer

		addi r3, r0, 5		; r3 hrani indeks
		
ZANKA2:	subi r3, r3, 1		; zmanjšamo indeks

		lb r1, TAB2(r3)
		addi r1, r1, 3
		sb TAB(r3), r1
		
		bne r3, ZANKA2
		
		halt

		.org 0x100
		
		;...
		;beq r1, DALEC		; skoči relativno glede na trenutni naslov
							; -2^15 <= odmik <= 2^15 - 1
							; ne deluje, ker je odmik prevelik
			
		bne r1, BLIZU
		;j DALEC(r0)		ne deluje, ker je oznaka prevelika
		
		; r2 <- DALEC
		lhi r2, DALEC
		addui r2, r2, DALEC
		j 0(r2)
		
		
BLIZU:	addi r1, r1, 5
		halt








		.org 0x12345678
		
DALEC:	addi r1, r1, 1
		halt






