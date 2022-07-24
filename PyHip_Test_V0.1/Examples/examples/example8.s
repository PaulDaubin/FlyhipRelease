	.data
	.org 0x400
x: 	.byte 127, -15, 0xb3, 0x1F
y: 	.byte 0
	
	.code
	.org 0
    
    
    lHi r5, #0x12340000
    LhI r8, #0x12365487
    


    halt