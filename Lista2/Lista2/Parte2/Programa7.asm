.text

ori $8, $0, 0x01 # Comando necess�rio para a quest�o
sll $8, $8, 31 # $8 *= 2^31
sra $8, $8, 31 # $8 /= 2^31 | $8 = 0xFFFFFFFF

