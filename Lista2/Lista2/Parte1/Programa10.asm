.data
	A:   .space 12 # Declarando um array com 12 bits de espaço (ou seja, cabe 3 números inteiros)
	h:   .word  0 # Declarando um inteiro "h"
	i:   .word  0 # Declarando um inteiro "i"
.text

	# Carregando o conteudo de "h" e "i"
	lw $t0,h # Carregando o conteúdo em "h" para "t0"
	lw $s0,i # Carregando o conteúdo em "i" para "s1"

	# h = A[i]
	lw $t0,A($s0) # h = A($s0) | h = A[i]
	
	#A[i] = A[i+1]
	add $t1,$s0,1 # t1 = s0 + 1 | t1 = i + 1
	lw $s1,A($t1) # s1 = A[t1] | s1 = A[i+1]
	sw $s1,A($s0) # A[s0] = s1 | A[i] = A[i+1]
	
	#A[i+1] = h
	sw $t0,A($t1) # A [i+1] = h
