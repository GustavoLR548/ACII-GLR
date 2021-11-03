.data
  aux: .word 157109 # aramzenando o valor 157109 em "aux" | Estou fazendo isso pois este é um número primo
  x: .word 0 #armazenando o valor de "x".

# 305419896 = 1944 x 157109
.text
  lw $t0, aux #carregar o valor de "x" para "t0"
  add $s0,$zero,1944 # s0 = 0 + 1944
  mul $s0,$s0,$t0 # s0 *= t0 | 1944 x 157109
  sw $s0,x # salvando o valor de "t0" em x


