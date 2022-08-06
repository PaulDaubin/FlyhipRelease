	.data
	.org 0x400
x: 	.byte 127, -15, 0xb3, 0x1F
y: 	.byte 0
	
	.code
	.org 0
       
    movre r1
    MoVRE r31

    halt