	.data
	strop: .asciiz "Che operazione vuoi fare ?\n 1: +\n 2: -\n 3: *\n 4: / \n"
	strsc: .asciiz "Operazione scelta: "
	strnum: .asciiz "\nInserisci numero: "
	strres: .asciiz "Risultato: "
	strresto: .asciiz " e il resto è: " 
	
	.text
	.globl main
	
main:
	#gestione syscall per l'input utente
	li $v0 4
	la $a0 strop
	syscall

	li $v0 4
	la $a0 strsc
	syscall

	li $v0 5
	syscall
	move $a2 $v0
	
	li $v0 4
	la $a0 strnum
	syscall
	
	li $v0 5
	syscall
	move $t0 $v0  #primo operando in $a0
	
	li $v0 4
	la $a0 strnum
	syscall
	
	li $v0 5
	syscall
	move $a1 $v0 # secondo operando in $a1
	
	#chiamata
	move $a0 $t0
	
	jal elaboratore
	#si recuperano i risultati v0 e nel caso anche v1
	move $t0 $v0
	move $t1 $v1
	
	li $v0 4
	la $a0 strres
	syscall

	li $v0 1
	move $a0 $t0
	syscall	
	
	beq $t1 $zero exit
	
	li $v0 4
	la $a0 strresto
	syscall

	li $v0 1
	move $a0 $t1
	syscall	
	
	#exit
exit:
	li $v0 10
	syscall
	
elaboratore:  #$a0 primo operando $a1 secondo operando $a2 codice operazione
	#si assume che il codice operazione sia valido
	subi $a2 $a2 1
	beq $a2 $zero Sum
	
	subi $a2 $a2 1
	beq $a2 $zero Diff
	
	subi $a2 $a2 1
	beq $a2 $zero Mul
	
	subi $a2 $a2 1
	beq $a2 $zero Div
	
	j End #codice non riconisciuto
		
Sum:
	add $v0 $a0 $a1
	j End
Diff:
	sub $v0 $a0 $a1
	j End
Mul:
	mul $v0 $a0 $a1
	j End
Div:
	div $a0 $a1
	mfhi $v1
	mflo $v0
End:
	jr $ra
	