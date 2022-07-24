	.data
	.org 0x40008000
	
A:	.word 500
B:	.word 400

	.code
	.org 0
			
	
	addui r1, r0, 0x4000
	slli r1, r1, 16
	
	;lhi r1, 0x40008000	
	
	lhi r1, A 		; nalozimo 0x4000 v zgornji del registra
	addui r1,r1,A	; pristejemo 0x8000 v spodnji del
	
	lw r2, 0(r1)	; uporabimo odmik v registru
	lw r3, B-A(r1)	; uporabimo odmik v registru ter razliko med oznakami
	add r4,r3,r2	; sestejemo A in B
	
	halt ; ustavimo delovanje		
	
	
