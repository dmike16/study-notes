; Program: allocate some data to see hoe memory is handle
; Input no
;
; Output: none
;

    segment .data
a       dd      4
b       dd      4.4
c       times   10 dd 0
d       db      "hello world", 0

    segment .bss
g       resd    1
h       resd    10

    segment .text
    global _start

_start:
  mov eax,1   ; 1 is the exit syscall number
  mov ebx,0   ; the status value to return
  int 0x80    ; execute a syscall