.text

	ori $t0,$zero,0x1001	# t0 = 1001 | t0 eh o vetor
	sll $t0,$t0,16		# t0 = 10010000

	add $s0, $zero, $zero	# Configurando s0 ; s0 = soma
	add $t1,$s0, $zero	# t1 = s0 + 0 | primeira pos = 0
	addi $t2,$zero,100	# t2 = 0 + 100 | ultima pos = 100

vetor:
	sll $t3, $t1, 1		# t3 = t1 * 2^1
	addi $t3, $t3, 1	# t3 += 1
	sw $t3,0($t0)		# salvar "t3" no endereco 0 em t0
	add $s0, $s0, $t3	# s0 += t3      | Acumulador da soma de todos os elementos do vetor

conserta:
	addi $t0, $t0, 4 	# t0 += 4
	add $t1, $t1, 1		# t1 += 1
	bne $t1, $t2, vetor 	# ir para "vetor" se "t1" for diferente de "t2"

 
