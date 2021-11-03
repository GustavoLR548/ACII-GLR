.data
    array: .space 400 #Declarando o array de 400 bits( com tamanho 100 )
    
.text
    main:
    addi $t0, $zero, 0 # t0 = i ; i = 0
    addi $t1, $zero, 1300
    
    while: # while ( i < 400 ) { 
        bgt $t0,400, exit
        sub $t1,$t1,13
        sw $t1,array($t0) # array[i] = t1
        addi $t0,$t0,4
        j while
    
    exit: # } 
    add $t0,$zero, 0 # int i 
    add $t1, $zero, -4 
    
    blt $t0, 400, bubblesort1 # for (int i = 0; i < n; i++) 

    bubblesort1:
    add $t1,$t1,4 # j++
    blt $t1, 396, bubblesort2 # for (int j = 0; j < n-1; j++) 
    
    bubblesort2:
    add $t3,$t1,4 # t3 = j + 1
    lw $s1,array($t1) # resgatando o conteudo de "array(j)"
    lw $s2,array($t3) # resgatando o conteudo de "array(j+1)"
    bgt $s1,$s2,swap # if (arr[j] > arr[j+1]) 
    
    bubblesort3:
    blt $t1, 396, bubblesort1 # conferindo se t1 ja percorreu o array in
    add $t0,$t0,4 # i++
    add $t1,$zero,-4 # resetando j
    blt $t0,400, bubblesort1 # conferindo se t0 ja percorreu o array inteiro
    j fim
    
    swap:
    #trocando o conteudo em array[j] e array[j+1]
    sw $s2,array($t1) 
    sw $s1,array($t3)
    j bubblesort3 
    
    fim:
    #fim do programa
