	.data
	.org 0x400
x: 	.byte 127, -15, 0xb3, 0x1F
y: 	.byte 0
	
	.code
	.org 0

    DI 
    di
    EI
    ei
    halt
    HALT
    NOP
    nop
    Rfe
    rFE
     
    halt