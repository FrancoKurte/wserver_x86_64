%define ITOA_BUF_SIZE 32
%define MIN_VALID_PORT 1
%define MAX_VALID_PORT 65535

global wsrv_cli

section .text
  extern err_no_arg
  extern err_invalid_port
  extern utils_strlen
  extern utils_atoi
  extern utils_itoa

wsrv_cli:
  ; setup standard stack frame
  push rbp
  mov rbp, rsp
  sub rsp, ITOA_BUF_SIZE

  ; check argument count
  mov rax, [rbp + 16]
  cmp rax, 2
  jl .err_no_arg_clear_stack

  ; convert argv[1] to integer
  mov rdi, [rbp + 32]
  call utils_atoi

  ; validate port range (1 to 65535)
  mov rbx, rax
  cmp rbx, MIN_VALID_PORT
  jl .err_invalid_port_clear_stack
  cmp rbx, MAX_VALID_PORT
  jg .err_invalid_port_clear_stack

  jmp .exit

.err_no_arg_clear_stack:
  mov rsp, rbp
  pop rbp
  jmp err_no_arg

.err_invalid_port_clear_stack:
  mov rsp, rbp
  pop rbp
  jmp err_invalid_port

.exit:
  mov rsp, rbp
  pop rbp
  ret

