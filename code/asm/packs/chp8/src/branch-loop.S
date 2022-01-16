; Program: some branch and loop constructor
;
; Input: no
;
; Output: none
;

    segment .data
a       dd      1, 3, 5, 7, 9
b       dd      2, 4, 6, 8, 0
n       dd      5
p       dq      0
pal     db      "refer",0
half    dd      2
a1      db      0
a2      db      0

    segment .text
    global _start

_start:
        ; exmaple of for loop
        ; sum(a_i*b_i)
        mov edx,[n]
        xor ecx,ecx
.dotp:  cmp rcx,rdx
        je .edotp
        mov eax, [a+rcx*4]
        imul eax, [b+rcx*4]
        add [p], eax
        inc rcx
        jmp .dotp
.edotp:
        ; example of repet instruction
        ; is palindrome
        cld
        xor rax, rax
        xor rcx,rcx
        ; calculate stringlen
        mov rcx,-1
        lea rdi, [pal]
        xor al,al
        repne scasb
        mov rax,-2
        sub rax,rcx
        ;
        mov rcx,rax
        xor rdx,rdx
        div dword [half]
        mov rdx,0
.paloop:
        cmp rdx,rax
        jnl .palstop
        mov bl, [pal + rcx - 1]
        cmp bl, [pal + rdx]
        jne .palstop
        inc rdx
        dec rcx
        jmp .paloop        

.palstop:
        mov rbx,rax
        sub rbx,rdx     
        xor rax,rax         ; reset rax
        mov eax,1           ; put 1 into eax register (1 is syscall number)
        int 0x80