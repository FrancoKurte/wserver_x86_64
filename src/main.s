; src/main.s
%include "const.inc"

global _start
extern wsrv_cli
extern wsrv_srv

section .text
_start:
  ; initialize command line interface
  call wsrv_cli

  ; initialize tcp server
  mov rdi, rax
  mov rsi, NULL
  call wsrv_srv
  
  jmp .exit


.exit_err:
  mov rax, SYS_exit
  mov rdi, RET_ERR
  syscall

.exit:
  mov rax, SYS_exit
  mov rdi, RET_SUCC
  syscall
