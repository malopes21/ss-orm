.DATA

	var1 DB 3
	var2 DW 4h
	var3 DB "hello"

.CODE

start :
	COPY R0 , 10
	COPY R1 , R0
	COPY R2 , 12h
pos0 : 
 	ADD R1 , R2
	SUB R1 , R0
	EXIT 0

.END 
		