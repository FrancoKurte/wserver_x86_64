; note: div is slow, replace by invariant multiplication
global utils_itoa

section .text

; converts unsigned 64-bit integer n (in rdi) to ASCII string in buffer buf (rsi).
; sz (rdx) is the size of the buffer buf.
; returns pointer to the beginning of the written string in buf (in rax),
utils_itoa:
  ; callee-saved registers
  push rbx
  push r12

  ; minimum buffer size is 2, for '0' and '\0'
  mov rbx, rdi
  cmp rdx, 2
  jl .return_null

  ; setup buffer pointer p (r12) starting at the end
  lea r12, [rsi + rdx - 1]
  mov byte [r12], 0
  dec r12

  ; handle n == 0 separately
  test rbx, rbx
  jnz .loop
  mov byte [r12], '0'
  mov rax, r12
  jmp .return

; core conversion loop
.loop:
  ; check for buffer overflow *before* writing next digit
  cmp r12, rsi
  jl .return_null

  ; extract last digit (n % 10) and quotient (n / 10)
  xor rdx, rdx
  mov rax, rbx
  mov rcx, 10
  div rcx

  ; convert remainder to ASCII, then store it
  add dl, '0'
  mov byte [r12], dl

  ; update n for next iteration
  dec r12
  mov rbx, rax

  ; check if quotient is zero
  test rbx, rbx
  jnz .loop

  inc r12
  mov rax, r12
  jmp .return

.return_null:
  xor rax, rax

.return:
  pop r12
  pop rbx
  ret
