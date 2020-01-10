.data
	arrayA: .word 128 170 199 254 255
	aSize: .word 20
	arrayB: .space 5
	
	newLine: .asciiz "\n"
.text
	# $t0 is index value
	move $t0, $zero
	lw $t7, aSize
	
	li $s0, 128    # ref to get highest bit value
	
	while:
		bge $t0, $t7, exit
		lw $t1, arrayA($t0)	   # get ith element
		li $s1, 8    # ind of highest 0 bit
		
		shiftWhile:
			and	$t2, $t1, $s0	# store last bit in $t2
			beq $t2, $zero, exitShift	# if it is 0 exit shiftWhile
			
			# else shift and sub from counter
			sll $t1, $t1, 1
			sub $s1, $s1, 1
			
			bnez $s1, shiftWhile
		exitShift:
		
		sw $s1, arrayB($t0)
		
		addi $t0, $t0, 4
		j while
	exit:
		
		li $t0, 0
		
		whileB:
			bge $t0, $t7, exitB
			
			li $v0, 1
			lw $a0, arrayB($t0)
			syscall
			
			li $v0, 4
			la $a0, newLine
			syscall
			
			addi $t0, $t0, 4
			j whileB
		exitB:
	
		li $v0, 10
		syscall
