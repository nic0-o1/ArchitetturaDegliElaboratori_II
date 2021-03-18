	.text
	.globl main

main:
	addi $s1, $zero, 5 #carico in $s1 il valore 5
#	addi $s2, $zero, 7 #carico in $s2 il valore 7
	li $s2, 7 # carica in $s2 il valore 7, fa la stessa cosa, cambia come viene tradotto (addiu)
					
	add $s0, $s1, $s2 #carico in $s0 la somma tra $s1 e $s1
	