.data
	text1: .asciiz "O menor numero é: \n"
	menor: .word 0
	text2: .ascii "O maior numero é: \n"
	maior: .word 0
	n: .ascii "\n"
.text
	
	#Leitura dos tres numeros
 	li $v0, 5 
 	syscall
 	move $t0, $v0
 	
 	li $v0, 5
 	syscall
 	move $t1, $v0
 	
 	li $v0, 5
 	syscall
 	move $t2, $v0
 	
 	#Inicio da funcao para achar o menor
 	acharMenor:
 	
 	#Imprimindo espacamento de linha
 	li $v0, 4
 	la $a0 ,n
 	syscall
 	
 	blt $t0,$t1, compareMenorT0 #ir para compareMenorT0 se T0 for menor que T1
 	blt $t2,$t1, setMenorT2	    #ir para setMenorT2, se T2 for menor que T1
 	j setMenorT1		    #Se os ultimos dois testes derem errado, entao T1 e o menor numero
 	
 	compareMenorT0:
 		blt $t0,$t2, setMenorT0 # Se t0 for menor do que t2 ir para setMenorT0
 		blt $t2,$t1, setMenorT2 # Se t2 for menor do que t1 ir para setMenorT2
 		
 	# Funcao para configurar t0 como o menor valor	
 	setMenorT0: 
 		sw $t0, menor	# salvando o menor valor em "menor"
 		j imprimirMenor # imprimir o menor elemento
 		
 	# Funcao para configurar t1 como o menor valor	
 	setMenorT1:
 		sw $t1,menor	# salvando o menor valor em "menor"
 		j imprimirMenor # imprimir o menor elemento
 		
 	# Funcao para configurar t2 como o menor valor	
 	setMenorT2:
 		sw $t2,menor	# salvando o menor valor em "menor"
 		j imprimirMenor # imprimir o menor elemento
 		
 	imprimirMenor:
 	
 		#Imprimindo text1 na tela
                li $v0, 4
 		la $a0 ,text1
 		syscall
 		
 		#Imprimindo na tela o menor numero
 		li $v0, 1
 		lw $a0, menor
 		syscall
 		
 		j acharMaior #Ir para funcao para achar o menor elemento
 	
 	acharMaior:
 	
 	#Imprimindo o espacamento de tela
 	li $v0, 4
 	la $a0 ,n
 	syscall
 	
 	bgt $t0,$t1, compareMaiorTO 	#ir para compareMaiorT0, se t0 for maior que t1
 	bgt $t2,$t1, setMaiorT2		#ir para setMaiorT2, se t2 for maior que t1
 	j setMaiorT1			#ultimo caso, T1 e o maior elemento
 	
 	compareMaiorTO:
 	 	bgt $t0,$t2, setMaiorT0	#se t0 for maior que T2, va para setMaiorT0
 		bgt $t2,$t1, setMaiorT2 #se t2 for maior que t1, va para setMaiorT2
 	
 	# Funcao para configurar t0 como o maior valor	
  	setMaiorT0:
 		sw $t0, maior		# salvando o maior valor em "maior"
 		j imprimirMaior		# imprimir o maior elemento
 	
 	# Funcao para configurar t1 como o menor valor	
 	setMaiorT1:
 		sw $t1,maior		# salvando o maior valor em "maior"
 		j imprimirMaior		# imprimir o maior elemento
 		
 	# Funcao para configurar t2 como o menor valor	
 	setMaiorT2:
 		sw $t2,maior		# salvando o maior valor em "maior"
 		j imprimirMaior		# imprimir o maior elemento
 	
 	 imprimirMaior:
 	 
 	 	#Imprimindo text2 na tela
                li $v0, 4
 		la $a0 ,text2
 		syscall
 		
 		#Imprimindo na tela o maior numero
 		li $v0, 1
 		lw $a0, maior
 		syscall
 		
 	#FIM DO PROGRAMA
