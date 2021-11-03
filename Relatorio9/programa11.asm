.data
x: .word 100000
z: .word 200000
y: .word 0    # esse valor deverá ser sobrescrito após a execução do programa.
.text
# Referencia : lw = load word ; sw = save word.

# Armazendo os valores do ".data" em variáveis temporárias
lw $t0, x    # t0/temp0 = x = 100000
lw $t1, z    # t1/temp1 = z = 200000

# Pegando o valor 300000
addi $t2,$zero,18750
sll $t2,$t2,4     # 18750 * (2^4) = 300000

#x - z + 300000
sub $t1,$t0,$t1
add $t2,$t2,$t1

#salvando o valor em "y"
sw $t2, y
