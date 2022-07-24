	.data
	.org 0x100
x: 	.byte 127, -15, 0xb3
z: 	.byte 127, -15, 0xb3
a: 	.byte 127, -15, 0xb3

y: 	.byte 0
	
	.code
	.org 0
    
	lw r1, 8(r0)
  
    halt