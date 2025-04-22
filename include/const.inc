; include/const.inc
%ifndef CONST_INC
%define CONST_INC

; cpu, special
%define REG_SIZE 8
%define NULL 0

; sizes in bytes
%define SIZE_SFXS 8
%define SIZE_SFS 16
%define SIZE_SFM 32
%define SIZE_SFL 64
%define SIZE_SFXL 128
%define SIZE_REG 8
%define SIZE_PORT 2
%define SIZE_IPV4_ADDR 4

; syscall numbers, linux x86_64
%define SYS_open 
%define SYS_read 0
%define SYS_write 1
%define SYS_open 2
%define SYS_close 3
%define SYS_sock 41
%define SYS_bind 49
%define SYS_listen 50
%define SYS_accept 43
%define SYS_exit 60

; return codes
%define RET_SUCC 0
%define RET_ERR 1

; file descriptors
%define FD_STDIN 0
%define FD_STDOUT 1
%define FD_STDERR 2

; ascii, conrol
%define ASCII_LF 0xA
%define ASCII_ZERO '0'
%define ASCII_NINE '9'

; cli arguments
%define CLI_ARGC 8
%define CLI_ARGV 24
%define CLI_MIN_ARGC 2
%define PORT_MIN 1
%define PORT_MAX 65535

; socket domain and type
%define SOCK_DOMAIN_AF_INET 2
%define SOCK_TYPE_STREAM 1
%define SOCK_PROTO_DEFAULT 0
%define SOCKADDR_LEN 16
%define SOCK_BACKLOG 5
%define SOCK_BIND_ADDR_ANY 0

%endif
