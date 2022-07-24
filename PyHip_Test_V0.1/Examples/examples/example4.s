	.data
	.org 0x400
x: 	.byte 127, -15, 0xb3, 0x1F
y: 	.byte 0
	
	.code
	.org 0

    Call r1, 0xD4(r3)
    call r4, 0xD4(r2)
    
    halt