# #include <iostream.h>
# main()
# {
#  int c = 3;
#  char *s;
#  switch(c)
#  {
#   case 0: s = “negro”; break;
#   case 1: s = “azul”; break;
#   case 2: s = “amarillo”; break;
#   case 3: s = “verde”; break;
#   case 4: s = “rojo”; break;
#   case 5: s = “gris”; break;
#   case 6: s = “naranja”; break;
#   case 7: s = “blanco”; break;
#   default: s = “otros”;
#  }
#  cout << s << endl;
#}
.data
negro:    .asciiz "negro\n"
azul:     .asciiz "azul\n"
amarillo: .asciiz "amarillo\n"      
verde:    .asciiz "verde\n"
rojo: ??  .asciiz "rojo\n"
gris: ??  .asciiz "gris\n"
naranja:  .asciiz "naranja\n"
blanco:   .asciiz "blanco\n"
otros: ??  .asciiz "otros\n"
 
.text
.globl main
main: 
     li  $s0, 7 	# numero del color
     bne $s0, 0, c1	# si ($s0 != 0 ) true - then salte a c1
     la  $a0, negro	# $a0 = negro -- por defecto
     b   cx		# break a cx
c1:  bne $s0, 1, c2	# si ($s0 != 1) true - then salta a c2
     la  $a0, azul
     b   cx
c2:  bne $s0, 2, c3	# si ($s0 != 2) true - then salta a c2
     la  $a0, amarillo
     b   cx
c3:  bne $s0, 3, c4
     la  $a0, verde
     b   cx      
c4:  bne $s0, 4, c5
     la  $a0, rojo
     b   cx
c5:  bne $s0, 5, c6
     la  $a0, gris
     b   cx
c6:  bne $s0, 6, c7
     la  $a0, naranja
     b   cx
c7:  bne $s0, 7, c8
     la  $a0, blanco
     b   cx
c8:  la  $a0, otros
cx:  li  $v0, 4
     syscall
     li  $v0, 10
     syscall 