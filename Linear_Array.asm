.data
    prompt: .asciiz "Number of integers "
.text

    main:
        #print prompt
        la $a0 prompt
        li $v0 4
        syscall

        #get int
        li $v0 5
        syscall

        #allocate space
        sll $a0 $v0 2 #number of bytes now in $a0
        li  $v0 9
        syscall 
        
        #address of space now in $v0
        
         li  $v0 10
        syscall 
