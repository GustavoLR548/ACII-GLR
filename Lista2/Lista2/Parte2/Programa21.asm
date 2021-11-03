.data
x: .word 10 		# Declarando "x" como 10
y: .word  3		# Declarando "y" como 3
.text

ori $t0,$zero,0x1001	# t0 = 1001
sll $t0,$t0,16		# t0 = 10010000

addi $t1,$t1,1		# t1 += 1

lw $s0, 0($t0) 		# Carregando o conteudo em "0(t0)" s0 = x = 10
lw $s2, 0($t0)		# Carregando o conteudo em "0(t0)" s2 = copia de x
lw $s1, 4($t0)		# Carregando o conteudo em "4(t0)" s1 = y = 3

beq $t1, $s1, fim	# va para fim ,se s1 for igual a t1 

potencia:
addi $t1,$t1,1		# t1 += 1
mult $s2,$s0		# multiplique s2 com s0
mflo $s2		# Pegue o valor de LO e armazene em s2
bne $t1, $s1, potencia  # Va para potencia , se t1 for diferente de s1

fim:
#Salvando o valor de k na memoria
sw $s2,8($t0) 
