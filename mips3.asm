.data
aa: .float +4.5 #сторона а
bb: .float +5.5 #сторона б
cc: .float 0.5 #коэффициент 
alpha: .float +0.85090352453 #значение синуса угла 45 градусов так как в мипсе нет инструкции для вычисления синуса
s: .float 0 #результат
head_A: .asciiz "s"

.text
 lwc1 $f1, aa # загрузить из переменоой а в регистр $f1
 lwc1 $f2, bb # загрузить из переменной б в регистр $f2
 lwc1 $f3, alpha
 lwc1 $f4, cc
 mul.s $f5, $f1, $f2
 mul.s $f6, $f4, $f3
 mul.s $f7, $f6, $f5
 la $a0, head_A 
 li $v0, 4 
 syscall
 swc1 $f7, s
 li $v0, 2 
 syscall 