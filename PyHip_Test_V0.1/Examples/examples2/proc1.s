		.data 
		.org 0x400
a:		.word	5
b:		.word	6

		.text
		.org 0
		addui r30, r0, 0x800
		lw r24, a(r0) ;
		lw r3, b(r0) ;
		subui r30, r30, 4	; push r3 (1)
		sw 0(r30), r3		; push r3 (2)
		call r31, sestej(r0) ;
		addui r30,r30,#4 ;
		halt

sestej:		
; VSTOPNA TOCKA: ------------------------------------
		
		;push r31 ; shrani povratni naslov
		subui r30, r30, 4	
		sw 0(r30), r31		

		; push r29 ; shrani r29
		subui r30, r30, 4	
		sw 0(r30), r29

		add r29,r0,r30 ; R29 <- SP : nastavi kazalec na okvir;
	; ...sedaj lahko spreminjamo SP
;----------------------------------------------------
; PROCEDURA: ----------------------------------------
subui r30,r30,#4 ; rezerviraj na skladu prostor za 32-bitno spremenljivko SUM
; push r6 ; shrani register, ki se v podprogramu spreminja
		subui r30, r30, 4	
		sw 0(r30), r6

lw r6,8(r29) ; r6 <- b
add r6,r6,r24 ; r6 = a + b
sw -4(r29), r6 ; SUM <- r6
lw r28, -4(r29) ; vrednosti vracamo v r28!
; pop r6 ; pred izstopom obnovimo r6
lw r6, 0(r30)
addui r30, r30, 4
;----------------------------------------------------
; IZSTOPNA TOCKA: -----------------------------------
add r30,r0,r29 ; pobrisemo lokalne spremenljivke s sklada
;pop r29 ; obnovi r29
lw r29, 0(r30)
addui r30, r30, 4
;pop r31 ; povratni naslov v r31
lw r31, 0(r30)
addui r30, r30, 4
j 0(r31) ; povratek v klicoci program
