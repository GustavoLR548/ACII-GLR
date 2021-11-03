.text

  addi $s0,$zero,3 # s0 = x, x = 3
  addi $s1,$zero,4 # s1 = y, y = 4

  # x * 15
  add $t0,$zero,15 
  add $t0,$t0,15
  add $t0,$t0,15

  # y * 67
  add $t1,$zero,67 
  add $t1,$t1,$t1
  add $t1,$t1,$t1

  # (15 * x + 67 * y ) * 4
  add $t2,$t1,$t0 # t2 = t1 + t0 | ( 15 * 3 + 67  )
  add $t2,$t2,$t2
  add $t2,$t2,$t2
