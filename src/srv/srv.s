; src/server/srv.s
global wsrv_server

section .data

section .bss
  srv_fd resq 1

section .text
wsrv_server:


exit_server:
  mov rdi, 0
  mov rax, 60
  syscall
