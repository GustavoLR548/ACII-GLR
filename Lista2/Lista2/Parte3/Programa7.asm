.data
input1:		.word	0
input2:		.word	0
resultado:	.word	0
n:		.ascii "\n"

.text

	#Pegar o usuario o input da inteiro
	main:
	li $v0,5
	syscall
	move $a1, $v0 
	
	beqz $a1,terminarPrograma
	
	#Pegar o usuario o input da inteiro
	li $v0,5
	syscall
	move $a2, $v0 
	
	#Conferir se a potencia lida e igual a 0 e 1
	beq $a2, 1, fim	# Se a potencia for igual a 1, va para fim 
	beq $a2, 0, fim2# Se a potencia for igual a 0, va para fim 2 
	
	#ir para "potencia" e levar "a1" e "a2"
	jal potencia
	
	#imprimir o resultado de potencia na tela
	li $v0,1
	add $a0,$zero,$v1
	syscall
	
	#imprimir espacamento de tela
	li $v0,4
	la $a0,n
	syscall

	#chamar funcao pra terminar o programa
	j main

	potencia:
	
	add $s0,$zero,$a1		#Salvar uma copia de "a1" em "s0"
	add $t1,$zero,1			#Iniciar "t1" com o valor 1
	while:
		addi $t1,$t1,1		# t1 += 1
		mult $a1,$s0		# multiplique a1 com s0
		mflo $a1		# Pegue o valor de LO e armazene em a1
		bne $t1, $a2, while     # Volte ao loop, se t1 for diferente de a2
		
	add $v1 ,$zero,$a1		# Adicionar o resultado ao argumento de volta
	sw $v1,resultado		# Salvar o resultado encontrado em "resultado"
	jr $ra				# voltar para onde potencia foi chamado, com o resultado em "v1"

	#Fim do codigo se o numero esta sendo elevado a 1
	fim: 
	sw $a1,resultado
	
	#Imprima na tela o proprio numero
	li $v0,1
	add $a0,$zero,$a1
	syscall
	
	#imprimir espacamento de tela
	li $v0,4
	la $a0,n
	syscall
	
	#chamar funcao pra terminar o programa
	j main
	
	#Fim do programa se o numero esta sendo elevado a 0
	fim2:
	sw $0,resultado
	
	#Imprima na tela o proprio numero
	li $v0,1
	add $a0,$zero,1
	syscall
	
	#imprimir espacamento de tela
	li $v0,4
	la $a0,n
	syscall
	
	#chamar funcao pra terminar o programa
	j main
	
	#Funcao pra terminar o programa
	terminarPrograma:
	#Pedir ao programa para terminar
	li $v0,10
	syscall
