.data 
A: .word 2, 4, 6, 8, 9, 1, 3, 6, 8
B: .word 3, 5, 7, 9, 0, 2, 4, 1, 2
g: .word 19
f: .word .space 4
h: .word 9
newline: .asciiz "\n"

.text
.globl main

main:
	la $s0, f	# variables
	lw $s1, g
	lw $s2, h	# tamaño vector  - contador
	la $s6, A	# vector A
	
	lw   $s2, 16($s6) 
	add $s0, $s1, $s2
	li   $v0, 4		# vamos a imprimir por pantalla 
   	syscall	
   	# punt b
   	
   	la $s7, B
   	li $s3, 0	# inicializamos el contador con  
loop:
	la $t0, $s3
	addi $t0, $t0, 4
	lw $s4, $s3, $t0
	sub $t1, $s3, $s4
	sw $t2, 32($s7)
	lw $t2, $t1($s6)
	li   $v0, 4		# imprimir cadena pantalla
    	la   $a0, newline
    	syscall
    
	addi $s3, $s3, 4
	bnez $s2, loop	
	li $v0,10		# finalizamos el programa
    	syscall