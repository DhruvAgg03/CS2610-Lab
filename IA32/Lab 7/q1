section .data

record1:
    db -12,-23,4,3,54,19,-34,67,12

record2:
    db -45, 12,23,17,19,80,-10

section .text
    MOV EAX ,0
    MOV EBX, 9
    SUB ESP, 4
    PUSH EBX
    PUSH EAX
    CALL square_norm
    POP EAX
    POP EAX
    POP EAX
    MOV EBX, 9
    MOV ECX, 7
    SUB ESP,4
    PUSH ECX
    PUSH EBX
    CALL square_norm
    POP EBX
    POP EBX
    POP EBX
    HLT

square_norm:
    PUSH EAX
    PUSH EBX
    PUSH ECX
    PUSH EDX
    PUSH ESI
    PUSH EDI
    
    MOV EBX, 0 ; store final value here
    ADD ESP, 32
    MOV EDI, [ESP] ;d
    SUB ESP, 4
    MOV ECX, [ESP] ; X
    SUB ESP, 28
    MOV ESI , 0

.loop: 
    CMP ESI, EDI
    JE .end
    MOV EAX,0
    ADD ECX, ESI
    MOV AL, BYTE [ECX]
    CMP EAX,128
    JL .done
    MOV EAX,0xFFFFFFFF
    MOV AL, BYTE [ECX]
.done:
    SUB ECX, ESI
    IMUL EAX
    ADD EBX, EAX
    INC ESI
    JMP .loop
    
.end:
    ADD ESP, 36
    MOV [ESP], EBX
    SUB ESP, 36
    POP EDI
    POP ESI
    POP EDX
    POP ECX 
    POP EBX
    POP EAX
    RET 
