.data
x: .word 10		# Declarando "x" como 10
y: .word 15		# Declarando "y" como 15
k: .word -1		# Declarando "k" como -1
.text 

ori $t0,$zero,0x1001	# t0 = 1000
sll $t0,$t0,16		# t0 = 10000000

lw $s0, 0($t0) 		# s0 = x = 10
lw $s1, 4($t0)		# s1 = y = 15

mult $s0,$s1		# Multiplicar o conteudo em s0 com s1
mflo $s2		# Carregar o conteudo em LO em s2

#Salvando o valor de k na mémoria
sw $s2,8($t0) 
