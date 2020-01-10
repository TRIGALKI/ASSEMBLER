.data
arr: .word 1 2 3 4 5 6 7 8 9
size: .word 9
fail: .asciiz "\n all elements are same "
sucsess: .asciiz "\n distance between max and min = "

.text
addi $sp,$sp,-8 # выделяем место в стеке для сохранения 2-х аргументов
addi $s0,$0,32767 # задаем аргумент
sw $s0,4($sp) # сохраняем в стеке аргумент
addi $s0,$0,-32768 # задаем аргумент2
sw $s0,0($sp) # сохраняем в стеке аргумент2
jal funct # вызываем процедуру

funct:
la $t0, arr		# load address of array – initial index [i]
la $t5, size		 # load address of size variable
lw $t5, 0($t5)		 # load array size in the same register
lw $s1,4($sp) # min
lw $s2,0($sp) # max
#li $s1, 32767		
#li $s2, -32768	
addi $sp,$sp,8 # очищаем место в стеке
loop:   lw $t3, 0($t0)  # get value from array mas[i] into register $t3
 	blt $t3, $s1, min  # branch if less than
	bgt $t3, $s2, max  # branch if greater than
	j GoTo
	min:
		add $s1, $zero, $t3  # +
		bgt $t3, $s2, max
 		j GoTo
 	max:
		add $s2, $zero, $t3  # +
 		j GoTo
	GoTo:
		addi $t0, $t0, 4 
		addi $t5, $t5, -1
 		bgtz $t5, loop	# Branch on greater than zero
beq $s1, $s2, NotGood  # Branch on equal
j Good
NotGood:
	la $a0, fail
	li $v0, 4
	syscall
	j rip
Good:
	sub $s3, $s2, $s1	# scary outpoot
	la $a0, sucsess
	li $v0, 4
	syscall
	add $a0, $s3, $zero	# spooky ( 
	li $v0, 1
	syscall
rip:
