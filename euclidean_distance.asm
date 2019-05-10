.data
    x1: .asciiz "\nEnter x1: "
    y1: .asciiz "\nEnter y1: "
    x2: .asciiz "\nEnter x2: "
    y2: .asciiz "\nEnter y2: "
    result: .asciiz "\nDistance is:  "
.text
    main: 
        # begin data assignment from inputs
        li $v0, 4
        la $a0, x1
        syscall

        li $v0,5
        syscall

        move $t1, $v0

        li $v0, 4
        la $a0, y1
        syscall

        li $v0,5
        syscall

        move $t2, $v0

        li $v0, 4
        la $a0, x2
        syscall

        
        li $v0,5
        syscall

        move $t3, $v0

        li $v0, 4
        la $a0, y2
        syscall

        li $v0,5
        syscall

        move $t4, $v0
        # END
        # t1= x1, t2 =y1, t3= x2, t4= y2

        sub $s0,$t1,$t2 # s0 = (x1-y1) 
		sub $s1,$t3,$t4 # s1 = (x2-y2) 
		
		mul $s0,$s0,$s0 # s0^2 square the first one
		mul $s1,$s1,$s1 # s1^2 square the second
    
        add $s2, $s0, $s1   # $s2 is the distance, now take the sqrt root
        
        # do some sqouring magic that took too much math
        move $a0, $s2
        
        jal dosQrt

        dosQrt:
            move  $v0, $zero        # initalize return
            move  $t1, $a0 

            addi  $t0, $zero, 1
            sll   $t0, $t0, 30 

        sqrt_bit:
            slt   $t2, $t1, $t0 
            beq   $t2, $zero, sqrt_loop

            srl   $t0, $t0, 2 
            j     sqrt_bit

        sqrt_loop:
            beq   $t0, $zero, exit

            add   $t3, $v0, $t0
            slt   $t2, $t1, $t3
            beq   $t2, $zero, sqrt_else

            srl   $v0, $v0, 1 
            j     sqrt_loop_end

        sqrt_else:
            sub   $t1, $t1, $t3
            srl   $v0, $v0, 1
            add   $v0, $v0, $t0

        sqrt_loop_end:
            srl   $t0, $t0, 2 
            j     sqrt_loop

        exit:
            move $t0, $v0

            li $v0, 4
            la $a0, result
            syscall

            # lets print the magics result
            li $v0, 1
            move $a0, $t0
            syscall

            li $v0,10
            syscall

