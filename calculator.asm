.data 
    num_1_prompt: .asciiz "Enter number 1:"
    num_2_prompt: .asciiz "\nEnter number 2:"
    operator_prompt: .asciiz "\nEnter Operator: (1) + (2) - (3) *(4) / "
    sum: .asciiz "\nResult: "
    again_prompt: .asciiz "\nAgain? (1) Yes (0) No "
    
    num1: .word 4
    num2: .word 4
    operator: .word 4
    again: .word 4
    result: .word 4

.text
    main: 
        li $v0, 4
        la $a0, num_1_prompt
        syscall

        li $v0,5
        syscall

        sw $v0, num1
        
        li $v0, 4
        la $a0, num_2_prompt
        syscall

        li $v0,5
        syscall

        sw $v0, num2

        li $v0, 4
        la $a0, operator_prompt
        syscall

        li $v0,5
        syscall

        sw $v0, operator

        move $t0, $v0

        addi $t1, 1
        addi $t2, 2
        addi $t3, 3
        addi $t4, 4

        beq $t0, $t1, addition
        beq $t0, $t2, subtraction
        beq $t0, $t3, multiplication
        beq $t0, $t4, division

        
        li $v0, 10
        syscall
    addition:
        lw $t0, num1
        lw $t1, num2
        add $t2, $t0, $t1
        sw $t2, result
        j printResult
        jr $ra
    subtraction:
        lw $t0, num1
        lw $t1, num2
        sub $t2, $t0, $t1
        sw $t2, result
        j printResult
        jr $ra
    multiplication:
        lw $t0, num1
        lw $t1, num2
        mul $t2, $t0, $t1
        sw $t2, result
        j printResult
        jr $ra
    division:
        lw $t0, num1
        lw $t1, num2
        div $t2, $t0, $t1
        sw $t2, result
        j printResult
        jr $ra
    printResult:
        li $v0, 1
        lw $a0, result
        syscall
        jr $ra
