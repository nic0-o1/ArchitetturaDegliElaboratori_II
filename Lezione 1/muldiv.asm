	.text
	.globl main
	
main:
	li $s1, 100
	li $s2, 45
	
	# ISA
	mult $s1, $s2
	mflo $s0
	
	# pseudo istruzione
	mul $s3, $s1, $s2  #equivale alle righe 9-10
	 