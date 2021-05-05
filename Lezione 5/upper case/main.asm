#convertire una stringa di sole lettere minuscole in lettere maiuscole
#invocando la funzione upper_case_word
	.data
nome: .asciiz "nicolo'"
cognome: .asciiz "rosati"
	
	.text
	.globl main
	
main:
	
	#invocazione con nome
	la $a0 nome
	jal upper_case_word

	li $v0 4 #print string
	la $a0 nome
	syscall

	#exit
	li $v0 10
	syscall
	
