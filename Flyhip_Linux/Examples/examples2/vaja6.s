; Vaja6
		; Podatkovni segment - operandni pomnilnik
		.data
		.org 0x400
MIN: 	.space 1
MAX: 	.space 1
BIT: 	.space 1
NEG:	.space 1
		
		.org 0x40002000
		.align 2
TAB:	.word16 29, -50, 60, 70, 150, 200, -36, -35, 22, 500, 45, 37, 11, 64, 55


		; Kodni segment -  ukazni pomnilnik    
		.code
		.org 0x0
		
		; naslov tabele TAB damo v r20 (to bo baza pri baznem naslavljanju tabele)
		lhi r20,TAB
		addui r20,r20,TAB
		
		; 1. poisci min
		; daj v r1 prvo stevilo iz tabele
		lh r1,0(r20)
		; stevec zanke:
		add r19,r0,r0
		
LOOP:
		; nalozimo naslednje stevilo iz tabele
		lh r2, 2(r20)
		slt  r3,r2,r1		; r3 <- (r2 < r1)
	    
		; naredimo maski za select operacijo:
		not r3,r3,r0		; r3 <- maska
		addui r3,r3,#1
		not r4,r3,r0		; r4 <- !maska
		
		; if ... else realiziramo z multiplekserjem in masko, brez skočnih ukazov
		; r1 <- (r1 & !maska) V (r2 & maska)
		and  r5,r1,r4
		and  r6,r2,r3
		or 	 r1,r5,r6		; v r1 hranimo najmanjse stevilo
		
		; povecamo bazo in stevec
		addui r20,r20,#2
		addui r19,r19,#1
		; in skocimo nazaj, ce se nismo prebrali vseh stevil iz TAB
		sgti r18,r19,#15
		beq r18, LOOP
		
		halt