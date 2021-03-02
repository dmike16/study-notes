; Program: Some math operation in assembly
;
; Input: no
;
; Output: none
;

    segment .data
a   dq      5
b   dq      3
c   dq      0
y0  dq      4
x0  dq      1
y1  dq      7
x1  dq      12
    segment .text
    global _start

_start:
    push    rbp             ; push the frame pointer on stack
    mov     rbp,rsp         ; move the stack pointer in rbp
    sub     rsp,16          ; extend by 16 byte the stac
    mov     rax,[a]         ; move a in rax
    imul    rax,[a]         ; mult rax for a
    add     [c],rax         ; sum a^2 to c
    mov     rax,[b]
    imul    rax,[b]
    add     [c],rax         ; calculte the square distance |a,b|^2

    mov     rax,[y0]
    mov     rbx,[x0]
    sub     rax,[y1]
    mov     rdx,rax
    mov     rbx, 0
    cmovns  rdx,rbx
    mov     rbx,-1
    cmovs   rdx,rbx
    sub     rbx,[x1]
    idiv    rbx
    mov     rbx,0
    cmovno  rax,rbx
    mov     rbx,1
    cmovo   rax,rbx
    leave                   ; reset the frame pointer and leave the stack
    mov     ebx,eax     
    xor     rax,rax         ; reset rax
    mov     eax,1           ; put 1 into eax register (1 is syscall number)
    int 0x80