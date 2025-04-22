%include "const.inc"
%include "errmsg.inc"
%include "errmacros.inc"

global err_sock_init
global err_sock_bind
global err_sock_listen
global err_sock_accept
global err_sock_write
global err_sock_close

section .data
  DEFINE_ERR sock_init,    ERR_SOCK_INIT_MSG
  DEFINE_ERR sock_bind,    ERR_SOCK_BIND_MSG
  DEFINE_ERR sock_listen,  ERR_SOCK_LISTEN_MSG
  DEFINE_ERR sock_accept,  ERR_SOCK_ACCEPT_MSG
  DEFINE_ERR sock_write,  ERR_SOCK_WRITE_MSG
  DEFINE_ERR sock_close,  ERR_SOCK_CLOSE_MSG

section .text
err_sock_init:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  mov rsi, err_sock_init_msg
  mov rdx, err_sock_init_len
  syscall
  mov rax, RET_ERR
  ret

err_sock_bind:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  mov rsi, err_sock_bind_msg
  mov rdx, err_sock_bind_len
  syscall
  mov rax, RET_ERR
  ret

err_sock_listen:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  mov rsi, err_sock_listen_msg
  mov rdx, err_sock_listen_len
  syscall
  mov rax, RET_ERR
  ret

err_sock_accept:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  mov rsi, err_sock_accept_msg
  mov rdx, err_sock_accept_len
  syscall
  mov rax, RET_ERR
  ret

err_sock_write:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  mov rsi, err_sock_write_msg
  mov rdx, err_sock_write_len
  syscall
  mov rax, RET_ERR
  ret

err_sock_close:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  mov rsi, err_sock_close_msg
  mov rdx, err_sock_close_len
  syscall
  mov rax, RET_ERR
  ret

