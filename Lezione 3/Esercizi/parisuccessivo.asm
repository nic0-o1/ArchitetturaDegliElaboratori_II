	.data
msg: .asciiz "Inserisci un numero: " 

	.text
	.globl main
	
main:
	li $v0 4 #print str
	la $a0 msg
	syscall
	
	li $v0 5 #read int
	syscall
	move $s0 $v0 # = alla add $s0 zero $v0
	
	# 2 --> 4 3 --> 4
	#x % 2 == 0 ?? resto della divisione
	li $t0 2 # = addi $t0 $zero 2
	div $s0 $t0 # non potevo mettere direttamente 2
	mfhi $t1 # in t1 ci sarà il resto della divisione intera. in low ci sarà il quoziente
	#se t1 == 0  => pari altrimenti dispari
	
	addi $s0 $s0 1 #inizio già ad aggiungere 1, in caso aggiungerò ancora
	
	bne $t1 $zero fineIf # se t1 è 0 => il numero è pari  = bnez $t1 fineIf
	addi $s0 $s0 1 # aggiungo ancora 1
	
fineIf: 
	
	li $v0 1
	move $a0 $s0 # in s0 ci sarà il valore del pari successivo
	syscall
	
	li $v0 10 #exit
	syscall