section .data

record:
    db 1,2,-3,4,5,6,7,8,9,0,12,13,-14,15,16,17,18,19,21,43,54,65,76,87,98
    
section.text
    MOV ESI,0
    MOV EDI, 25
    MOV ECX, 0
    MOV AL, BYTE [ECX]
    MOV EDX,25
    
    
.nextrow:
    MOV EAX, 500
.loop:
    CMP ECX,EDX
    JE .row_end
    MOV EBX,0
    MOV BL, BYTE [ECX]
    CMP EBX,128
    JL .no_extend
    MOV EBX,0xFFFFFFFF
    MOV BL, BYTE [ECX]
.no_extend:
    INC ECX
    CMP EAX,EBX
    JL .loop
    MOV EAX,EBX
    JMP .loop

.row_end:
    MOV [EDI],AL
    INC EDI
    ADD EDX,5
    CMP EDX,25
    JG .end1
    JMP .nextrow
    
.end1:
    MOV ESI,0
    MOV EDI, 26
    MOV ECX, 0
    MOV AL, BYTE [ECX]
    MOV EDX,25
    
    
.nextrow2:
    MOV EAX, -500
.loop2:
    CMP ECX,EDX
    JE .row_end2
    MOV EBX,0
    MOV BL, BYTE [ECX]
    CMP EBX,128
    JL .no_extend2
    MOV EBX,0xFFFFFFFF
    MOV BL, BYTE [ECX]
.no_extend2:
    INC ECX
    CMP EAX,EBX
    JG .loop2
    MOV EAX,EBX
    JMP .loop2

.row_end2:
    MOV [EDI],AL
    INC EDI
    ADD EDX,5
    CMP EDX,25
    JG .end2
    JMP .nextrow2

.end2:
    HLT
