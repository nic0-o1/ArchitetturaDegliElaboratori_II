	.data
strM: .asciiz "Inserisci tre numeri: \n"
strA: .asciiz "Inserisci A: " 
strB: .asciiz "Inserisci B: "
strC: .asciiz "Inserisci C: "
strErr: .asciiz "Errore!"

	.text
	.globl main
	
main:
	li $v0 4 
	la $a0 strM
	syscall
	
	li $v0 4 #stampo A
	la $a0 strA 
	syscall
	 
	li $v0 5
	syscall
	move $s0 $v0 #$s0 = a
	
	li $v0 4 #stampo B
	la $a0 strB
	syscall
	 
	li $v0 5
	syscall
	move $s1 $v0 #$s1 = b
	
	li $v0 4 #stampo C
	la $a0 strC
	syscall
	 
	li $v0 5
	syscall
	move $s2 $v0 #$s2 = C
	
	# a>= b && c != 0
If:
	slt $t0 $s0 $s1 # s0 < s1 ?
	bne $t0 $zero Else #se quindi s0 < s1 (b < a)
	beq $s2 $zero Else # se c = 0
	
Then:
	#z = c(a+b)
	#print z
	add $t0 $s0 $s1
	#mul $t0 $s2 $t0
	mult $s2 $t0
	mflo $t0
	
	#stampa del numero
	li $v0 1
	move $a0 $t0
	syscall
	
	j End # devo evitare di fare l'else
Else:
	li $v0 4  #stampo errore
	la $a0 strErr
	syscall
End:
	li $v0 10
	syscall		
	
	
	
	



	