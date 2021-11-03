.data
  x: .word -1 #armazenando o valor de "x" no formato . x = -1
  y: .word 0 #armazenando o valor de "y" no formato . y = 0

.text
  lw $t0, x #carregar o valor de "x" para "f2"
  add $t1,$zero,32 # Armazenar 32 em t1
  
  div $t0,$t1	 # Dividir t0 por t1
  
  mflo $t0	 # pegar o restante e armazenar em t0
  
  sw $t0,y 	 # armazenar o valor de "t0" em "y"


