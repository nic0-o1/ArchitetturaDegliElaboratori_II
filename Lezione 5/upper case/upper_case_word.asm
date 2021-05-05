# la funzione che converte in maiuscolo una stringa di byte (assumiamo solo caratteri minuscoli)
# conversione in place => sovrascrivo direttamente l'area di memoria dell'input
# $a0 => indirizzo del vettore
#valore maiuscolo = valore minuscolo - 32

	.text
	.globl upper_case_word

upper_case_word:
	#preambolo
	#salvo il $fp corrente
	move $t0 $fp #importante SALVARE!
	addi $fp $fp -4
	
	#salvo sullo stack il frame pointer e lo stack pointer del chiamante
	sw $t0 0($fp) 	#frame pointer del chiamante
	sw $sp -4($fp) #stack pointer del chiamante
	
	#salvo i registri $s* e $ra
	sw $ra -8($fp)
	sw $s0 -12($fp)
	sw $s1 -16($sp)
	
	#aggiorno lo stack pointer
	addi $sp $fp -16
	
	#codice
	move $s0 $a0  #in $s0 avrò l'indirizzo dell'elemento corrente del vettore
	#lb $s1 0($a0) #carico in $s1 il valore dell'elemento corrente del vettore
	
	#"abc" => abc\0
loop:
	lb $s1 0($s0)  #carico in $s1 il valore dell'elemento corrente del vettore
	beq $s1 $zero end # se ho la stringa vuota
	
	move $a0 $s1
	jal upper_case_letter
	move $s1 $v0 #valore di ritorno di upper_case_letter
	
	#subi $s1 $s1 32  #invoco un'altra procedura 
	sb $s1 0($s0)
	
	#proseguo con il prossimo elemento
	addi $s0 $s0 1 #il prossimo indirizzo è dato da un incremento al byte +1
	#lb $s1 0($a0)
	
	j loop

end:
	#epilogo
	#lw $s0 4($sp)
	#lw $s1 0($sp)
	#addi $sp $sp 8
	
	lw $t0 0($fp) 	#frame pointer del chiamante
	lw $sp -4($fp) #stack pointer del chiamante
	
	#salvo i registri $s* e $ra
	lw $ra -8($fp)
	lw $s0 -12($fp)
	lw $s1 -16($sp)
	
	move $fp $t0
	
	jr $ra
