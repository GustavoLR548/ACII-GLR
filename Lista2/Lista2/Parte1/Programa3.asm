.data 
  x: .word 3 #armazenando o valor de "x". x = 3
  y: .word 0 #armazenando o valor de "y". y = 0

.text
  lw $t1, x #carregar o valor de "x" para "t1"
  
  mul $t1,$t1,1025 #t1 *= 1025
  sw $t1, y #armazenando o valor de "t1" em "y"

