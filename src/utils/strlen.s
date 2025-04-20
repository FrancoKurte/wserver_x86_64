; src/cli/strlen.s
%include "const.inc"

; note: can be improved by using SIMD
; note: problems with not null terminated strings
global utils_strlen

section .text

; counts chars of an string
utils_strlen:
  xor rax, rax

.loop:
  cmp byte [rdi + rax], NULL
  je .return
  inc rax
  jmp .loop

.return:
  ret
