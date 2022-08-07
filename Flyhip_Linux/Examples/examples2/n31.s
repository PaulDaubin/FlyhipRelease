; 31. Napišite podprogram v zbirnem jeziku za procesor HIP, ki desetiško vrednost pretvori v ustrezno ASCII kodo ustrezne šestnajstiške števke. 
; Podprogram dobi kot parameter desetiško vrednost (število med 0 in 15) v registru R24. 
; ASCII kodo, ki predstavlja ustrezno šestnajstiško števko ('0', '1', …, '9', 'A', …, 'F') pa naj podprogram vrne v registru R28. 
; Namig: podprogram bo zelo kratek, če uporabite tabelo z že vpisanimi ASCII kodami. 
	
		.data 
		.org 0x400
polje:	.word	65, 3, -22, 105, -15
cnt:	.word	5
min:	.space 	4
max:	.space 	4

		.text
		.org 0
		addui r30, r0, 0x7FC	; nastavimo SP		
		
		; parametri
		addui r24, r0, 5	; npr.
				 
		call r31, ascii_koda(r0)
		
		add r1, r0, r28
		subui r2, r2, 1
		bne r2, for		
		halt

ascii_koda:
; VSTOPNA TOCKA: ------------------------------------		
		;push r31 ; shrani povratni naslov
		sw 0(r30), r31
		subui r30, r30, 4	

		; push r29 ; shrani r29 (frame pointer)
		sw 0(r30), r29
		subui r30, r30, 4	

		add r29, r0, r30 	; FP <- SP : nastavi kazalec na okvir;
; PROCEDURA: ----------------------------------------
		subui r30, r30, 4 ; rezerviraj na skladu prostor za 32-bitno spremenljivko i
		; push r6 ; shrani register, ki se v podprogramu spreminja
		sw 0(r30), r6
		subui r30, r30, 4	
		; push r7 ; shrani register, ki se v podprogramu spreminja
		sw 0(r30), r7
		subui r30, r30, 4	
		; push r8 ; shrani register, ki se v podprogramu spreminja
		sw 0(r30), r8
		subui r30, r30, 4	
		; push r9 ; shrani register, ki se v podprogramu spreminja
		sw 0(r30), r9
		subui r30, r30, 4	

		sw 0(r29), r0	; i=0
for:	lw r6, 0(r29)	; r6=i
		slli r6, r6, 2	; r6*=4
		;;;!!!lw r7, r24		; polje (naslov)
		addu r7, r7, r6	; r7 je naslov elementa (&polje[i])
		lw r8, 0(r7)	; r8 = polje[i]

		lw r9, -12(r29)	; r9 = &min
		lw r10, 0(r9)	; r10 = min
		sgt r11, r10, r8	; r11 = (min > polje[i])
		beq r11, skok1
		sw 0(r9), r8	; min = polje[i]
skok1:	
		lw r9, -16(r29)	; r9 = &max
		lw r10, 0(r9)	; r10 = max
		sgt r11, r8, r10	; r11 = (polje[i] > max)
		beq r11, skok2
		sw 0(r9), r8	; max = polje[i]
skok2:
		srai r6, r6, 2	; r6 /= 4
		addui r6, r6, 1	; r6++
		sw 0(r29), r6	; i=r6
		sgt r9, r25, r6
		bne r9, for
		
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
