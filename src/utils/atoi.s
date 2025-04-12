; src/utils/atoi.s
; note: requires overflow management
global utils_atoi

section .text
  extern err_nan

; converts ASCII string to equivalent unsigned integer
utils_atoi:
  ; stores string address
  xor rax, rax
  xor rcx, rcx

.loop:
  ; load character at a given index
  movzx rbx, byte [rdi + rcx]
  cmp rbx, 0
  je .return

  ; bound checking
  cmp rbx, '0'
  jb err_nan
  cmp rbx, '9'
  ja err_nan

; result = (res*8 + res*2) + d 
  sub rbx, '0'
  mov rdx, rax
  shl rax, 3
  lea rax, [rax + rdx*2]
  add rax, rbx

  inc rcx
  jmp .loop

.return:
  ret
