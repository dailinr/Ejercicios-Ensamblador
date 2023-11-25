# #include <iostream.h>
#  main() {
#  int a[] = {-36, 20, -27, 15, 1, -62, -41};
#  int n = 7;
#  int i;
#  int npos, nneg;
#  for (i = npos = nneg = 0; i<n; i++)
#     if (a[i] > 0)
#         npos++;
#     else
#         nneg++;
#    cout << "+: " << npos << "; -: " << nneg << endl;
# }
 
.data
a: .word -36, 20, -27, 15, 1, -62, -41	# declarar array
n: .word 7				#declar una variable = 7
endl: .asciiz "\n"			# variable como endl en c++
.text
.globl main
 
main: li $t0, 0????#i en $t0
      li $t1, 0????#n positivos en $t1
      li $t2, 0????#n negativos en $t2
      lw $s1, n????#n en $s1 -- contador = 7
m1:   bge $t0, $s1, m4
      mul $t3, $t0, 4   #da el valor adecuado a i -- $t3 = $tp * 4 
      lw  $t4, a($t3)   # carga el valor de a[i] en $t4
      bgez $t4, m2?? # if a[i]> 0
      addi $t2, $t2, 1  #"else": incrementa el nneg
      b m3???? # salta sobre el "then"
m2:   addi $t1, $t1, 1  # "then" incrementa el npos
m3:   addi $t0, $t0, 1  # i++
      b m1		# devuelve al ciclo -- branch a m1
m4:   move $a0, $t1?? # imprime npos -- a $a0 le movemos $t1 --> addi $a0, $t1, 1
      li $v0, 1
      syscall
      la $a0, endl	# salto de linea
      li $v0, 4
      syscall
      move $a0, $t2??# imprime nneg
      li $v0, 1		# porque imprimiremos un numero
      syscall
      li $v0, 10	# para salirnos del programa
      syscall