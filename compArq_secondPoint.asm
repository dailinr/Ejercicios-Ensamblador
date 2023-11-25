.data
    n:      .word   0
    result: .word   0
    temp:   .word   0
    prompt: .asciiz "Enter the value of n: "
    val_prompt: .asciiz "Enter value "

.text
.globl main

main:
    
    li $v0, 4          
    la $a0, prompt    
    syscall

    li $v0, 5          
    syscall
    sw $v0, n         

    li $t0, 0         
    lw $t1, n         

m1:
    bge $t0, $t1, m3   
    
    li $v0, 4          
    la $a0, val_prompt 
    syscall
  
    li $v0, 5         
    syscall
    sw $v0, temp       

    lw $t2, temp
    mult $t2, $t2     
    mflo $t2           
    add $t3, $t3, $t2  

    addi $t0, $t0, 1    
    b m1

m3:
 
    move $a0, $t3       
    li $v0, 1           
    syscall

    li $v0, 10         
    syscall
