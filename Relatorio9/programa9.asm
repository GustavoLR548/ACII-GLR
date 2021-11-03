.data
x1: .word 15
x2: .word 25
x3: .word 13
x4: .word 17
soma: .word -1
.text
# Referencia : lw = load word ; sw = save word.

# Armazendo os valores do ".data" em variáveis temporárias
lw $t0, x1    # t0/temp0 = x1 = 15
lw $t1, x2    # t1/temp1 = x2 = 25
lw $t2 ,x3    # t2/temp2 = x3 = 13
lw $t3 ,x4    # t3/temp3 = x4 = 17

#Somando os elementos
add $t4 ,$t0,$t1    # t4/temp4 = t0 + t1 ou 15 + 25
add $t5 ,$t2,$t3    # t5/temp5 = t2 + t3 ou 13 + 17
add $t6 ,$t5,$t4    # t6/temp6 = t5 + t4 ou 40 + 30

#salvando o valor das somas em "soma"
sw $t6,soma 
