.data
	print: .ascii "Hello World!" # Declarando a String "Hello World!"
.text
 	li $v0, 4     #Carregando a v0, o comando de printar string , que eh v0
 	la $a0, print #Carregando em a0, o conteudo de print, (Obs: a0 , é o argumento)
 	syscall # chamar o sistema para realizar o comando em v0
