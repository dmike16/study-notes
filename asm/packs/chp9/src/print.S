; Program: print on std Output with a system call
;
; Input: 
;   ecx message
;   edx len
;
; Output: none
;
section .text
    global print

print:
    push    rbp
    mov     rbp,rsp
    mov     ebx,1	;file descriptor (stdout)
    mov     eax,4	;system call number (sys_write)
    int     0x80	;call kernel
    xor     eax,eax
    leave
    ret