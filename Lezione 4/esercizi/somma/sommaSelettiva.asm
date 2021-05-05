#INPUT:
	#$a0 indirizzo array
	#$a1 parametro di selezione operazione	
	#$a2 numero di valori inseriti
#OUTPUT 
	#$v0 la somma
	.text
	.globl sommaSelettiva
	
sommaSelettiva:
	beq $a1 1 sommaPari
	j sommaDispari	

sommaPari:



sommaDispari:


return:
	j $ra