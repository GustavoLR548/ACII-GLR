.data
  j: .word 0 #armazenando o valor de "j". j = 0
  i: .word 10 #armazenando o valor de "i". i = 10

.text
  lw $t0, j #carregar o valor de "j" para "t0"
  lw $t1, i #carregar o valor de "i" para "t1"
  while: #começo do loop while
  	beq $t0,$t1, exit # fazer o loop até "t0" não for igual a "t1"
  	add $t0,$t0,1 # t0 += 1 | j = j + 1
  	j while # ir para "while"  
  exit: # saida
  

