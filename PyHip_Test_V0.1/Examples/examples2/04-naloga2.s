		; Utezena vsota dveh stevil
		
		.data 
		.org 0x400
A:		.word16 64
B:		.word16 8

		.code
		.org 0	

		lh r1,A(r0)
		lh r2,B(r0)	
							
		; 7B = B + 2B + 4B
		add r4,r1,r2		; TEMP = B + A
		slli r2,r2,1		
		add r4,r4,r2		; TEMP = TEMP + 2B
		slli r2,r2,1
		add r4,r4,r2		; TEMP = TEMP + 4B
		srai r4,r4,3		; TEMP = TEMP/8
		
		sh A(r0),r4
		
		halt
		
		