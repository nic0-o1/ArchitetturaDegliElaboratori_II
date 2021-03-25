	.data
	msg_in: .asciiz "Quanto vuoi scommettere ?"
	msg_out: .asciiz "Il tuo nuovo credito è: "
	
	.text
	.globl main

main: 
	li $v0, 51
	la $a0, msg_in
	syscall
	
	move $t0, $a0 #sposto per sicurezza, so che $t0 non verrà usato per altre syscall
	
	#t0 = NUM letto RANDOM [-NUM, NUM] -> rand([0, 2*NUM +1]) - NUM 
	mul $t1, $t0, 2
	addi $t1, $t1, 1 	#2*NUM +1
	
	li $v0, 42 #random int range
	li $a0, 1000 #seed
	move $a1, $t1
	syscall 
	
	move $a0, $t1 #random generato
	sub $t1, $t1, $t0 #gen - NUM in [-NUM, NUM]
	
	add $t2, $t0, $t1
	
	li $v0, 56
	la $a0, msg_out
	move $a1, $t2
	syscall
	
	li $v0, 10
	syscall
	
	
	
	