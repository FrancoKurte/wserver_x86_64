; src/main.s
%include "const.inc"
section .text
global _start
  extern wsrv_cli

_start:
  call wsrv_cli

.exit:
  mov rax, SYS_EXIT
  mov rdi, FD_STDOUT
  syscall
