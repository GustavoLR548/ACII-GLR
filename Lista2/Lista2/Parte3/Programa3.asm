.data
#Declarando os três inteiros do programa, para que o mesmo descubra qual e a mediana
A: .word 23		
B: .word 98
C: .word 17
.text

#Reservendo os primeiros espacos de memoria 
ori $t0,$zero,0x1001	
sll $t0,$t0,16		

lw $s0,0($t0)		# Carregar o conteudo em 0(t0) | s0 = Valor da memoria de A
lw $s1,4($t0)	        # Carregar o conteudo em 4(t0) | s1 = Valor da memoria de B
lw $s2,8($t0)		# Carregar o conteudo em 8(t0) | s1 = Valor da memoria de C

#Funcao para achar o valor da Mediana
AcharMediana:
ble $s1,$s0,verificarS1 	#Se S1 for menor que S0, va para verificarS1 
bge $s0,$s2,setMedianaS0	#Se S0 for maior que S2, sabendo que este e menor que S1, S0 e a mediana entao, va para setMedianaS0
j setMedianaS2			#Se não, va para setMedianaS2

#Verificando se S1 e a mediana ou nao
verificarS1:
bge $s1,$s2,setMedianaS1	# Se S1 for maior que S2, configure S1 como a mediana em setMedianaS1
ble $s2,$s0 setMedianaS2			# Se não, a Mediana e S2, va para setMedianaS2
j setMedianaS1

#Configurar S0 como a mediana
setMedianaS0:
add $a0,$zero,$s0		#Adicionando a mediana como argumento a ser imprimido
j exit

#Configurar S1 como a mediana
setMedianaS1:
add $a0,$zero,$s1		#Adicionando a mediana como argumento a ser imprimido
j exit

#Configurar S2 como a mediana
setMedianaS2:
add $a0,$zero,$s2		#Adicionando a mediana como argumento a ser imprimido
j exit

#Saida do programa
exit:

#Imprimindo a mediana
li $v0, 1
syscall
