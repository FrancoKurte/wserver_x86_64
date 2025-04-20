global utils_swape

section .data
section .text

utils_swape:
  ; swap endianness of a 16 bits number
  ; e.g. a port number
  xchg al, ah
  movzx rax, ax

  jmp .exit

.exit:
  ret
