; Program: exit with main entry point
;
; Input no
;
; Output: only set the exit code. ($? into the shell)
;
  segment .text
  global main

main:
  mov eax,1   ; 1 is the exit syscall number
  mov ebx,5   ; the status value to return
  int 0x80    ; execute a syscall
