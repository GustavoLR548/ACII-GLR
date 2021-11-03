.data
	A: .space 48 # Declarando um array com 48 bits de espaço (ou seja, cabe 12 números inteiros)
	h: .word 0 # Declarando um inteiro chamado "h", com o valor inicial igual a 0
.text
	lw $s0,h # Carregando o valor de "h" em "s0"
	
	#Pegar a posicao "8" do array 
	add $t0,$zero,8 # t0 = 0 + 8
	sll $t0,$t0,2 # t0 *= 2^2
	
	lw $t1,A($t0) # Carregando o conteudo do array em "t0" para a variavel "t1"
	
	add $s1,$s0,$t1 # s1 = s0 + t1 |  h + A [8];
	
	#Pegar a posicao "12" de um array
	add $t0,$zero,12 # t0 = 0 + 12
	sll $t0,$t0,2 # t0 *= 2^2
	
	sw $s1,A($t0) # A[12] = h + A[8]
