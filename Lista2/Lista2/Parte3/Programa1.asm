.data
	array:	.space 180  		 # Declaracao do array com 180 bits(espaco para 45 inteiros)
.text
	#Iniciando contadores
	
	addi $s0, $zero,0 		 # Auxiliar no fibonnaci
	addi $s1, $zero,1 		 # Primeiro termo da serie fibonnaci
	li $t0 , 0			 # Contador da posicao do array
	
	sw $s1, array($t0)		 # Salvando o primeiro termo da serie fibonnnaci no array
	
	while:
		beq $t0,184,exit 	 # Sair do loop , se t0 for igual a 184
		
		add $s2,$s1,$s0		 # soma dos termos 
		add $s1,$zero,$s0	 # Auxiliar agora com o valor do primeiro termo
		add $s0,$zero,$s2	 # salvando o valor da soma fibonnaci
		sw $s2,array($t0)	 # salvando a soma no array
		
		add $t0,$t0,4		 # aumentando o contador
		j while			 # voltando ao while
	exit:
