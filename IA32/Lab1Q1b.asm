section .data
P: 
DD 1
Q: 
DD 2
R: 
DD 4
S: 
DD 3
T:
DD 5
U: 
DD 7
V: 
DD 2
W:
DD 3
Z:
DD 12
    
section .text
    MOV EAX,[P]
    ADD EAX,[Q]
    MOV EBX,[R]
    SUB EBX,[S]
    IMUL EBX
    MOV EBX,EAX
    MOV EAX,[V]
    MOV ECX,[W]
    IMUL ECX
    SUB EBX,EAX
    MOV EAX,[T]
    MOV ECX,[U]
    IDIV ECX
    ADD EAX,EBX
    MOV [Z],EAX
    HLT
