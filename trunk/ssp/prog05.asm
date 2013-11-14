.486 
.model flat, stdcall 

option casemap: none 

include \masm32\include\masm32.inc 
include \masm32\include\kernel32.inc 

includelib \masm32\lib\masm32.lib 
includelib \masm32\lib\kernel32.lib 

.data 
	$$var0 DB "v1: ", 0
	$$var1 DB " v2: ", 0
	$$var2 DB " v3: ", 0
	$$var3 DB " v4: ", 0

.code

start: 

	call principal

	push 0
	call ExitProcess

soma proc near
	push ebp
	mov ebp, esp

	;alocacao de vars locais
	sub esp, 4

	;comando atrib
	mov eax, a
	add eax, b
	mov aux, eax 

	;desalocacao de vars locais e retorno
	mov eax, [ebp-4]
	add esp, 4
	pop ebp
	ret

	;finalizar a proc
	pop ebp
	ret
soma endp

subt proc near
	push ebp
	mov ebp, esp

	;alocacao de vars locais
	sub esp, 4

	;comando atrib
	mov eax, a
	sub eax, b
	mov aux, eax 

	;desalocacao de vars locais e retorno
	mov eax, [ebp-4]
	add esp, 4
	pop ebp
	ret

	;finalizar a proc
	pop ebp
	ret
subt endp

principal proc near
	push ebp
	mov ebp, esp

	;alocacao de vars locais
	sub esp, 16

	;comando atrib
	mov eax, 10
	mov v1, eax 

	;comando atrib
	mov eax, 20
	mov v2, eax 

	;comando ver
	push offset $$var0
	call StdOut

	;comando ver
	push offset $$var1
	call StdOut

	;comando ver
	push offset $$var2
	call StdOut

	;comando ver
	push offset $$var3
	call StdOut

	;finalizar a proc
	pop ebp
	ret
principal endp

end start
