.data
	endereco: .word 0x10010020 	#Endereco de memoria 
	tam: .word 3          		#Quantidade de elementos
.text
main:
	addi $t0, $zero, 30 		#Criando variavel para armazenar o numero limite de elementos
	
	lw $a0, endereco			#Carregando da memoria o endereco 
	lw $a1, tam			#Carregando da memoria o tamanho do array
	
verificar:
	bgt $a1, $t0, maiorDoQue30 	#Se o tamanho do array for maior do que 30, va para maiorDoQue30
dentro:
	add $s0, $zero, $a0 		#s0 = Endereco de memoria
	add $t0, $zero, $a1 		#t0 = quantidade de elementos
	sll $t0, $t0, 2     		#t0*= 2^2
	add $s1, $t0, $s0   		#s1 = array[Quantidade-1]
	j somar				#ir para somar
maiorDoQue30:
	add $s0, $zero, $a0		#s0 = Endereco de memoria
	addi $t0, $zero, 30 		#t0 = 0 + 30
	sll $t0, $t0, 2     		#t0*= 2^2
	add $s1, $t0, $s0   		#s1 = array[29]
	j somar

somar:
	addi $t0, $zero, 0		#resetar t0
	
parOuImpar:
	andi $t1, $t0, 1			#Decidi se t1 for par ou impar
	beqz $t1, par			#Se t1 for par
	j impar				#Caso contrario
ret:
	addi $t0, $t0, 1			#t0++
	sll $t6, $t0, 2			#t6 = t0 * 2^2
	add $t6, $s0, $t6			#t6 = s0 + t6
	bne $t6, $s1, parOuImpar		#Va para parOuImpar, se t6 for diferente de s1
	j fim				#Ir para fim
impar:	
	add $t2, $zero, $t0		# t2 = t0
	mult $t2, $t2			# t2 * t2 -> vai para LO e HI
	mflo $t2 			# pegar o conteudo em LO e passar para t2
	sll $t5, $t0, 2			# t5 = t0 * 2^2 
	add $t5, $s0, $t5			# t5 = s0 + t5
	sw $t2, ($t5)			# Salvar t2 na posicao de memoria de t5
	j ret				# ir para ret
	
par:
	addi $t2, $zero, 1		# t2 = 1
	addi $t3, $zero, 2		# t3 = 2
	mult $t3, $t0			# t3 * t0 -> vai para LO e HI
	mflo $t3			# armazene o conteudo de LO em t3
	mult $t0, $t0			# t0 * t0 -> vai para LO e HI
	mflo $t4			# armazene o conteudo de LO em t4
	sll $t4, $t4, 1			# t4 *= 2^1
	add $t2, $t2, $t3			# t2 += t3
	add $t2, $t2, $t4			# t2 += t4
	sll $t5, $t0, 2			# t5 = t0 * 2^2
	add $t5, $s0, $t5			# t5 += s0
	sw $t2, ($t5)			# salvar t2 na posicao de memoria em t5
	j ret				# ir para ret
	
	
retornar:
	add $t0, $zero, $a0  		#t0 = a0
	mult $t0, $t0       		#t0 * t0 -> vai para LO e HI
	mflo $t0,           		#armazena o conteudo de LO em t0
	addu $v0, $zero, $t0 		#v0 = t0
	jr $ra             		#retornar 
fim:
	li $v0, 10
	syscall
