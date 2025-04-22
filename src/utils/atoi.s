; src/utils/atoi_less_regs.s
%include "const.inc"
global utils_atoi

section .text
extern err_nan

; converts ASCII string to equivalent unsigned integer
; rdi <- address of the null terminated string
; rax -> converted unsigned integer
utils_atoi:
  push rbp
  mov rbp, rsp

  xor rax, rax

.loop:
  movzx rbx, byte [rdi]
  cmp rbx, NULL
  je .return

  cmp rbx, ASCII_ZERO
  jb .error
  cmp rbx, ASCII_NINE
  ja .error

  sub rbx, ASCII_ZERO
  imul rax, rax, 10
  add rax, rbx

  inc rdi
  jmp .loop

.error:
  mov rsp, rbp
  pop rbp
  jmp err_nan

.return:
  leave
  ret
