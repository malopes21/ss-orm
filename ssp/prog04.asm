.486 
.model flat, stdcall 

option casemap: none 

include \masm32\include\masm32.inc 
include \masm32\include\kernel32.inc 

includelib \masm32\lib\masm32.lib 
includelib \masm32\lib\kernel32.lib 

.data 
	principal DD 0
	a1 DD 0
	a2 DD 0
	a3 DD 0
	a4 DD 0

.code

start: 

	;comando de atrib
	mov eax, 35
	mov a1, eax 

	;comando de atrib
	mov eax, a1
	add eax, 12
	sub eax, a2
	mov a2, eax 

	;comando condicional
	mov eax, a2
	mov ebx, 50
	cmp eax, ebx
	jle rotulo1

	;comando de atrib
	mov eax, 10
	mov a3, eax 
	jmp sai_rotulo1
rotulo1:

	;comando de atrib
	mov eax, 20
	mov a3, eax 
sai_rotulo1:

	;comando condicional
	mov eax, a1
	mov ebx, 30
	cmp eax, ebx
	jge rotulo2

	;comando de atrib
	mov eax, 100
	mov a3, eax 
	jmp sai_rotulo2
rotulo2:
sai_rotulo2:

	;comando laço enquanto
rotulo3:
	mov eax, a4
	mov ebx, 10
	cmp eax, ebx
	jge rotulo4

	;comando de atrib
	mov eax, a3
	add eax, 2
	mov a3, eax 

	;comando de atrib
	mov eax, a4
	add eax, 1
	mov a4, eax 
	jmp rotulo3
rotulo4:

	push 0
	call ExitProcess
end start
