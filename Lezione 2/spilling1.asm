	.text
	.globl main
main:
	#1*3 + 2*3 + 3*3 usando solo $0 e $t0 no mul
	li $s0,3
	
	#salvataggio di $0 sullo stack (PUSH)
	addi $sp, $sp, -4 #si fa spazio per $0
	sw $s0, 0($sp) #salvato $s0 sullo stack
	
	li $s0, 2
	li $t0, 3
	mult $0,$t0
	mflo $s0
	
	#recupero dallo stack il primo addendo (POP)
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	
	add $s0, $s0, $t0
	
	addi $sp, $sp, -4 #si fa spazio per la somma parziale ($s0)
	sw $s0, 0($sp) #salvato $s0 sullo stack
	
	li $s0, 3
	li $t0, 3
	#mul $s0,s0 se sono uguali
	mult $s0, $t0
	mflo $t0
	
	#recupero dallo stack la somma parziale (POP)
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	
	add $s0, $s0, $t0
	
	li $v0, 10
	syscall
	