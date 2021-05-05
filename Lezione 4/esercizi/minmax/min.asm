#$a0: base address di A
#$a1: la dimensione di A
#risultato in v0 il valore minimo in A	
	
	.text
	.globl min
	
min:
	move $t0 $a0 # in $t0 mettiamo l'indirizzo di un elemento
	lw $t1 0($t0) # carichiamo il valore del primo elemento
	j updateMin # assumiamo che il valore minimo sia in A[0]
	
loop:
	slt $t2 $zero $a1 #se ho ancora elementi da processare
	beq $t2 $zero endloop
	
	lw $t1 0($t0)
	slt $t2 $t1 $v0
	beq $t2 0 continue
updateMin:
	move $v0 $t1
continue:
	addi $a1 $a1 -1
	addi $t0 $t0 4
	j loop

endloop:
	jr $ra