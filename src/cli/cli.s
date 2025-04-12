; src/cli/cli.s
global wsrv_cli

section .text
  extern err_no_arg
  extern err_invalid_port
  extern utils_strlen
  extern utils_atoi
  extern utils_itoa

wsrv_cli:
  ; argc, argv are saved in registers rax, rsi
  ; port number must be argv[1]
  mov rax, [rsp]
  cmp rax, 2
  jl err_no_arg

  ; extract argv[1]
  mov rsi, [rsp + 8]
  mov rdi, [rsi + 8]
  call utils_atoi
  
  ; validate port range
  cmp rax, 1
  jl err_invalid_port
  cmp rax, 65535
  jg err_invalid_port
  
  ; !!! DEBUG ONLY !!!
  ; write into stdout the port number after conversion
  mov rdi, rax
  call utils_itoa
  mov rsi, rax
  mov rdi, rax
  call utils_strlen
  mov rdi, 1
  mov rdx, rcx
  mov rax, 1
  syscall

  jmp exit_cli

exit_cli:
  ret
