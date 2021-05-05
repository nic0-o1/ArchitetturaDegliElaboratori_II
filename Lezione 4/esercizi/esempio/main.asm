	.text
	.globl main
	
main:
	#caricare i due valori
	li $a0 1
	li $a1 2
	
	#invocazione
	jal maxfunc
	#recupero del valore di ritorno che sarà in $v0
	move $t0 $v0
	
	#print del massimo
	li $v0 1
	move $a0 $t0 
	syscall 
	
	#exit
	li $v0 10
	syscall 
	

