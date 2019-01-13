  .data
array:  .space 20
prompt: .asciiz "Enter integer (0 to break) :\n"
text:   .asciiz "List:"
space: .asciiz " "
  
.text
    .globl main
main:

    li $v0, 4 
    la $a0, prompt
    syscall
    
    la $a1, array
	    
	
read_numbers:


    li $v0, 5
    syscall

    sw $v0, 0($a1)
    addiu $a1, $a1, 4

    beqz $v0, sort
    j read_numbers

sort:
    la $a1, array

    li $v0, 4
    la $a0, text
    syscall

while:
    lw $t0, 0($a1)
    addiu $a1, $a1, 4

    beqz $t0, done

    li $v0, 1
    move $a0, $t0
    syscall
	
 li $v0, 4 #string
	la $a0, space 
	syscall	 
    j while
    
  rev:
  	la $a1, array 
  	# $s0 = i
  	# 19- i	
  	# t1 = temp
  	addi $s0, $0, 0
  	addi $a0, $0, 10
  	
  	
  	for:
  		slt $t0, $s1, $t1
  		beq $t0, $0, end
  		
  		sll $t0, $s1, 2
  		add $t0, $t0, $a1
  		lw $t1, 0($t0)
  		
  		#t2 = 19-i
  		sub $s2, $s1, 19
  		sll $t2, $s2, 2
  		add $t2, $t2, $a1 #addr of arr (19-i)
  		lw  $t3, 0($t2), # $t3 = arr(19-i)
  		
  		sw $t3, 0($t0) #arr(i) = 19-i value
  		
  		sw $t1, 0($t2) #
  		addi $s1, $s1, 1
  		j for
  		
  	end:
		la $a1 prompt
       		 li $v0 4
	        syscall
  
    j rev



done:	
	li $v0, 10
	syscall	 
	
