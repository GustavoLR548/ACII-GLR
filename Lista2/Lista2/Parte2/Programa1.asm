.text

addi  $s0,$zero,2 # s0 = a = 2
addi  $s1,$zero,3 # s1 = b = 3
addi  $s2,$zero,4 # s2 = c = 4
addi  $s3,$zero,5 # s3 = d = 5 

add $t0,$s0,$s1	# t0 = s0 + s1 | a+b
add $t1,$s2,$s3	# t1 = s2 + s3 | c+d
sub $s4,$t0,$t1 # s4 = t0 + t1 | x

sub $t0,$s0,$s1	# t0 = s0 + s1 | a-b
add $s5,$t0,$s4	# s5 = t0 + s4 | y

sub $s1,$s4,$s5	# s1 = s4 + s5 | b