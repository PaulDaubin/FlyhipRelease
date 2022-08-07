	.data
	.org 0x400
x: 	.byte 127, -15, 0xb3, 0x1F
y: 	.byte 0
	
	.code
	.org 0
 L5:   BEQ r1, L5
 L2:   beq r4, L2
 L3:   BNE r7, L3
 L4:   bne r10, L4

    halt