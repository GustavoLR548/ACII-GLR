.data
A: .word 0
.text

#Para o teste $t1 mostra se o numero eh positivo ou nao
# Numero positivo: t1 = 1     Numero negativo: t1 = 2    

main:
ori $t0,$zero,0x1001	# t0 = 1001
sll $t0,$t0,16		# t0 = 10010000
add $t1, $zero, $zero	# t1 = 0
lw $s0,0($t0)		# s0 = Valor da memoria de A

#Funcao modulo para numero positivo
modulo:
slt $t3, $s0, $t1 # t3 = if ( s0 < 0 )
bne $t3,$zero, negativo	# ir para a funcao "negativo" se "t3" nao for igual a zero
addi $t1, $t1, 1 # t1 = 1
sw $s0,0($t0) # Mem [ t0 ] = s0
j exit
#Funcao modulo para numero negativo
negativo:
sub $s1, $s0, $s0 # s1 = - A - ( - A ) = 0
sub $s0, $s1, $s0 # s0 = 0 - ( - A ) = A
addi $t1, $t1, 2 # t1 = 2
sw $s0,0($t0)	# Mem [ t0 ] = s0

exit:
