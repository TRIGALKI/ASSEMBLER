.data
aa: .float +4.5 #������� �
bb: .float +5.5 #������� �
cc: .float 0.5 #����������� 
alpha: .float +0.85090352453 #�������� ������ ���� 45 �������� ��� ��� � ����� ��� ���������� ��� ���������� ������
s: .float 0 #���������
head_A: .asciiz "s"

.text
 lwc1 $f1, aa # ��������� �� ���������� � � ������� $f1
 lwc1 $f2, bb # ��������� �� ���������� � � ������� $f2
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