section .data
n1 dd 3
n2 dd 4

section .text

global fact
fact:
    push eax
    push ebx
    push ecx
    push edx
    
    ; stack contents are
    ; edx, ecx, ebx, eax, ret, n, ans
    ;   0,   4,   8,  12,  16, 20, 24
    
    mov eax, [esp+20]
    cmp eax, 1
    je end
    
    ; recursively call factorial
    mov ebx, eax
    dec ebx
    sub esp, 4
    push ebx
    call fact
    add esp, 4
    pop ebx
    mul ebx
    
end:
    mov [esp+24], eax  
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    sub esp, 4
    mov eax, [n1]
    push eax
    call fact
    add esp, 4
    pop eax ; this stores first answer
    
    mov eax, [n2]
    push eax
    call fact
    add esp, 4
    pop eax ; this stores second answer
    ret
