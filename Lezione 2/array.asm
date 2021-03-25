	.data
	A: .word 1 2 3 4 #array se so già cosa memorizzare
	B: .space 16 #array se non so i valori da memorizzare, riservo solo lo spazio
	msg: .asciiz "Hello" #5 byte. Asciiz aggiunge \0 potrebbe non essere multiplo di 4
	.align 2	
	C: .byte 10 11 12 13
	
	.text
	.globl main
	
main:
	la $t0, B
	la $t3, C
	
	li $t1, 10
	sw $t1, 4($t0)  #accedo all'elemento 0, l'indirizzamento avviene in byte. si va avanti di 4 in 4 per posizione
	lw $t1, 0($t3)
	