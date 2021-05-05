	.text
valori : .space 200
msgNumValori: "Quanti valori devi inserire ? "
msgIns: .asciiz "\nInserisi un valore: "
	
	.globl main
	
main:

	#stampa messaggio
	li $v0 4
	la $a0 msgNumValori
	syscall
	
	#lettura
	li $v0 5
	syscall
	
	move $t0 $a0 #dimensioine array
	la $t2 valori #indirizzo dell'array
	li $a1 1 # interi pari
	
	
loop:
	beq $t0 $zero letturaterminata #se ho ancora da scorrere
	
continue:
	#stampa messaggio
	li $v0 4
	la $a0 msgIns
	syscall
	
	#lettura
	li $v0 5
	syscall
	
	#salvataggio nell'array
	sw $v0, $t1($t2)
	
update:
	addi $t0 $t0 -1
	addi $t1 $t1 4
	j loop
	
letturaterminata:

	move $a0 $t2
	jal sommaSelettiva
	
	li $v0 10
	syscall