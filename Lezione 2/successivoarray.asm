	.data 
	msg1: .asciiz "Inserisci un numero intero: "
	msg2: .asciiz "Il numero e il successivo sono: " #x x+1 i due numeri
	msg3: .asciiz " " #carattere di fine stringa non necessario, verrà concatenato
	.align 2 # con l'array successivo siamo sensibili all'allineamento
	array: .space 8 #2 interi, 4 byte ognuno
	
	.text
	.globl main
main:
	# Stampa msg1
	li $v0, 4
	la $a0, msg1
	syscall
		
	#Leggere input intero
	li $v0, 5
	syscall
	
	#salvare il numero letto in array[0]
	la $s1, array
	sw $v0, 0($s1)
	
	#calcolare il successivo
	addi $v0, $v0, 1
	
	#salvare il successivo in array[1]
	sw $v0, 4($s1)
	
	#stampare msg2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#caricare il numero array[0]
	lw $t0, 0($s1)
	
	#stampare intero array[0]
	li $v0, 1
	add $a0, $zero, $t0
	syscall
	
	#stampare lo spazio
	li $v0, 4
	la $a0, msg3
	syscall
	
	#caricare il numero array[1]
	lw $t0, 4($s1)
	
	#stampare intero array[1]
	li $v0, 1
	add $a0, $zero, $t0
	syscall
	
	li $v0,10 #exit
	syscall		
	
	