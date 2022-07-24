;int a=5, b=6, c=7, rez;
;int sestej(int a, int b , int c) {
;	return a + b + c;
;}
;int main() {
;   rez = sestej(a, b, c);
;}

		.data
		.org 0x400
A:		.word 12
B:		.word 13
C:		.word 5
		
		.code
		.org 0
		addui r30, r0, 0x4fc	; SP
		lw r24, A(r0)
		lw r25, B(r0)
		lw r11, C(r0)		
		
		sw 0(r30), r11		; push r11
		subui r30, r30, #4
		
		call r31, sestej(r0)
		addui r30, r30, 4
		halt

sestej:
VSTOP:
		sw 0(r30), r31		; PUSH R31
			subui r30, r30, #4
		sw 0(r30), r29		; PUSH R29
			subui r30, r30, #4
		addui r29, r30, 0
PROCEDURA:
		sw 0(r30), r6		; PUSH R06
			subui r30, r30, #4
		lw r6,12(r29) ; 		; r6 <- c
		add r6, r6, r24 		; r6 <- r6 + a
		add r6, r6, r25 		; r6 <- r6 + b
		add r28, r0, r6 		; return r6

		addui r30, r30, #4		; POP R06
		lw r6, 0(r30)

IZSTOP:		
		add r30,r0,r29 ; pobrisemo lokalne spremenljivke

		addui r30, r30, #4		; pop r29 (obnovi)
		lw r29, 0(r30)

		addui r30, r30, #4		; pop r31 (povratni naslov)
		lw r31, 0(r30)

		j 0(r31) 		; povratek v klicoci program
				
