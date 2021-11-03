.text

addi $t0,$zero,25000	# t0 = 0 + 25000

sll $s0,$t0,2  	        # s0 = t0 * 2^2, x = s0, x = 100000
sll $s1,$t0,3  	        # s1 = t0 * 2^3, y = s1, y = 200000

add $s2,$s0,$s1	        # s2 = s0 + s1 | z = x + y

