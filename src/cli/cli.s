%include "const.inc"

global wsrv_cli

section .text
  extern wsrv_srv
  extern err_no_arg
  extern err_inv_port
  extern utils_strlen
  extern utils_atoi
  extern utils_itoa

; intitializes the tcp server
; rax -> port number
; pointer -> ipv4 address
wsrv_cli:
  ; setup standard stack frame
  push rbp
  mov rbp, rsp
  sub rsp, SIZE_SFM ; REMOVE

  ; check argument count
  mov rax, [rbp + REG_SIZE + CLI_ARGC]
  cmp rax, CLI_MIN_ARGC
  jb .err_no_arg

  ; convert argv[1] to integer
  mov rdi, [rbp + REG_SIZE + CLI_ARGV]
  call utils_atoi

  ; validate port range
  cmp rax, PORT_MIN
  jb .err_inv_port
  cmp rax, PORT_MAX
  ja .err_inv_port

  ; extract ipv4 address
  ; mov rdi, [rbp + SIZE_REG*2 + CLI_ARGV]
  ; call str_replace ; removes '.' from the ip address
  ; mov rdi, rax
  ; convert argv[2] to integer 
  ; call utils_atoi
  ; validate address range
  ; cmp rax, IPV4_MIN
  ; jb .err_inv_ipv4_addr
  ; cmp rax, IPV4_MAX
  ; ja .err_inv_ipv4_addr

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
