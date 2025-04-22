; src/errrs/err.s
%include "const.inc"
%include "errmsg.inc"
%include "errmacros.inc"

global err_inv_port
global err_inv_ipv4_addr
global err_nan

section .data

; error messages (subject to change)
DEFINE_ERR inv_port, ERR_INV_PORT_MSG
DEFINE_ERR inv_ipv4_addr, ERR_INV_IPV4_ADDR_MSG
DEFINE_ERR nan, ERR_NAN_MSG

section .text
; port errors
; if the port number is invalid
err_inv_port:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  mov rsi, err_inv_port_msg
  mov rdx, err_inv_port_len
  syscall
  mov rax, RET_ERR
  ret

; ip address errors
; if the ipv4 address is invalid
err_inv_ipv4_addr:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  mov rsi, err_inv_ipv4_addr_msg
  mov rdx, err_inv_ipv4_addr_len
  syscall
  mov rax, RET_ERR
  ret

; parsing errors
; if read character is not a number
err_nan:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  mov rsi, err_nan_msg
  mov rdx, err_nan_len
  syscall
  mov rax, RET_ERR
  ret
