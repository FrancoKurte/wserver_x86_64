; include/const.inc
%ifndef CONST_INC
%define CONST_INC

; stack frame sizes
%define CLI_SFS 32
%define ITOA_SFS 32
%define SRV_SFS 32

; syscalls
%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_CLOSE 3
%define SYS_SOCK 41
%define SYS_SOCK_BIND 49
%define SYS_SOCK_LISTEN 50
%define SYS_SOCK_ACCEPT 43
%define SYS_EXIT 60

; numberic codes
%define SUCC_CODE 0
%define ERR_CODE 1

; file descriptors
%define FD_STDOUT 1

; printing
%define NULL 0
%define LINE_FEED 0xA

; cli 
%define ARGC 8
%define ARGV 24
%define MIN_ARGC 2
%define MIN_VALID_PORT 1
%define MAX_VALID_PORT 65535

; utils

; srv

; socket
%define AF_INET 2
%define SOCK_STREAM 1
%define SOCK_DEFAULT_PROTO 0
%define INADDR_ANY 0
%define SOCKADDR_LEN 16
%define BACKLOG 5

%endif
