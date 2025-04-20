; src/errrs/err.s
%include "const.inc"
global err_no_arg
global err_inv_port
global err_nan
global err_sock_create
global err_sock_bind

global exit_err

; error messages (subject to change)
section .data
  _err_no_arg_msg db "Err: Port number required.", LINE_FEED
  _err_no_arg_len equ $ - _err_no_arg_msg
  _err_inv_port_msg db "Err: Invalid port number.", LINE_FEED
  _err_inv_port_len equ $ - _err_inv_port_msg
  _err_nan_msg db "Err: Input given is not number.", LINE_FEED
  _err_nan_len equ $ - _err_nan_msg
  _err_sock_create_msg db "Err: Cannot create AF_INET socket.", LINE_FEED
  _err_sock_create_len equ $ - _err_sock_create_msg
  _err_sock_bind_msg db "Err: Cannot bind socket's address.", LINE_FEED
  _err_sock_bind_len equ $ - _err_sock_bind_msg

section .text

; args errors
; if not enough arguments were given
err_no_arg:
  mov rax, SYS_WRITE
  mov rdi, FD_STDOUT
  mov rsi, _err_no_arg_msg
  mov rdx, _err_no_arg_len
  syscall
  jmp exit_err

; port errors
; if the port given is invalid
err_inv_port:
  mov rax, SYS_WRITE
  mov rdi, FD_STDOUT
  mov rsi, _err_inv_port_msg
  mov rdx, _err_inv_port_len
  syscall
  jmp exit_err

; parsing errors
; if read character is not a number
err_nan:
    mov rax, SYS_WRITE
    mov rdi, FD_STDOUT
    mov rsi, _err_nan_msg
    mov rdx, _err_nan_len
    syscall
    jmp exit_err

; socket errors
err_sock_create:
  mov rax, SYS_WRITE
  mov rdi, FD_STDOUT
  mov rsi, _err_sock_create_msg
  mov rdx, _err_sock_create_len
  syscall
  jmp exit_err

err_sock_bind:
  mov rax, SYS_WRITE
  mov rdi, FD_STDOUT
  mov rsi, _err_sock_bind_msg
  mov rdx, _err_sock_bind_len
  syscall
  jmp exit_err

; exit with status code (1)
exit_err:
  mov rdi, ERR_CODE
  mov rax, SYS_EXIT
  syscall
