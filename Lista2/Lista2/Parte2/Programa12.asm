.data
    k: .word 5
    x: .word 
    
.text
    main:
    la $t0, k # pointeiro 1
    la $t1, 4($t0) # pointeiro 2
    la $t2, 4($t1) # pointeiro , t2 = x
    
    sw $t2, x # armazenando em x o ponteiro
    
    la $s0, -8($t2) # pegando o ponteiro original
    lw $s1,($s0) # pegar o conteudo do ponteiro
    
    sll $s1,$s1,1 # multiplicar por 2 ( 1 shift logical left) | K *= 2
    sw $s1,($s0) # salvar o resultado da multiplicacao no conteudo do ponteiro
