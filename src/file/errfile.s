%include "const.inc"
%include "errmacros.inc"
%include "errmsg.inc"

global err_file_open
global err_file_read
global err_file_write
global err_file_write_str
global err_file_close

section .data
  DEFINE_ERR file_open, ERR_FILE_OPEN_MSG
  DEFINE_ERR file_read, ERR_FILE_READ_MSG
  DEFINE_ERR file_write, ERR_FILE_WRITE_MSG
  DEFINE_ERR file_write_str, ERR_FILE_WRITE_STR_MSG
  DEFINE_ERR file_close, ERR_FILE_CLOSE_MSG

section .text
  
err_file_open:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  ret

err_file_read:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  mov rsi, err_file_read_msg
  mov rdx, err_file_read_len
  syscall
  mov rax, RET_ERR
  ret

err_file_write:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  mov rsi, err_file_write_msg
  mov rdx, err_file_write_len
  syscall
  mov rax, RET_ERR
  ret

err_file_write_str:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  mov rsi, err_file_write_str_msg
  mov rdx, err_file_write_str_len
  syscall
  mov rax, RET_ERR
  ret

err_file_close:
  mov rax, SYS_write
  mov rdi, FD_STDOUT
  mov rsi, err_file_close_msg
  mov rdx, err_file_close_len
  syscall
  mov rax, RET_ERR
  ret
