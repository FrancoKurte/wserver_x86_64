; src/srv/srv.s - Main server logic for wsrv (Phase 1)

%include "const.inc"

global wsrv_srv
extern sock_init
extern sock_bind
extern sock_listen
extern sock_accept
extern utils_swape

section .data
    hello_msg db "Hello, World!", LINE_FEED, NULL
    hello_len equ $ - hello_msg

section .text

; ──────────────────────────────────────────────────────────────
; wsrv_srv - Initialize and run the TCP server
; Input : rax = Port number (host byte order, 1–65535)
; Output: None (runs forever or exits on error)
; ──────────────────────────────────────────────────────────────
wsrv_srv:
    push rbp
    mov rbp, rsp
    sub rsp, SRV_SFS                  ; Allocate stack space

    ; Save port number
    mov [rbp - 8], rax

    ; ───── socket(AF_INET, SOCK_STREAM, 0)
    call sock_init
    cmp rax, -1
    je .socket_error
    mov [rbp - 16], rax              ; Save socket fd

    ; ───── bind(fd, port)
    mov rdi, [rbp - 16]              ; sockfd
    mov rsi, [rbp - 8]               ; port
    call sock_bind
    cmp rax, -1
    je .bind_error

    ; ───── listen(sockfd, BACKLOG)
    mov rdi, [rbp - 16]              ; sockfd
    call sock_listen
    cmp rax, -1
    je .listen_error

.accept_loop:
    ; ───── accept(sockfd, NULL, NULL)
    mov rdi, [rbp - 16]              ; sockfd
    call sock_accept
    cmp rax, -1
    je .accept_error
    mov [rbp - 24], rax              ; client_fd

    ; ───── write(client_fd, hello_msg, hello_len)
    mov rax, SYS_WRITE
    mov rdi, [rbp - 24]              ; client_fd
    mov rsi, hello_msg
    mov rdx, hello_len
    syscall

    ; ───── close(client_fd)
    mov rax, SYS_CLOSE
    mov rdi, [rbp - 24]
    syscall

    jmp .accept_loop

; ───── Error Handlers ─────

.socket_error:
    mov rax, SYS_EXIT
    mov rdi, 1                       ; Exit code 1
    syscall

.bind_error:
    mov rax, SYS_CLOSE
    mov rdi, [rbp - 16]
    syscall

    mov rax, SYS_EXIT
    mov rdi, 2
    syscall

.listen_error:
    mov rax, SYS_CLOSE
    mov rdi, [rbp - 16]
    syscall

    mov rax, SYS_EXIT
    mov rdi, 3
    syscall

.accept_error:
    mov rax, SYS_CLOSE
    mov rdi, [rbp - 16]
    syscall

    mov rax, SYS_EXIT
    mov rdi, 4
    syscall

