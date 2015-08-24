.DATA

	var1 DW 4
	var2 DW 4h
	var3 DB "hello\n\0"		; the \n generate a 0ah character output
	var4 DB 'b'
	var5 DB "\0\0\0\0\0\0"
	var6 DB 1

.CODE

start :
	COPY R1 , 5
	COPY R0 , 3
	STDOUT var3
	STDOUT var3
	STDOUT var3
	
	COPY R3 , 5	; max. number chars read
	STDIN var5	; use R3 with mem. offset 
	
	STDOUT var5

	EXIT 0

.END 
		
