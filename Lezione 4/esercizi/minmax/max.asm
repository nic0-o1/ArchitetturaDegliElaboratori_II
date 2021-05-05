#$a0: base address di A
#$a1: la dimensione di A
#risultato in v0 il valore massimo in A	
	
	.text
	.globl max
	
max:
	move $t0 $a0 # in $t0 mettiamo l'indirizzo di un elemento
	lw $t1 0($t0) # carichiamo il valore del primo elemento
	j updateMax # assumiamo che il valore massimo sia in A[0]
	
loop:
	slt $t2 $zero $a1 #se ho ancora elementi da processare
	beq $t2 $zero endloop
	
	lw $t1 0($t0) #carica A[i[]
	slt $t2 $v0 $t1 #se attuale massimo è minore di A[i] => $t2 = 1
	beq $t2 $zero continue #salto se l'attuale massimo è ancora attuale massimo
updateMax:
	move $v0 $t1
continue:
	addi $a1 $a1 -1 #= subi $a1 $a1 1 decremento il numero di elementi
	addi $t0 $t0 4 # calcolo l'indirizzo del prossimo elemento dell'array A[i+1]
	j loop
endloop:
	jr $ra
	
	