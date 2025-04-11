; src/utils/itoa.s
global utils_itoa

section .text
  extern err_nan

; converts unsigned 64-bit integer to equivalent ASCII
utils_itoa:
  ; reserves 32 bytes of stack memory
  push rbp
  mov rbp, rsp
  sub rsp, 32

  ; write null char in the buffer last byte
  mov rbx, rdi
  lea rsi, [rsp + 31]
  mov BYTE [rsi], 0
  dec rsi

  ; if it is just zero
  cmp rbx, 0
  jne .loop
  mov BYTE [rsi], '0'
  jmp .end_loop

.loop:
  ; extract digit
  xor rdx, rdx
  mov rax, rbx
  mov rcx, 10
  div rcx

  ; converts digit to equivalent ASCII code number
  add rdx, '0'
  cmp dl, '9'
  jg err_nan
  mov BYTE [rsi], dl
  dec rsi

  ; next digit
  mov rbx, rax
  cmp rax, 0
  je .end_loop
  jmp .loop

.end_loop:
  mov rax, rsi
  inc rax
  mov rsp, rbp
  pop rbp
  ret
