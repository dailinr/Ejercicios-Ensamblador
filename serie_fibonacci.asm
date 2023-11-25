.data
newline: .asciiz "\n" 
prompt: .asciiz " Ingrese el número de digitos para la secuencia de Fibonacci:"
output: .asciiz " Secuencia de Fibonacci:"

.text
.globl main
main:

	li $v0, 4	
	la $a0, prompt	# Pedir número al usuario por pantalla
	syscall	
		
	li $v0, 5	
	syscall
	move $t0, $v0	
	
	li $t1, 0	# inicializamos variables con los primeros numeros de la serie
	li $t2, 1
	li $t3, 0	# interador empieza en 0
	 
loop:
	bge $t3, $t0, end	#  si ( $t3 >= $t0) salta a end -- 0, 1, 2, 3, 4, 5 >= 5
	move $t4, $t1		# $t4 = 0 1 1 2 3 
	add $t1, $t2, $t1	# $t1 += $t2 -- 0 1 1 2 3 5
	move $t2, $t4		# $t2 = 0 1 1 2 3 
	li $v0, 1		
	move $a0, $t4		# movemos $t4 a $a0
	syscall			
	li $v0, 4		
	la $a0, newline
	syscall
	addi $t3, $t3, 1	# incrementamos iterador -- 0 1 2 3 4 5
	j loop			# salta al ciclo
	
end:
	li $v0, 10		# terminamos el programa
	syscall
