#$a0 intero 1
#$a1 intero 2
#$a2 intero 3
#$a3 indirizzo 1
#$sp 0 indirizzo 2

	.text
	.globl branch3equal

branch3equal:
	beq $a0 $a1 primidueUg
	j controllo2

primidueUg:
	beq $a0 $a2 uguali
	
controllo2:
	beq $a0 $a2 exit	
	
controllo3:
	bne $a1 $a2 diversi
	j exit

diversi:
	lw $t0 0($sp) #diversi
	addi $sp $sp 4 #diversi
	jr $t0 #diversi1

exit:
	jr $ra
uguali:
	jr $a3 # uguali
