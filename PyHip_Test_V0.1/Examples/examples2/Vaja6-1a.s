; Vaja 6.1a: Zanka od 0 do n-1 
; Vrednost n preberemo iz pomnilnika (bajt na naslovu z oznako n), 
; stevec zapisuje v pomnilnik z začetkom na oznaki tmp

		.data
		.org 0x400
n:		.byte 6
tmp:	.space 8

		.code
		.org 0
		lbu r1, n(r0)		; r1 <- n
		addui r2, r0, #0	; stevec zanke
zanka:	sb tmp(r2), r2		; M[r2] <- r2
		addui r2, r2, #1	; r2 <- r1 + 1
		sltu r3, r2, r1		; r3 <- (r2 < r1)
		bne r3, zanka
		halt
