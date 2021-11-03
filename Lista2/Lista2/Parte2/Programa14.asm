.data
TEMP: .word 51
FLAG: .word -2
.text
#Pegando o endereco base da data

main:
ori $t0,$zero,0x1001	# t0 = 1001 # Observacao: t0 eh o vetor
sll $t0,$t0,16		# t0 = t0 *= 2^16 = 10010000
addi $t1,$zero, 30	# t1 = 0 + 30 
addi $t2,$zero, 50	# t2 = 0 + 50
lw $s0,0($t0)		# Resgatar o valor em "0(t0)"

#Primeiro Teste do AND
test1:
slt $t3, $s0, $t1	# se "s0" for menor do que "t1", t3 sera igual a 1 , caso contrario, sera igual a 0
beq $t3,$zero, test2	# va para a funcao "test2" se t3 for igual a zero
sw $zero,4($t0)		# salve 0 na posicao "4" em "t0"
j fim

#Segundo Teste do AND
test2:
slt $t3, $t2, $s0	# se "t2" for menor do que "s0", t3 sera igual a 1 , caso contrario, sera igual a 0
beq $t3,$zero, verdade  #  va para a funcao "verdade" se "t3" for igual a zero
sw $zero,4($t0)	        # salve 0 na posicao "4" em "t0"
j fim
## if resp == true

verdade:
addi $s0, $zero, 1	# s0 = 1
sw $s0, 4($t0)		# salve s0 na posicao "4" em "t0"

fim:
