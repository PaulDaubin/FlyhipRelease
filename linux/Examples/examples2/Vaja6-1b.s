; Vaja 6.1b: Zanka od n-1 do 0 
; Vrednost n preberemo iz pomnilnika (bajt na naslovu z oznako n), 
; stevec zapisuje v pomnilnik z začetkom na oznaki tmp

		.data
		.org 0x400
n:		.byte 6
tmp:	.space 8

		.code
		.org 0
		lbu r1, n(r0)		; r1 <- n
		addui r2, r1, #0	; stevec zanke = n
		addui r3, r0, #0	; stevec zapisov
zanka:	subui r2, r2, #1	; r2 <- r2 - 1 = n-1, ..
		sb tmp(r3), r2		; M[tmp+r3] <- r2
		addui r3, r3, #1	; r3 <- r3 + 1 = 1, ..			
		bne r2, zanka		
		halt
