; Program: some branch and loop constructor
;
; Input: no
;
; Output: none
;

    segment .data
msg    db      "Hello asm",0x0a,0
len    equ      $-msg

    segment .text
    global _start
    extern print

_start:
        lea     ecx, [msg]
        mov     edx,len
        xor     eax,eax 
        call    print
        mov     ebx,eax
        mov     eax,1           ; put 1 into eax register (1 is syscall number)
        int 0x80