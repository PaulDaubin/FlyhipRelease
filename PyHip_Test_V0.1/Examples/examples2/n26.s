		.data 
		.org 0x400
a:		.word	5
cnt:	.word	10

		.text
		.org 0
		lw r1, a(r0)
		lw r2, cnt(r0)
for:	addui r30, r0, 0x7FC
		add r24, r0, r1
		call r31, inkrement(r0)
		add r1, r0, r28
		subui r2, r2, 1
		bne r2, for		
		halt

inkrement:		
; VSTOPNA TOCKA: ------------------------------------		
		;push r31 ; shrani povratni naslov
		sw 0(r30), r31		
		subui r30, r30, 4	

		; push r29 ; shrani FP
		sw 0(r30), r29
		subui r30, r30, 4	

		add r29, r0, r30 ; FP <- SP
; PROCEDURA: ----------------------------------------
		subui r30,r30,#4 ; rezerviraj na skladu prostor za 32-bitno spremenljivko x
		; push r6 ; shrani register, ki se v podprogramu spreminja
		sw 0(r30), r6
		subui r30, r30, 4	

		add r6, r0, r24 ; r6 = a
		addi r6, r6, 1
		sw -8(r29), r6 ; x <- r6
		lw r28, -8(r29) ; vrednosti vracamo v r28
		; pop r6 ; pred izstopom obnovimo r6
		addui r30, r30, 4	
		lw r6, 0(r30)
; IZSTOPNA TOCKA: -----------------------------------
		add r30, r0, r29 ; pobrisemo lokalne spremenljivke s sklada
		;pop r29 ; obnovi r29
		addui r30, r30, 4
		lw r29, 0(r30)
		;pop r31 ; povratni naslov v r31
		addui r30, r30, 4
		lw r31, 0(r30)
		j 0(r31) ; povratek v klicoci program
