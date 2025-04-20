%include "const.inc"

global sock_init
global sock_bind
global sock_listen
global sock_accept

extern utils_swape

section .text

; socket(2), initializes a tcp socket
sock_init:
  push rbp
  mov rbp, rsp
  
  ; socket(2) call
  mov rax, SYS_SOCK
  mov rdi, AF_INET
  mov rsi, SOCK_STREAM
  mov rdx, SOCK_DEFAULT_PROTO
  syscall

  mov rsp, rbp
  pop rbp
  ret

; bind(2), bind socket to IPv4:Port
; rdi <- socket fd
; rsi <- port number
; rax -> status code
sock_bind:
  push rbp
  mov rbp, rsp
  sub rsp, SOCKADDR_LEN

  ; setup of sockaddr_in(3type)
  mov word [rbp - 16], AF_INET
  mov rax, rsi
  call utils_swape
  mov [rbp - 14], ax
  mov dword [rbp - 12], INADDR_ANY
  mov dword [rbp - 8], NULL
  
  ; bind(2) call
  mov rax, SYS_SOCK_BIND
  mov rdi, rdi
  lea rsi, [rbp - 16]
  mov rdx, SOCKADDR_LEN
  syscall

  mov rsp, rbp
  pop rbp
  ret

; listen(2), mark socket as listening
; rdi <- socket fd
; rax -> status code
sock_listen:
  push rbp
  mov rbp, rsp

  ; listen(2) call
  mov rax, SYS_SOCK_LISTEN
  mov rdi, rdi
  mov rsi, BACKLOG
  syscall

  mov rsp, rbp
  pop rbp
  ret

; accept(2), accept a client connection
; rdi <- socket fd
; rax -> client fd
sock_accept:
  push rbp
  mov rbp, rsp

  ; accept(2) call
  mov rax, SYS_SOCK_ACCEPT
  mov rdi, rdi
  mov rsi, NULL
  mov rdx, NULL
  syscall

  mov rsp, rbp
  pop rbp
  ret
