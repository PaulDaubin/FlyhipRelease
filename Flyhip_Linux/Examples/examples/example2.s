	.data
	.org 0x400
x: 	.byte 127, -15, 0xb3, 0x1F
y: 	.byte 0
	
	.code
	.org 0
    Addi r1, r2, #0xF234
    addi r1, r2, x-y
    addui r3, r4, #0x1548
    adDui r3, r4, 12
    subi r5, r6, #0x1248
    subi r5, r6, 14
    subui r7, r8, #0x6254
    suBui r7, r8, 16
    andi r9, r10, #0x1348
    andi r9, r10, 18
    ORI r11, r12, #0x4897
    ORI r11, r12, 20
    xori r13, r14, #0x0001
    xoRi r13, r14, 22
    slli r15, r16, #0x0516
    slli r15, r16, -10
    srai r17, r18, #0x0147
    srai r17, r18, -12
    srli r19, r20, #0x0047
    srli r19, r20, -14
    SEQI r21, r22, #0x4789
    seqi r21, r22, -16
    snei r23, r24, #0x2369
    snei r23, r24, -18
    sgti r25, r26, #0x7412
    sgti r25, r26, -20
    sgtui r27, r28, #0x4856
    sgtui r27, r28, -22
    slti r29, r30, #0x1289
    slti r29, r30, -1
    sltui r31, r0, #0x6547
    sltui r31, r0, 1
    
    halt