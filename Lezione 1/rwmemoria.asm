	.data
	C: .word 2
	i: .word 3
	A: .space 400 #ragiona in byte
	B: .space 400
	
	.text
	.globl main
	
main:
	la $s0, A
	la $s1, B
	la $s2, C
	la $s3, i
	
	#inizializzare B[i] = 10 sw $t0, i*4($s1)
	li $t0, 4
	lw $t1, 0($s3) # carico il valore di i
	mul $t0, $t1, $t0 # i*4 offset
	
	#base + offset -> B[i]
	add $t1, $s1,$t0 #indirizzo di B[i]
	
	li $t2, 10 #carico il valore immediato 10
	
	sw $t2, 0($t1)
	
	#sw $t0, $t0($t1) # non posso farlo, prima della ( no registro
	
	#A[99] = 5 + B[i] +C
	lw $t0, 0($t1) #ricarico il valore  $t0 = B[i], evito possibili errori 
	lw $t1, 0($s2) #carico  $t1 = C
	
	add $t0, $t0, $t1 #faccio B[i] +C 
	addi $t0, $t0, 5 #sommo 5
	
	#A[99] -> 99*4 ($s0) 396($s0)
	sw $t0, 396($s0)
	
	
	
	
	