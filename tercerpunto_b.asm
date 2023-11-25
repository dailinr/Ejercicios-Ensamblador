.data
newline: .asciiz "\n"
#vector: .word 1, 2, 3, 4, 5, 6, 7, 8, 0
vector: .space 32

.text
.globl imprimirPantalla 

imprimirPantalla:
    la $a0, vector	  # cargamos la direccion base del vector en $a0
    li $t0, 0              # Inicializamos el contador de caracteres a cero

loop:      # ciclo para recorrer el vector
    lw $t1, 0($a0)         # Cargar la direcci�n de la primera tira de caracteres
    beq $t1, $zero, fin    # Si la direcci�n es cero, sale de la funcion
     
    char_loop:	# ciclo para recorrer e imprimir las tiras de caracteres
       lb $t2, 0($t1)         # Carga el primer car�cter de la tira
       beq $t2, $zero, next   # Si es cero, pasamos a la siguiente tira
       
       li $v0, 11             # Imprimir el car�cter
       move $a0, $t2
       syscall

       addi $t1, $t1, 1       # Avanzar al siguiente car�cter
       addi $t0, $t0, 1       # Incrementar el contador de caracteres
       j char_loop

    next:
       #Indicamos un salto de linea para la nueva cadena de caracteres
       li $v0, 4 	
       la $a0, newline
       syscall
  
       addi $a0, $a0, 1       # Avanzar a la siguiente tira de caracteres
       b loop

   fin:
       move $v0, $t0          # Devolvemos el contador de caracteres totales impresos en $v0
       jr $ra                 # Volver a la direcci�n de retorno