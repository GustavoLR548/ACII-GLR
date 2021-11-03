.data
x: .word 5    # Declarando "X"
z: .word 7    # Declarando "Z"
y: .word 0    # Declarando "Y" ,o valor devera ser sobrescrito apos a execucao do programa.
.text

# Armazendo os valores do ".data" em variáveis temporárias
lw $t0, x    # t0/temp0 = x = 5
lw $t1, z    # t1/temp1 = x = 7

# Armazenando os valores que seram usados para a multiplicacao
addi $t4,$t4,127
addi $t5,$t5,65

#127x5
sll $t2,$t4,2     # $t2 = 127 x 4
add $t2,$t2,$t4   # $t2 += 127

#65x7
sll $t3,$t5,3     # $t3 = 65 x 8
sub $t3,$t3,$t5   # $t3 -= 65

#Conta final
sub $t3,$t2,$t3   # 127x5 - 65x7 | $t2 - $t3
add $t3,$t3,1     # $t3 += 1

#salvando o valor em "y"
sw $t3, y
