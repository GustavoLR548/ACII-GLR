.data
	text1: .asciiz "Qual a temp. em Fahrenheit?\n" # Texto para perguntar o usuario a temperatura em Fahrenheit
	text2: .asciiz "A temp. em Celsius e:\n"       # Texto para sair depois do calculo
	ponto: .asciiz "."			       # String para ter o "."
.text

	#Armazenar em t1 
	add $t1,$zero,10

	# Imprimir o conteudo de text1
	li $v0,4
	la $a0,text1
	syscall
	
	#Pegar o usuario o input da inteiro
	li $v0,5
	syscall
	move $t0, $v0 
	
	#Fazer o calculo da conversao de fahrenheit para celsius
	sub $t0,$t0,32	# t0 -= 32
	mul $t0,$t0,50  # t0 *= 50
	div $t0,$t0,9	# t0 /= 9
	
	div $t0,$t1    # Separar o numero inteiro do decimal em LO e HI
	
	mflo $t1       # Guardar o inteiro em t1
	mfhi $t0       # Guardar o numero depois da virgula em t0
	
	#Imprimir text2 
	li $v0,4	
	la $a0,text2
	syscall
	
	#Imprimir o numero inteiro 
	li $v0, 1
	add $a0,$zero,$t1
	syscall
	
	#Imprimir o ponto
	li $v0,4
	la $a0,ponto
	syscall
	
	#Imprimir o valor depois da virgula
	li $v0, 1
	add $a0,$zero,$t0
	syscall
