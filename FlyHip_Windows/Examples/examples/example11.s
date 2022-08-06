	.data
	.org 0x400
x: 	.byte 127, -15, 0xb3, 0x1F
y: 	.byte 0
	
	.code
	.org 0
    
    sb 0(r2), r3
    SB 14(r5), r2
    sh 10(r2), r6
    SH 16(r5), r2
    SW 8(r2), r6
    sw 12(r5), r8


    halt