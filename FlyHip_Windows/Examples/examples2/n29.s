        .data 
.org 0x400

tabela:	.word 10, -5, 3, 20, -1

min:	.space 4
max:	.space 4


REZ:	.space 1

        .text
.org 0

addui r30, r0, #0x4fc

addui r24, r0, #tabela
addui r25, r0, #5

addui r1, r0, #max
sw 0(r30), r1	; push r1
subui r30, r30, #4

addui r1, r0, #min
sw 0(r30), r1	; push r1
subui r30, r30, #4

call r31, minmax(r0)

addui r30, r30, #8; st. parametrov x 2

        halt

minmax: sw 0(r30), r31	; push r31
subui r30, r30, #4
sw 0(r30), r29	; push r29
subui r30, r30, #4
    add r29, r0, r30	; kazalec na okvir (r29)
;--- konec vstopne tocke
sw 0(r30), r1	
subui r30, r30, #4
sw 0(r30), r2	
subui r30, r30, #4
sw 0(r30), r3	
subui r30, r30, #4
sw 0(r30), r4	
subui r30, r30, #4
sw 0(r30), r24	
subui r30, r30, #4
sw 0(r30), r25	
subui r30, r30, #4

lw r1, 0(r24)	; min
add r2, r0, r1	; max

addui r24, r24, #4	; naslov elemnta
subui r25, r25, #1  ; stevec obhodov

zanka:  lw r3, 0(r24)
slt r4, r3, r1
beq r4, nimanjsi
add r1, r0, r3

nimanjsi:
sgt r4, r3, r2
beq r4, nivecji
add r2, r0, r3

nivecji:
addui r24, r24, #4
subui r25, r25, #1
bne r25, zanka

lw r4, 12(r29)	; 3. parameter (naslov min)
sw 0(r4), r1

lw r4, 16(r29)	; 4. parameter (naslov max)
sw 0(r4), r2

addui r30, r30, #4
lw r25, 0(r30)
addui r30, r30, #4
lw r24, 0(r30)
addui r30, r30, #4
lw r4, 0(r30)
addui r30, r30, #4
lw r3, 0(r30)
addui r30, r30, #4
lw r2, 0(r30)
addui r30, r30, #4
lw r1, 0(r30)
;--- izstopna tocka
add r30, r0, r29
addui r30, r30, #4	; pop r29
lw r29, 0(r30)
addui r30, r30, #4	; pop r31
;lw r31, 0(r30)
;j 0(r31)
