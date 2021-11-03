.data
x: .word 4
y: .word 2
z: .word 84
.text
#Criando um endereco para a primeira posicao de memoria em s1
ori $s1 ,$zero, 0x1001
sll $s1,$s1,16

#Iniciando variaveis para acumular os numeros
add $t0,$zero,0
add $s2,$zero,0
add $s3,$zero,0

 #Somar os elementos do array em s1
 while:
 	lw $s2,0($s1)   # carregar o conteudo do array em t0, para s2
 	add $s3,$s3,$s2   # t3 += t2 
 	add $s1,$s1,4	  # t1 += 4
 	add $t0,$t0,4
 	nop
 	nop
 	ble $t0,400,while  # voltar ao loop se t0 for diferente de 404 
 exit:

#resetando a posicao do vetor 
ori $s1 ,$zero, 0x1001
sll $s1,$s1,16

sw $s3,0($s1) # salvando a soma dos elementos do inicio do array
