.text

ori $8, $0, 0x01 # Comando necessário para a questão
sll $8, $8, 31 # $8 *= 2^31
sra $8, $8, 31 # $8 /= 2^31 | $8 = 0xFFFFFFFF

