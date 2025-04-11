; src/cli/strlen.s
global utils_strlen

section .text

; counts chars of an string
utils_strlen:
  xor rcx, rcx

.loop:
  cmp byte [rdi +rcx], 0
  je .end_loop
  inc rcx
  jmp .loop

.end_loop:
  ret
