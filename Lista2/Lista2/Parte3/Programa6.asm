.data

.text
	main:
		#Configurando uma posicao de memoria
		ori $a1, $zero, 0x1001
		sll $a1, $a1,16   #a1 , o primeiro argumento, a posicao de memoria 
		
		#Configurando o tamanho do array
		add $a2, $zero, 30 # a2, o segundo argumento, o tamanho do array
		
		#Chamando a funcao IniciarVetor
		jal iniciarVetor
		
		#Imprimindo na tela a soma dos elementos do vetor
		li $v0,1
		add $a0,$zero,$v1
		syscall
		
		#Chamada de sistema para encerrar o programa
		li $v0,10
		syscall
		
	iniciarVetor:
		
		#Configurando um vetor "a1" de tamanho "a2"
		add $s3,$zero,$a2
		sll $a2, $zero,2 
		
		#iniciando os contadores
		li $t0, 0
		li $s4, 0
		#iniciando variavel para verificar se o numero eh par ou impar
		li $s0,2
		
		configurarVetor:
			
			#Verificando se a posicao atual no vetor e par ou impar
			div $t0,$s0
			mfhi $s1
			
			beq $s1,0,opPar # Se for par 
			beq $s1,1,opImpar # Se for Impar
			
			saida:
			sw $s2,0($a1)			# Salvando a operacao feita em "opPar" ou "opImpar" na posicao atual do array
			add $s4,$s4,$s2			# Adicionando o resultado da operacao no acumulador
			add $a1,$a1,4			# Movendo a posicao no array
			add $t0,$t0,1			# Aumentando o contador
			bne $t0,$s3,configurarVetor	# Comando para sair do loop ConfigurarVetor	
			
	configurarVetor2:
	
		#Adicionando o acumulador ao registrador de retorno
		add $v1,$zero,$s4
		jr $ra
		
	opPar:
		#v[i] = 2i - i
		mul $s2,$t0,2
		sub $s2,$s2,1
		j saida
	
	opImpar:
		#v[i] = i
		add $s2,$zero,$t0
		j saida
		
		
