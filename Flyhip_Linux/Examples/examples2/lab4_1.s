		.data 
		.org 0x400
A:		.word 128
B:		.space 4
AU:		.word 0xFF000000
BU:		.space 4
AA:		.word64 -32
BB:		.space 8
AAU:	.word64 0xAAFF000000
BBU:	.space 8
POTENCA: .byte 3

		.text
		.org 0
		
		lw r2, POTENCA(r0)

		lw r1, A(r0)
		sra r3, r1, r2
		sw B(r0), r3
	
		lw r1, AU(r0)
		srl r3, r1, r2
		sw BU(r0), r3
	
	
		lw r1, AAU(r0)
		addui r20, r0, 4
		lw r11, AAU(r20)
		
		srl r3, r1, r2
		sw BU(r0), r3
	
		
		halt
