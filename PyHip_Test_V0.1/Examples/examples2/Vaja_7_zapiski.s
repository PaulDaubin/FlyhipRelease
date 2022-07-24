;int sestej(int a, int b, int c){
;	return a+b+c;
;}

;int main(){
;	int a, b, c, rez;
;	...
;	a=5;
;	b=6;
;	c=7;
;	rez = sestej(a,b,c);
;	...
;}

; podatkovni odsek je med 0x400 in 0x4FF
;0x400		M[A]=5
;0x404		M[B]=6
;0x408		M[C]=7
;0x40C		M[REZ]=18
;...
;0x4E8						<- SP (skladovni kazalec)	
;0x4EC		r7
;0x4F0		r6				<- FP (kazalec na okvir)
;0x4F4		r29					
;0x4F8		r31					
;0x4FC		7				

;PUSH reg
;sw 0(r30), reg
;subui r30, r30, 4

;POP reg
;addui r30, r30, 4
;lw reg, 0(r30)

; glavni program
	.data
	.org 0x400
A:	.word 5
B:	.word 6
C:	.word 7
REZ: .space 4

	.code
	.org 0
0:	addui r30, r0, 0x4FC		; inicializacija sklada
4:	lw r24, A(r0)				; prvi argument prenesemo preko r24
8:	lw r25, B(r0)				; prenesemo drugi argument
12:	lw r3, C(r0)				; v poljuben register zapišemo tretji argument
	;PUSH r3
16:	sw 0(r30), r3
20:	subui r30, r30, 4
24:	call r31, sestej(r0)		; v r31 bo povratni naslov (v našem primeru 28)
	;POP r3
28:	addui r30, r30, 4
	lw r3, 0(r30)
	sw REZ(r0), r28
	halt
	
	

; podprogram
	.org 0x1000
sestej:
; vstopna točka
	PUSH r31
	PUSH r29
	add r29, r0, r30		; v FP (kazalec na okvir v r29) zapišemo SP
	PUSH r6
	PUSH r7

; jedro
	add r6, r24, r25		; r6=a+b
	lw r7, 12(r29)
	add r28, r6, r7


; izstopna točka
	POP r7
	POP r6
	POP r29
	POP r31
	j 0(r31)
	
	
	
	
	
	
	
	
	
	
	