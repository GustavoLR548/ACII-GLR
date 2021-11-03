.text

addi  $s0,$zero,1	# Declarando x | x = 1 

#Somando "x" cinco vezes, para fazer o mesmo "que 5 * x"
add $t0,$t0,$s0	
add $t0,$t0,$s0	
add $t0,$t0,$s0	
add $t0,$t0,$s0	
add $t0,$t0,$s0	

add $s1,$t0,15	# s1 = y = 5 * x + 15
