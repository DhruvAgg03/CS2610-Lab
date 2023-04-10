section .data

record:
    db 1,2,-3,4,5,6,7,8,9,0,12,13,-14,15,16,17,18,19,21,43,54,65,76,87,98
    
section.text
    MOV ESI,0
    MOV EDI, 25
    MOV ECX, 0
    MOV AL, BYTE [ECX]
    MOV EDX,5
    
    
.nextcolumn:
    MOV EAX, 500
.loop:
    CMP ECX,25
    JGE .column_end
    MOV EBX,0
    MOV BL, BYTE [ECX]
    CMP EBX,128
    JL .no_extend
    MOV EBX,0xFFFFFFFF
    MOV BL, BYTE [ECX]
.no_extend:
    ADD ECX,5
    CMP EAX,EBX
    JL .loop
    MOV EAX,EBX
    JMP .loop

.column_end:
    MOV [EDI],AL
    INC EDI
    ADD EDX,5
    CMP EDX,25
    JG .end1
    SUB ECX,24
    JMP .nextcolumn
    
.end1:
    MOV ESI,0
    MOV EDI, 30
    MOV ECX, 0
    MOV AL, BYTE [ECX]
    MOV EDX,5
    
    
.nextcolumn2:
    MOV EAX, -500
.loop2:
    CMP ECX,25
    JGE .column_end2
    MOV EBX,0
    MOV BL, BYTE [ECX]
    CMP EBX,128
    JL .no_extend2
    MOV EBX,0xFFFFFFFF
    MOV BL, BYTE [ECX]
.no_extend2:
    ADD ECX,5
    CMP EAX,EBX
    JG .loop2
    MOV EAX,EBX
    JMP .loop2

.column_end2:
    MOV [EDI],AL
    INC EDI
    ADD EDX,5
    CMP EDX,25
    JG .end2
    SUB ECX,24
    JMP .nextcolumn2

.end2:
    HLT
