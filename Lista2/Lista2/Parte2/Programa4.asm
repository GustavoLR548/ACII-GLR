.text

  addi $s0,$zero,3 # s0 = x, x = 3
  addi $s1,$zero,4 # s1 = y, y = 4
  
  mul $t0,$s0,15 # t0 = tmp1 , tmp1 = 15 * 3

  mul $t1,$s1,67 # t1 = tmp2 , tmp2 = 67 * 4

  add $t2,$t1,$t0 # t2 = t1 + t0 | ( 15 * 3 + 67  )
  sll $t2,$t2,2 # t2 *= 2^2 | ( 15 * 3 + 67  ) * 4
