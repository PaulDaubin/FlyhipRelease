	.data
	.org 0x400
x: 	.byte 127, -15, 0xb3, 0x1F
y: 	.byte 0
	
	.code
	.org 0
z:  add r1, r2, r3
f:  addu r4, r5, r6
    sub r7, r8, r9
    subu r10, r11, r12
    and r13, r14, r15
    OR R16, R17, R18
DRUGO: xor r22, r23, r24
    sll r25, r26, r27
    sra r28, r29, r30
    srl r31, r0, r1
    seq r2, r3, r4
    sne r5, r6, r7
    sgt r8, r9, r10
    sgtu r11, r12, r13
    slt r14, r15, r15
    sltu r17, r18, r19
    ei

    
    halt
