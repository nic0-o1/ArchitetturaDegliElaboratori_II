	.data
	h: .word 10
	A: .word 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	
	.text
	.globl main
	
main:
	la $s1, h
	la $s2, A
	
	# caricare il valore di h
	lw $t0, 0($s1)
	#caricare il valore di A[8]  offset = posizione richiesta * 4 (offset in byte)
	lw $t1, 32($s2)
	
	#calcolo
	add $t0, $t0, $t1
	
	#scrivo in A[12] il risultato
	sw $t0, 48($s2)
	