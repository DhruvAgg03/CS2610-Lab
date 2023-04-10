section .data
G: DD 1
E: DD 2
F: DD 3
U: DD 6
V: DD 7
X: DD 4
W: DD 8

section .text
MOV EAX, [U]
CMP EAX, [V]
JGE ELSE
MOV EAX, [W]
CMP EAX, [X]
JNE ELSE
MOV EAX, [E]
ADD EAX, [F]
MOV [G], EAX
JMP END

ELSE:
MOV EAX, [E]
SUB EAX, [F]
MOV [G], EAX

END: