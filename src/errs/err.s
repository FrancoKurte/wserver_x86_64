; src/errrs/err.s
global err_no_arg
global err_invalid_port
global err_nan

section .data
  _err_no_arg_msg db "Err: Port number required", 10
  _err_no_arg_len equ $ - _err_no_arg_msg
  _err_invalid_port_msg db "Err: Invalid port number", 10
  _err_invalid_port_len equ $ - _err_invalid_port_msg
  _err_nan_msg db "Err: character found is not a number", 10
  _err_nan_len equ $ - _err_nan_msg

section .text

; error for not enough arguments
err_no_arg:
  mov rdi, 1 
  mov rsi, _err_no_arg_msg
  mov rdx, _err_no_arg_len
  mov rax, 1
  syscall
  jmp exit_err

; error for invalid port given
err_invalid_port:
  mov rdi, 1
  mov rsi, _err_invalid_port_msg
  mov rdx, _err_invalid_port_len
  mov rax, 1
  syscall
  jmp exit_err

err_nan:
    mov rdi, 1
    mov rsi, _err_nan_msg
    mov rdx, _err_nan_len
    mov rax, 1
    syscall
    jmp exit_err

; exit with status code (1)
exit_err:
  mov rdi, 1
  mov rax, 60
  syscall
