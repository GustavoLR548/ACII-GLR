.data
	x: .word 3
.text

	main:
	ori $t0,$zero,0x1001	# t0 = 1001
	sll $t0,$t0,16		# t0 *= 2^16 | t0 = 10010000

	addi $t1,$zero,1	# t1 = 0 + 1 |t1 = count = 1

	addi $t2, $zero,2 	# t2 = 0 + 2 | t2 = expoente1 = 2
	addi $t3, $zero,3	# t3 = 0 + 3 | t3 = expoente2 = 3
	addi $t4, $zero,4	# t4 = 0 + 4 | t4 = expoente3 = 4
	addi $t5, $zero,5	# t5 = 0 + 5 | t5 = expoente4 = 5
 
	lw $s0, 0($t0) 		# Carregar o conteudo em 0 para s0 | s0 = x = 10
	lw $s1, 0($t0)		# Carregar o conteudo em 0 para s1 | s1 = x = 10
	lw $s2, 0($t0)		# Carregar o conteudo em 0 para s2 | s2 = x = 10
	lw $s3, 0($t0)		# Carregar o conteudo em 0 para s3 | s3 = x = 10

	div $s0,$t2             # Dividir s0 por t2 
	mfhi $t6                # Mover o conteudo do HI para t6
	bne $t6, $zero, impar   # Ir para "impar" se t6 for igual a 0

	par:                    # funcao "par"
	addi $t1,$t1,1		# t1 += 1
	mult $s1,$s0		# Multiplicar s1 por s0 
	mflo $s1		# Mover o conteudo de LO para s1 | s2 = k = (x  y)
	bne $t1, $t4, par	# Ir para "par" se t1 for igual a t4

	addi $t1,$zero,1	# t1 += 1

	par2:
	addi $t1,$t1,1		# t1 += 1
	mult $s2,$s0		# Multiplicar s2 por s0 
	mflo $s2		# Mover o conteudo de LO para s2
	bne $t1, $t3, par2	# Ir para "par2" se t1 for igual a t3

	addi $t1,$zero,1	# t1 += 1

	par3:
	addi $t1,$t1,1		# t1 += 1
	mult $s3,$s0		# Multiplicar s3 por s0 |
	mflo $s3		# Mover o conteudo de LO para s3
	sll $s3, $s3, 1		# s3 *= 2^1 
	add $s1,$s1,$s2		# s1 += s2
	sub $s1,$s1,$s3		# s1 += s3
	j fim			# ir para "fim"

	impar:
	addi $t1,$t1,1		# t1 += 1
	mult $s1,$s0		# (s1 * s0)
	mflo $s1			
	bne $t1, $t5, impar

	addi $t1,$zero,1	# t1 = 1

	impar2:
	addi $t1,$t1,1		# t1 = t1 + 1
	mult $s2,$s0		# Multiplicar s1 por s0 
	mflo $s2		# Mover o conteudo de LO para s2	
	bne $t1, $t3, impar2	# Ir para "impar2" se t1 for igual a t3
	sub $s1,$s1,$s2		# s1 -= s2
	addi $s1, $s1, 1	# s1 += 1

	fim:
	sw $s1,4($t0) #Salvando o valor de k na memoria
