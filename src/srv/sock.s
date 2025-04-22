%include "const.inc"

global sock_init 
global sock_bind
global sock_listen
global sock_accept
global sock_write
global sock_close
extern err_sock_init
extern err_sock_bind
extern err_sock_listen
extern err_sock_write
extern err_sock_close
extern file_write
extern file_close
extern utils_swape

section .text

; socket(2), initializes a tcp socket
; rax -> socket fd, -1 on error
sock_init:
  mov rax, SYS_sock
  mov rdi, SOCK_DOMAIN_AF_INET
  mov rsi, SOCK_TYPE_STREAM
  mov rdx, SOCK_PROTO_DEFAULT
  syscall
  ret

; bind(2), bind socket to IPv4:Port
; rdi <- socket fd
; rsi <- port number
; rax -> 0 on success, -1 on error
sock_bind:
  push rbp
  mov rbp, rsp
  sub rsp, SOCKADDR_LEN

  ; setup of sockaddr_in(3type)
  mov word [rbp - REG_SIZE*2], SOCK_DOMAIN_AF_INET
  mov rax, rsi
  call utils_swape

  mov [rbp - REG_SIZE - 6], ax
  mov dword [rbp - REG_SIZE - 4], SOCK_BIND_ADDR_ANY
  mov dword [rbp - REG_SIZE], NULL

  ; bind(2) call
  mov rax, SYS_bind
  mov rdi, rdi
  lea rsi, [rbp - REG_SIZE*2]
  mov rdx, SOCKADDR_LEN
  syscall

  mov rsp, rbp
  pop rbp
  ret

; listen(2), mark a socket as listening
; rdi <- socket fd
; rsi <- backlog, queue size
; rax -> 0 for success, else -1
sock_listen:
  push rbp
  mov rbp, rsp

  ; listen(2) call
  mov rax, SYS_listen
  mov rdi, rdi
  mov rsi, rsi
  syscall

  mov rsp, rbp
  pop rbp
  ret

; accept a client connection
; rdi <- socket fd
; rax -> new socket fd, -1 on error
sock_accept:
  push rbp
  mov rbp, rsp

  ; accept(2) call
  mov rax, SYS_accept
  mov rdi, rdi
  mov rsi, NULL
  mov rdx, NULL
  syscall

  mov rsp, rbp
  pop rbp
  ret

; rdi <- socket fd
; rsi <- buffer
; rdx <- bytes to write
sock_write:
  call file_write
  test rax, rax
  jnz err_sock_write
  ret

; rdi <- socket fd
sock_close:
  call file_close
  test rax, rax
  jnz err_sock_close
  ret

