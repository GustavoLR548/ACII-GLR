.data
x: .word 1600000
y: .word 80000
z: .word 400000

.text

ori $t0,$zero,0x1001	# t0 = 1001
sll $t0,$t0,16		# t0 *= 2^16 | t0 = 10010000

add $t1,$zero,10
add $s3,$zero,1

lw $s0,0($t0)		# Carregar o conteudo em 0(t0) | s0 = Valor da memoria de x
lw $s1,4($t0)		# Carregar o conteudo em 4(t0) | s1 = Valor da memoria de y
lw $s2,8($t0)		# Carregar o conteudo em 8(t0) | s2 = Valor da memoria de z

#As funcoes a seguir servem para guardar a quantidade de zeros para multiplicar no final

#Quantidade de Zeros em S0
divS0:
div $s0,$t1 # Dividir S0 por 10
mfhi $t2    # Pegar o restante da divisao em HI
beq $t2,0,addZeroS0 # Se o restante da divisao for 0, adicione um zero ao contador
j divS1 # Se nao, va para calcular a quantidade de zeros em S1

#Quantidade de Zeros em S1
divS1:
div $s1,$t1 # Dividir S1 por 10
mfhi $t2    # Pegar o restante da divisao em HI
beq $t2,0,addZeroS1 # Se o restante da divisao for 0, adicione um zero ao contador
j divS2 # Se nao, va para calcular a quantidade de zeros em S2

#Quantidade de Zeros em S2
divS2: 
div $s2,$t1 # Dividir s2 por 10
mfhi $t2    # Pegar o restante da divisao em HI
beq $t2,0,subZeroS2 # Se o restante da divisao for 0, diminua um zero ao contador(ja que s2 sera dividido na operacao)
j calcular # Se nao, va para calcular a quantidade de zeros em s2

#Funcao para adicionar 0 ao contador de S0
addZeroS0:
mflo $s0       #Pegar o quociente em LO 
mul $s3,$s3,10 #s3 *= 10
j divS0

#Funcao para adicionar 0 ao contador em S1
addZeroS1:
mflo $s1       #Pegar o quociente em LO 
mul $s3,$s3,10 #s3 *= 10
j divS1

#Funcao para remover 0 ao contador em S2
subZeroS2:
mflo $s2       #Pegar o quociente em LO 
div $s3,$s3,10 #s3 *= 10
j divS2

#Depois de todos os zeros contabilizados, hora de calcular
calcular: 
mul $s0,$s0,$s1  # x * y
div $s0,$s0,$s2  # (x * y) / z
mul $s0,$s0,$s3  # adicionar os zeros # Respotas em s0


