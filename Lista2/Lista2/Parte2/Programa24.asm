.data
	text: .ascii "A soma dos elementos é:\n" # Texto para imprimir a soma de todos os elementos

.text

	#Funcao para configurar o array
	startArray:
	ori $s0,$zero,0x1001
	sll $s0,$s0,16
	add $s0,$s0,28
	
	#Ler o numero inteiro que sera o tamanho do array
	li $v0, 5
 	syscall
 	move $t0, $v0 
 	
 	#Como e preciso declarar a quantidade de bits , multiplicamos o valor do usuario por 4
 	sll $t0,$t0,2
 	sub $t0,$t0,4
 	
 	add $t1, $zero,0 # Iniciando o contador para armazenar a posicao do array
 	add $t2, $zero,1 # Iniciando o contador2 que sera os numeros adicionados ao array
 	
 	#Iniciando a insercao dos elementos no array
 	while:	
 		bgt $t1,$t0, exit # Sair do loop se t1 for maior que t0
 		sw $t2,0($s0) # salvar o conteudo de t2 na posicao t1 do array
 		add $t3,$t3,$t2   # t3 += t2
 		add $s0,$s0,4
 		add $t2,$t2,2	  # t2 += 2
 		add $t1,$t1,4	  # t1 += 4
 		j while		  # ir para "while"
 	
 	exit:
 	
 	#Printar na tela o conteudo em text
 	li $v0, 4
 	la $a0 ,text
 	syscall
 	
 	#Printar na tela a soma dos elementos do array
 	li $v0, 1
 	add $a0, $zero,$t3
 	syscall
 	
