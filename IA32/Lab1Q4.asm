section .data
V1: DD 10, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
N: DD 11

section .text
MOV ECX, 0
MOV ESI, 0

top:

CMP ESI, [N]
JE down
MOV EAX, [V1+ESI*4]
IMUL EAX
ADD ECX, EAX
INC ESI
JMP top

down:
HLT