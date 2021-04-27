	.text
	.globl main
	
main: 
	li $t0 1
	li $t1 2
	
	beq $t0 $t1 blocco1
	
	addi $t0 $t0 1
	addi $t0 $t0 1
	
blocco1:
	
	  
	    li $v0 10
	    syscall  