.data
  x: .word 3 #armazenando o valor de "x" no formato . x = 3
  y: .word 0 #armazenando o valor de "y" no formato . y = 0

.text

  lw $t0,x       # carregar o valor de "x" para "t0"
  add $t1,$t1,4  # t1 = 4
  
  div $t0,$t1    # 3 / 4 | Mandar o quociente e o restante para LO e HI
  
  mflo $t0	 # pegar o restante e armazenar em t0
  
  sw $t0,y	 # Armazenar t0 em y


