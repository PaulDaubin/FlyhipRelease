	.data
	.org 0x400
x: 	.byte 127, -15, 0xb3, 0x1F
y: 	.byte 0
	
	.code
	.org 0
    
    lb r1, 0 (r2)
    LB r2, 14(r5)
    lbu r6, 10(r2)
    LBU r2, 16(r5)
    lHU r5, 8(r2)
    Lhu r8, 12(r5)
    lH r9, 0(r8)
    LH r2, 14(r31)
    LW r5, 0(r2)
    lw r6, 14(r5)


    halt