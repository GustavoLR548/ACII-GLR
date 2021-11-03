.data
x: .word 121		# Iniciando com alguma palavra


.text

#Pegando a primeira posicao da memoria 
ori $t0,$zero,0x1001	
sll $t0,$t0,16		

lw $s0,0($t0)		# Carregando o conteudo da primeira posicao da memoria

sub $s1,$zero,2		# Configurando para que s1 seja a "flag" do meu programa 

#Verificando se o conteudo em s0 e menor ou igual a 100 e maior ou igual a 50
sle $s1,$s0,100		
sge $s2,$s0,50
seq $s1,$s1,$s2
beq $s1,1,exit

#Verificando se o conteudo em s0 e menor ou igual a 200 e maior ou igual a 150
sle $s1,$s0,200
sge $s2,$s0,150
seq $s1,$s1,$s2
beq $s1,1,exit

#Saida do programa
exit:

#Imprimindo o valor da flag
li $v0, 1
add $a0,$zero,$s1
syscall
