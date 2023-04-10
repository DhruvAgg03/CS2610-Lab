section .data
X dd 1, 2, 3, 4, 5, 6
Y dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 
Z dd 0, 0, 0, 0, 0, 0, 0, 0

section .text

global myfunc
myfunc:
    push eax
    push ebx
    push ecx
    push edx
    push ebp
    mov eax, 0
    push eax
    push eax
    push eax
    push eax
    ; from now top of stack always stores the following
    ; i, j, k, current_sum, ebp, edx, ecx, ebx, eax, ret, Z, Y, X
    ; 0, 4, 8,          12, 16,   20, 24,  28,  32 , 36, 40, 44, 48 
oostart:        mov eax, [esp]
                cmp eax, 2
                je myexit
                mov eax, 0
                mov [esp+4], eax
                
ostart:         mov eax, [esp+4]
                cmp eax, 4
                je oodown
                mov eax, 0
                mov [esp+8], eax
                
start:          mov eax, [esp+8]
                cmp eax, 3
                je odown
                
                
                ;store first operand in ecx
                mov eax, [esp]
                mov edx, 3
                mul edx
                add eax, [esp+8]
                mov ecx, [esp+48]
                mov ecx, [ecx+4*eax]
                
                ;store second operand in eax
                mov eax, [esp+8]
                mov edx, 4
                mul edx
                add eax, [esp+4]
                mov ebx, [esp+44]
                mov eax, [ebx+4*eax]
                
                ;multiply and update sum
                imul ecx
                mov ebx, [esp+12]
                add eax, ebx
                mov [esp+12], eax
                
                
                mov eax, [esp+8]
                inc eax
                mov [esp+8], eax
                jmp start
                
odown:          ; store the sum into Z and reset sum
                mov ebx, [esp+40]
                mov ecx, [esp+12]
                mov eax, [esp]
                mov edx, 4
                mul edx
                add eax, [esp+4]
                mov [ebx+4*eax], ecx
                mov eax, 0
                mov [esp+12], eax
                
                                        
                mov eax, [esp+4]
                inc eax
                mov [esp+4], eax
                jmp ostart
                
oodown:         mov eax, [esp]
                inc eax
                mov [esp], eax 
                jmp oostart               
myexit:
    add esp, 16
    pop ebp
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
    
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    push X
    push Y
    push Z
    call myfunc
    mov eax, 0
    pop eax
    pop eax
    pop eax
    ret
    
