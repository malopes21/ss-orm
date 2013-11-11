.486 
.model flat, stdcall 

option casemap: none 

include \masm32\include\masm32.inc 
include \masm32\include\kernel32.inc 

includelib \masm32\lib\masm32.lib 
includelib \masm32\lib\kernel32.lib 

.data 
	principal DD 0
	v1 DD 0
	v2 DD 0
	v3 DD 0
	v4 DD 0

.code

start: 

principal proc near
	push ebp
	mov ebp, esp

	;comando atrib
	mov eax, 10
	mov v1, eax 

	;comando atrib
	mov eax, 20
	mov v2, eax 

	;comando ver
	push offset v1: 
	call StdOut

	;comando ver
	push offset  v2: 
	call StdOut

	;comando ver
	push offset  v3: 
	call StdOut

	;comando ver
	push offset  v4: 
	call StdOut

	pop ebp
	ret

	push 0
	call ExitProcess
end start
