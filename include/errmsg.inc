%ifndef ERRMSG_INC
%define ERRMSG_INC

%define ERR_NO_ARG_MSG "Err: Port number required."
%define ERR_NAN_MSG "Err: Invalid input, it's not a number."
%define ERR_INV_PORT_MSG "Err: Invalid port number."
%define ERR_INV_IPV4_ADDR_MSG "Err: Invalid Ipv4 address."

%define ERR_SOCK_INIT_MSG "Err: Cannot initialize AF_INET socket."
%define ERR_SOCK_BIND_MSG "Err: Cannot bind socket's address."
%define ERR_SOCK_LISTEN_MSG "Err: Cannot make socket to listen."
%define ERR_SOCK_ACCEPT_MSG "Err: Cannot make socket to accept connection."
%define ERR_SOCK_WRITE_MSG "Err: Cannot write in socket."
%define ERR_SOCK_CLOSE_MSG "Err: Cannot close socket."

%define ERR_FILE_OPEN_MSG "Err: Cannot open file."
%define ERR_FILE_READ_MSG "Err: Cannot read file."
%define ERR_FILE_WRITE_MSG "Err: Cannot write in file."
%define ERR_FILE_WRITE_STR_MSG "Err: Cannot write string in file."
%define ERR_FILE_CLOSE_MSG "Err: Cannot close file."

%endif
