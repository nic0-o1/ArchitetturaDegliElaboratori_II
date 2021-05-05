#funzione che calcola il massimo tra due numeri
# int max(int a,int  b)
# if a  >= b
#	retunrn a;
# else
#	return b;

	.text
	.globl maxfunc
	
maxfunc:
	#in a0 ci sarà il numero a
	#in a1 ci saràò il numero b
	#in v0 metterò il maggiore tra a e b
	#prologo
	
	#PUSH
	subi $sp $sp 4
	sw $s0 0($sp)
		
	#corpo della funzione
	move $s0 $a1 # in $s0 <- b
	
	bgt $s0 $a0 end  #se b > a allora branch
	
	#se a > b
	move $v0 $a0 #il  massimo è a e non b
end:
	#se a < b
	move $v0 $s0 # per convenzione
	#epilogo	
	#POP
	lw $s0 0($sp)
	addi $sp $sp 4
	
	jr $ra
	
