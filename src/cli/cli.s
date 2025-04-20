%include "const.inc"

global wsrv_cli

section .text
  extern wsrv_srv
  extern err_no_arg
  extern err_inv_port
  extern utils_strlen
  extern utils_atoi
  extern utils_itoa

wsrv_cli: 
  ; setup standard stack frame
  push rbp
  mov rbp, rsp
  sub rsp, CLI_SFS

  ; check argument count
  mov rax, [rbp + ARGC + 8]
  cmp rax, MIN_ARGC
  jl .err_no_arg

  ; convert argv[1] to integer
  mov rdi, [rbp + ARGV + 8]
  call utils_atoi

  ; validate port range
  mov rbx, rax
  cmp rbx, MIN_VALID_PORT
  jl .err_inv_port
  cmp rbx, MAX_VALID_PORT
  jg .err_inv_port

  ; initialize tcp server
  call wsrv_srv

  jmp .exit

.err_no_arg:
  mov rsp, rbp
  pop rbp
  jmp err_no_arg

.err_inv_port:
  mov rsp, rbp
  pop rbp
  jmp err_inv_port

.exit:
  mov rsp, rbp
  pop rbp
  ret
