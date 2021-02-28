; Program: Moving value from register into memory and back again
;
; Input: no
;
; Output: none
;

    segment .data
a       dq      0x11
b       dq      23
c       dq      -17
d       dq      -23

    segment .text
    global _start

_start:
    mov rbx,[a]
    mov rcx,[b]
    mov rdx,[c]
    mov rsi,[d]
    add rax,rbx ; add b with rax value
    add rax,rcx ; add b with rax value
    add rax,rdx ; add b with rax value
    add rax,rsi ; add b with rax value
    xor rax,rax ; reset rax
    mov eax,1   ; put 1 into eax register (1 is syscall number)
    mov ebx,0   ; put the return value
    int 0x80