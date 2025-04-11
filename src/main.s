section .text
global _start
  extern wsrv_cli

_start:
  jmp wsrv_cli



exit:
  mov rdx, 1
  mov rax, 60
  syscall
