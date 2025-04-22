%include "const.inc"
%include "errmacros.inc"
%include "errmsg.inc"

global file_open
global file_read
global file_write
global file_close
extern err_file_open
extern err_file_read
extern err_file_write
extern err_file_write_str
extern err_file_close
extern utils_strlen

section .data
section .text

; rdi <- fd
; rsi <- buffer
; rdx <- buffer size
; rax -> 0 on success, -1 on error
file_open:
  mov rax, SYS_open
  syscall
  test rax, rax
  jnz err_file_open
  ret

; rdi <- fd
; rsi <- buffer
; rdx <- buffer size
; rax -> 0 on success, -1 on error
file_read:  
  mov rax, SYS_read
  syscall
  test rax, rax
  jnz err_file_read
  ret

; rdi <- fd
; rsi <- buffer
; rdx <- buffer size
; rax -> 0 on success, -1 on error
file_write:
  mov rax, SYS_write
  syscall
  test rax, rax
  jnz err_file_write 
  ret

; rdi <- fd
; rsi <- buffer
; rax -> 0 on success, -1 on error
file_write_str:
  mov rdi, rsi
  call utils_strlen
  mov rdx, rax
  mov rax, SYS_write
  syscall
  test rax, rax
  jnz err_file_write_str
  ret

; rdi <- fd
; rsi <- buffer
; rdx <- buffer size
; rax -> 0 on success, -1 on error
file_close:
  mov rax, SYS_close
  syscall
  test rax, rax
  jnz err_file_close
  ret

