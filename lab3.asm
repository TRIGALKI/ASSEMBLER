.586
 .model flat, stdcall
 option casemap :none ; case sensitive
;-------------------------------------------------
 include \masm32\include\windows.inc
 include \masm32\include\user32.inc
 include \masm32\include\kernel32.inc
 include \masm32\include\fpu.inc ;
 includelib \masm32\lib\user32.lib
 includelib \masm32\lib\kernel32.lib
 includelib \masm32\lib\fpu.lib ;
;---------------------------------------------
 .data
BD DD -9910.08 
str1 db "��������� ������ ���������",0
str2 db "������� �����:            ",0
A DD       +4.0 ;����� �
DROB DD    +0.5 ; ���������� 
ALPHA DD   +1.0 ; ����
S DT 0.0 ; �����
;-----------------------------------------------

.code
start:

FLD ALPHA
FPTAN
FMUL A
FMUL A
FMUL DROB
FSTP S ; ������ ����������
invoke FpuFLtoA, addr S, 5, addr str2+16, SRC1_REAL or SRC2_DIMM or STR_REG
invoke MessageBox,0, addr str2, addr str1, MB_OK
invoke ExitProcess, NULL
end start ;����� ���������