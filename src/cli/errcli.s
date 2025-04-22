%include "const.inc"
%include "errmsg.inc"
%include "errmacros.inc"

global err_no_arg

section .data
DEFINE_ERR no_arg, ERR_NO_ARG_MSG

section .text
; args errors
; if not enough arguments were given
err_no_arg:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  mov rsi, err_no_arg_msg
  mov rdx, err_no_arg_len
  syscall
  mov rax, RET_ERR
  ret


