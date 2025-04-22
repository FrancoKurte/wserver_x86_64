%include "const.inc"

global wsrv_srv

extern sock_init
extern sock_bind
extern sock_listen
extern sock_accept
extern file_write
extern file_close

section .data
  _msg db "Hello World", NULL
  _msg_len equ $ - _msg

section .text

; initializes the server
; rdi <- port number
; rsi <- ipv4 address
; rax -> status code
wsrv_srv:
  push rbp
  mov rbp, rsp
  sub rsp, SIZE_SFM

  ; save port number
  mov word [rbp - SIZE_SFM + SIZE_PORT], di

  ; socket initialization for ipv4 under tcp
  call sock_init

  ; save socket fd
  mov qword [rbp - SIZE_SFM + SIZE_REG + SIZE_PORT], rax

  ; binding to a socket address
  mov rdi, [rbp - SIZE_SFM + SIZE_REG + SIZE_PORT]
  mov rsi, [rbp - SIZE_SFM + SIZE_PORT]
  call sock_bind

  ; listen for connections
  mov rdi, [rbp - SIZE_SFM + SIZE_REG + SIZE_PORT]
  mov rsi, SOCK_BACKLOG
  call sock_listen
  test rax, rax
  jnz .exit_err

  mov rdi, [rbp - SIZE_SFM + SIZE_REG + SIZE_PORT]
  call .accept_loop

  jmp .exit

; rdi <- socket fd (listening)
.accept_loop:
  push rbp
  mov rbp, rsp
  sub rsp, SIZE_SFM ; 64B total (caller + callee)

.loop:
  ; accept a connection
  call sock_accept
  mov qword [rbp - SIZE_REG], rax
  
  mov rax, SYS_write
  mov rdi, [rbp - SIZE_REG]
  mov rsi, _msg
  mov rdx, _msg_len
  syscall

  ; close client socket
  call file_close
  
  jmp .accept_loop
  mov rsp, rbp
  pop rbp
  ret 

.exit_err:
  mov rax, RET_ERR 
  mov rsp, rbp
  pop rbp
  ret

.exit:
  mov rax, RET_SUCC
  mov rsp, rbp
  pop rbp
  ret
