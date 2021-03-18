	.text
	.globl main

main:
	#A -> $s0
	#B -> $s1
	#C -> $s2
	#D -> $s3
	#E -> $s4
	
	li $s1, 1
	li $s2, 2
	li $s3, 3
	li $s4, 4
	
	#A = B+C -(D+E)
	add $t0,$s1,$s2 #salvo la somma in un registro temporaneo
	add $t1, $s3, $s4 #$t1 <- D+E
	
	sub $s0, $t0, $t1
	
	