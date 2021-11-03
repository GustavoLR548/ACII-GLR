.data
	x: .word 2
.text
	ori $t0,$zero,0x1001	# t0 = 1000
	sll $t0,$t0,16		# to *= 2^16 |t0 = 10000000

	addi $t1,$zero,1	# t1 += 1 | t1 = count = 1
	addi $t5,$zero,1	# t5 += 1

	addi $t2, $zero,3 	# t2 = expoente1 = 3
	addi $t3, $zero,4	# t3 = expoente2 = 4
 
	lw $s0, 0($t0) 		# carregar o conteudo em "0(t0)" em "s0"
	lw $s1, 0($t0)		# carregar o conteudo em "0(t00" em "s1"

	slt $t4, $zero, $s0	#Se "s0" for menor que zero, t4 sera igual a 1 , se não , será igual a 0
	bne $t4, $zero, maior	#Se "t4" nao for igual a zero , va para maior

	menor:
	addi $t1,$t1,1		# t1 += 1
	mult $s1,$s0		# multiplique o valor de "s1" com "s0"
	mflo $s1		# pegue o valor de LO e coloque em "s1"
	bne $t1, $t3, menor 	# Se "t1" for menor que "t3", va para menor
	sub $s1, $s1, $t5	# s1 -= t5
	j fim			# va para fim

	maior:
	addi $t1,$t1,1		# ti += 1
	mult $s1,$s0		# Multiplique "s1" com "s0"
	mflo $s1		# Pegue o conteudo em LO para "s1"
	bne $t1, $t2, maior	# Se "t1" for menor que "t2" , va para maior
	addi $s1, $s1, 1	# s1 += 1

	fim:
	sw $s1,4($t0) #Salvando o valor de k na memoria
