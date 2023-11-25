.data
vector1: .word 1, 2, 3, 4, 5, 6, 7	# vector de 7 posiciones de 4 bytes
vector2: .word 1, 4, 3, 4, 5, 6, 7
resultado: .space 28 	# reserva espacio para almacenar el resultado (7 enteros de 4 bytes)
newline: .asciiz "\n"	# salto de linea
 
.text
.globl main
#425 + 50 + 50
main:
    la $t0, vector1  #carga la dirección base del vector1 en $t0
    la $t1, vector2  #carga la dirección base del vector1 en $t1
    la $t2, resultado  #carga la dirección base de resultado en $t2
    
    li $t3, 7 # inicializamos el contador en 7 (tamaño vector)
 
loop: 
    lw   $s0, 0($t0)	# en la posicion $s0 vamos a llevarle el primer numero del vector1 -- desde 0 hasta $t0 = 1
    lw   $s1, 0($t1)    # en la posicion $s1 vamos a llevarle el primer numero del vector2 -- desde 0 hasta $t0 = 1
    add  $s2, $s1, $s0  # s2 = s1 + s0  -- sumando las pos1 de cada vector
    sw   $s2, 0($t2)	# guardamos s2 en t2
    li   $v0, 1		# vamos a imprimir por pantalla --  v0  = 1
    move $a0, $s2	# add a0 = s2 + s0 -- dudass
    syscall		# muestra en pantalla $s2
    
    li   $v0, 4		# imprimir cadena pantalla
    la   $a0, newline
    syscall
    
    addi $t0, $t0, 4	# avanzar siguiente linea vector, 4 bits = tamaño de inst
    addi $t1, $t1, 4	# vector 2
    addi $t2, $t2, 4	# vector 3
    
    addi $t3, $t3, -1	# decrementamos el contador
    
    bnez $t3, loop	# si la posicion del vector no es cero salte a loop (de vuelta al ciclo)
    
    li $v0,10		# finalizamos el programa
    syscall
