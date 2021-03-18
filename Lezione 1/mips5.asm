	.data
	DATO: .word 15
	STRINGA: .asciiz "hello world"
	#V: .space 8 #multiplo di 4
	
	.align 2 #allinea alla parola
	
	
	DATO2: .byte 4 3 2
	.align 2 #allinea alla parola
	DATO3: .byte 4 3 2 1
	
	
	
	.text
	.globl main
	
main:
	#la $s0, 0x10010000
	la $s0, DATO3
	lw $s1, 0($s0)