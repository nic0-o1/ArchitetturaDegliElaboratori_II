	.data
	msg1: .asciiz "Inserire un numero intero: "
	msg2: .asciiz "L'intero successivo è: "
	
	.text
	.globl main
	
main:
	li $v0, 4 #preparo per la syscall 4 (print string)
	la $a0, msg1
	syscall
	
	li $v0, 5 #preparo per la readInteger
	syscall
	#add $t0, $zero, $v0 equivale alla move sotto
	move $t0, $v0
	
	addi $t0, $t0,1 #intero successivo
	
	li $v0, 4 #preparo per la syscall 4 (print string)
	la $a0, msg2 # devo stampare l'intero successivo
	syscall
	
	li $v0, 1
	#move $a0, $t0 equivalente alla add sotto
	add $a0, $zero, $t0
	syscall
	
	li $v0, 10 #preparo per l'exit
	syscall
	
	