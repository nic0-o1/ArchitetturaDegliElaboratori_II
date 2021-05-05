#converte, se necessario, una lettera minuscola in maiuscolo
#in $a0 mi aspetto il carattere (byte)
#in $v0 metterò il carattere maiuscolo o inalterato se non sono necessari interventi	
	
	.text
	.globl upper_case_letter
	
upper_case_letter:
	#preambolo
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp) #salvo $fp del chiamante
	sw $sp -4($fp)
	sw $s0 -8($fp)
	#qui non è necesserio salvare il $ra, da qui non invoco un'altra procedura (procedura foglia)
	addi $sp $fp -8
	
	#codice
	move $s0 $a0
	
	blt $s0 97 return
	bgt $s0 122 return

	subi $a0 $a0 32

	#epilogo
return:
	move $v0 $a0
	lw $t0 0($fp) #salvo $fp del chiamante
	lw $sp -4($fp)
	lw $s0 -8($fp)
	move $fp $t0
	
	jr $ra