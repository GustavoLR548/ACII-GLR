.data
x1: .word 15 # configurando o valor do inteiro "x1" como 15
x2: .word 25  # configurando o valor do inteiro "x2" como 25
x3: .word 13  # configurando o valor do inteiro "x3" como 13
x4: .word 17  # configurando o valor do inteiro "x1" como 17
soma: .word -1  # configurando o valor do inteiro "soma" como -1
.text

# Referencia : lw = load word ; sw = save word.

# Armazendo os valores em ".data" em variaveis temporarias

ori $t0,$zero,0x1000
sll $t0,$t0,16

lw $s0, x1 # t0 = x1 = 15
lw $s1, x2 # t1 = x2 = 25
lw $s2 ,x3 # t2 = x3 = 13
lw $s3 ,x4 # t3 = x4 = 17

#Somando os elementos
add $t1 ,$s0,$s1 # t4/temp4 = t0 + t1 ou 15 + 25
add $t2 ,$s2,$s3 # t5/temp5 = t2 + t3 ou 13 + 17
add $s4 ,$t1,$t2 # t6/temp6 = t5 + t4 ou 40 + 30

#salvando o valor das somas em "soma"
sw $s4,16($t0) 
