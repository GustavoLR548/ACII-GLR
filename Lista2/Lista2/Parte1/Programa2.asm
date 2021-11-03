.data
  x: .word 3 #armazenando o valor de "x". x = 3
  y: .word 0 #armazenando o valor de "y". y = 0

.text
  lw $t1, x #carregar o valor de "x" para "t1"
  
  sll $t1,$t1,2 #t1 *= 2^2
  sw $t1, y #armazenando o valor de "t1" em "y"

