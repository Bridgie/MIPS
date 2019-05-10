.data
    num_1_prompt: .asciiz "Enter number 1:"
    num_2_prompt: .asciiz "\nEnter number 2:"
    result: .asciiz "\nResult: "
    num1: .space 8
    num2: .space 8
.text
    main:
        li $v0, 4
        la $a0, num_1_prompt
        syscall

        li $v0,8
        la $a0, num1
        li $a1, 8
        move $s0, $a0
        syscall

        la $a0, num1
        li $v0, 4
        move $a0, $s0
        syscall
        
        li $v0, 4
        la $a0, num_2_prompt
        syscall

        li $v0,8
        la $a0, num2
        li $a1, 8
        move $s1, $a0
        syscall

        la $a0, num2
        li $v0, 4
        move $a0, $s1
        syscall

        li $t1, 0
        li $t2, 0
        
        loop:
            lb $s2, 0($s0)
            lb $s3, 0($s1)

            beq $s2, $zero, exit

            bne $s2, $s3, increment

            addi $s0,$s0, 1
            addi $s1,$s1, 1

            j loop
        increment:
            addi $t1, $t1, 1
            addi $s0, $s0, 1
            addi $s1, $s1, 1

            j loop 

        exit:
            li $v0, 4
            la $a0, result
            syscall


            li $v0, 1
            move $a0, $t1
            syscall   

            li $v0,10
            syscall   


        

        

