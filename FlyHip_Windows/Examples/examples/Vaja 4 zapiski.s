	.data
	.org 0x400
A:	.word 0x888888887
D:	.word 0x0
E:  .word 0x01
F:  .word 0x0
	.word16 0x80000

	.code
	.org 0x0
	
	addi r1,r0,#16		; r1=16
	addi r1,r0,0x10		; r1=16=00000...00001 0000=0x0000 0010
	
	addi  r2,r0,0x8000	; r2=0x FFFF 8000
	addui r2,r0,0x8000	; r2=0x 0000 8000
	addi  r1,r0,0x80000000		; r1=0x0000 0000
	
	lw r3,A(r0)			; r3=0x40000000
	lw r4,A(r0)			; r4=0x40000000
	add  r5,r3,r4		; r5=0x80000000
	addu r6,r3,r4		; r6=0x80000000
	addu r6,r6,r6		; r6=0x00000000
	
	addi r7,r0,2		; r7=0 000...0000 0010=2
	slli r7,r7,1		; r7=  000...0000 0100=4
	slli r7,r7,1		; r7=   00...0000 1000=8
;	slli r1,r1,n	r1=r1*2^n

	addi r7,r0,16		; r7=  0000...0000 0001 000  0 =16
	srli r7,r7,1		; r7=0 0000...0000 0000 1000   =8
	srli r7,r7,1		; r7=000000...0000 0000 0100   =4
;	srli r1,r1,n	r1=r1/2^n	velja samo za pozitivna števila

	addi r8,r0,0xFFFE	; r8=   111111...1111 1110=-2
	srli r9,r8,1		; r9=  0111111...1111 111
	srai r10,r8,1		; r10= 1111111...1111 111 =-1
;	srai r1,r1,n	r1=r1/2^n	velja za vsa števila
	addi r19,r0, #0
	lb r11, A(r19)
	
	sw D(r19), r3
	sh E(r19), r3
	sb F(r19), r3
	lbu r12, A(r19)
	lh	r13, A(r19)
	lhu	r14, A(r19)
	halt
	
	
; B*7=
;    =B+B+B+B+B+B+B
;	 =B*8-B
;	 =B*(4+2+1)=B*4+B*2+B*1
	
	
	
	
	
; 0x8000=1111111...1111 1000...0000

;  0x40000000 = 0100 000...0000
; +0x40000000 = 0100 000...0000
;				1000 000...0000 = 0x80000000
;+				1000 000...0000
;			1   0000 000...0000		C=1