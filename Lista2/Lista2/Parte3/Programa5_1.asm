.text

#Iniciando s2 com um endereçamento de memoria 
ori $s2 ,$zero, 0x1001
sll $s2, $s2,16

addi $s3, $s2, 396 		# s3 = s2 + 396

LOOP:
	lw $s1, 0($s2) 		# carregar o conteudo em "0($s2) para $s1
	addi $s1, $s1, 1	# s1 += 1
	sw $s1, 0 ($s2)	 	# salvando em "0($s2)" s1
	addi $s2, $s2, 4	# s2 += 4
	sub $s4, $s3, $s2	# s4 = s3 - s2
	nop			# Comando nulo
	nop			# Comando nulo
	bne $s4, $zero, LOOP	# ir para LOOP , se s4 for diferente de zero
