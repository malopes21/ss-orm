.DATA

	var1 DW 4
;	var2 DW 4h
;	var3 DB "hello"
;	var4 DB 'b'

.CODE

start :
;	COPY R0 , -14
;	COPY R1 , 40
;	LOAD R2 , var1
;	STORE var1 , R0
;	ADD R2 , R1

	COPY R0 , 18
	COPY R2 , 3
	COPY R3 , 3
pos1 :
;	DIV R2 , R3
	CMP R2 , R3
	JNE pos0
	COPY R1 , 0ffh
	JMP sai
pos0 :
	COPY R1 , 0eeh
sai :

	PUSH R0
	PUSH R0
	PUSH R0
	PUSH R0

	POP R0
	POP R1
;	POP R2
;	POP R3

	EXIT 0

.END 
		
