; src/main.s
section .text
global _start
  extern wsrv_cli

_start:
  call wsrv_cli

.exit:
  mov rdi, 0
  mov rax, 60
  syscall
