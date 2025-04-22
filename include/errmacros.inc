%macro DEFINE_ERR 2
  err_%1_msg db %2, ASCII_LF, NULL
  err_%1_len equ $ - err_%1_msg
%endmacro
