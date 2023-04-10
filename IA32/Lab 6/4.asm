; MASM code (Run on VS)
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExistCode: DWORD

.data
	; define you variables here

	;MARKS DWORD 10,20,10,20,30
	;N DWORD 5
	X DWORD 1, 2, 3,
			2, 5, 1
	Y DWORD 1, 2, 3, 4,
			4, 3, 6, 1,
			5, 7, 3, 3
	Z DWORD	0, 0, 0, 0, 
			0, 0, 0, 0
	A DWORD 0
	B DWORD 0
	CC DWORD 0
	THREE DWORD 3
	TWO DWORD 2
	FOUR DWORD 4

.code



main PROC

oostart:	mov ebx, A
			cmp ebx, 2
			je ooexit
			mov B, 0

ostart:		mov ebx, B
			cmp ebx, 4
			je oodown
			mov CC, 0
			

start:		mov ebx, CC
			cmp ebx, 3
			je odown
			mov eax, A
			mul THREE
			add eax, CC
			mov ecx, [X+4*eax]
			mov eax, CC
			mul FOUR
			add eax, B
			mov eax, [Y+4*eax]
			mul ecx
			mov ecx, eax
			mov eax, A
			mul FOUR
			add eax, B
			mov ebx, [Z+4*eax]
			add ebx, ecx
			mov [Z+4*eax], ebx

			mov ebx, CC
			inc ebx
			mov CC, ebx
			jmp start

odown:		mov ebx, B
			inc ebx
			mov B, ebx
			jmp ostart

oodown:		mov ebx, A
			inc ebx
			mov A, ebx
			jmp oostart			
ooexit:		mov eax, 0


;write code here
INVOKE ExitProcess, 0
main ENDP
End main
