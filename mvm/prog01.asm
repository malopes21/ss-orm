.DATA

	var1 DB 3
	var2 DW 4h
	var3 DB "hello"
	var4 DB 'b'

.CODE

start :
	COPY R0 , 10
;	COPY R1 , 10
;	COPY R0 , 07d
;	COPY R1 , R0
;	COPY R2 , 12h
;	COPY R3 , 'a'
;	LOAD R2 , 0003h
;	STORE 0006h , R3
;pos0 : 
; 	ADD R1 , R2
;	SUB R1 , R0
	EXIT 0

.END 
		