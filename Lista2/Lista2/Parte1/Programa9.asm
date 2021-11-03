.data
	A:   .space 12 # Declarando um array com 12 bits de espa�o (ou seja, cabe 3 n�meros inteiros)
	h:   .word  0 # Declarando um inteiro "h"
	j:   .word  0 # Declarando um inteiro "j"
	i:   .word  0 # Declarando um inteiro "i"
.text

	lw $t0,h # Carregando o conte�do em "h" para "t0"
	lw $s0,j # Carregando o conte�do em "j" para "s0"
	lw $s1,i # Carregando o conte�do em "i" para "s1"
	
	lw $s2,A($s1) # Carregando o conteudo em "A($s1)" para a variavel "s2"
	add $t0,$t0,$s2 # t0 = t0 + s2 | h + A [ i ] 
	
	sw $t0,A($s0) # Salvando o conteudo de "t0" no endere�o "A($s0)" |  A [ j ] = h + A [ i ]
