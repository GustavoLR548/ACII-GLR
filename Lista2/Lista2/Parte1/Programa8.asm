.data

	A:   .space 12 # Criando um array "A" com espaço de 12 bits ( ou seja, o array tem um espaço de 3 inteiros)
	h:   .word  0 # Criando um inteiro "h"
	k:   .word  0 # Criando um inteiro "k"
	i:   .word  0 # Criando um inteiro "i"

.text

	lw $t0,h # Carregar o conteudo em "h" para "t0"
	lw $s0,k # Carregar o conteudo em "k" para "s0"
	lw $s1,i # Carregar o conteudo em "i" para "i"
	
	lw $s2,A($s1) # Carregar o conteudo de "A($s1)" |   A [ i ] 
	
	add $t0,$s0,$s2 # t0 = s0 + s2 | h = k + A [ i ] 
