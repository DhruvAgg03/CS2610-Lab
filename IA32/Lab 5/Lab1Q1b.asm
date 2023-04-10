section .data
P: 
DD -2
Q: 
DD 6
R: 
DD 4
S: 
DD 5
T:
DD 8
U: 
DD 3
V: 
DD 2
W:
DD 6
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
