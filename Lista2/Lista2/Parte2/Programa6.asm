 .text

addi $t0,$zero,-1 # t0 = 0 +(-1)
srl $s0,$t0,1 # s0 = t0 / 2 | s0 = x, x = maior inteiro possivel
add $t1,$zero,  9375 # s1 = 0 + 9375
sll $s1,$t1,5   # s1 = t1 * 2^5 | s1 = y , y = 300000;

add $t2,$zero,$s1 # t2 = 0 + s1
sll $t2,$t2,2   # t2 *= 2^2 | 300000 * 4;

sub $s2,$s0,$t2  # s2 = s0 + t2 | z = x - 4y

