.386
.model flat, stdcall
option casemap :none
include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
.data
MEM1 DW 10 ;���������� � ������ �������� Word=16 ���=2 ����
MEM2 DW 10 ;���������� � ������ �������� 2 ����
MEM3 DW 10 ;
str1 db "��������� ���������",0 ;������ � ������, �������� �������� (db)
str2 db "����� ���1 ����� �������",0
str3 db "����� ���2 ����� �������",0
str4 db "����� MEM3 c���� �������",0
.code
start: ;����� ������ ���������
SUB DX,DX ;��������� ����������� �������� DX �� ������ ���� (���������).
;��������� ���������� �� ����� ������� ��������: DX=DX-EDX.                 
MOV AX,MEM1 ;��������� ����������� �� ������ �� � ������� ���1 � ������� ��.
CMP AX,MEM2
jg one
jl two
one:
MOV BX,MEM3
CMP BX,AX
jg one1
jl one2
one1:
invoke MessageBox, NULL, addr str4, addr str1, MB_OK
invoke ExitProcess, NULL
one2:
invoke MessageBox, NULL, addr str2, addr str1, MB_OK
invoke ExitProcess, NULL
two:
MOV BX,MEM3
CMP BX,MEM2
jg two1
jl two2
two1:
invoke MessageBox, NULL, addr str4, addr str1, MB_OK
invoke ExitProcess, NULL
two2:
invoke MessageBox, NULL, addr str3, addr str1, MB_OK
invoke ExitProcess, NULL
end start;


