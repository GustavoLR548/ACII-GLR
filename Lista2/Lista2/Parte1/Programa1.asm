.data
  a: .word 10 #armazenando o valor de "a". a = 10
  b: .word -1 #armazenando o valor de "b". b = -1
  c: .word 0 #armazenando o valor de "c". c = 0
.text
  lw $t1, a #carregar o valor de "a" para "t1"
  lw $t2, b #carregar o valor de "b" para "t2"
   
  add $t1,$t1,1 #t1 += 1
  add $t3,$t1,$t2 # t3 = t1 + t2
  
  sw $t3,c # salvando o valor de "t3" em "c"

