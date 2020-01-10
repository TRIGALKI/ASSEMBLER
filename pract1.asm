.386
.model flat, stdcall
option casemap :none
include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
.data
MEM1 DW 10 ;переменная в памяти размером Word=16 бит=2 Байт
MEM2 DW 10 ;переменная в памяти размером 2 Байт
MEM3 DW 10 ;
str1 db "результат программы",0 ;строка в памяти, заданная побайтно (db)
str2 db "число МЕМ1 самое большое",0
str3 db "число МЕМ2 самое большое",0
str4 db "число MEM3 cамое большое",0
.code
start: ;Метка начала программы
SUB DX,DX ;Вычитание содержимого регистра DX из самого себя (обнуление).
;Результат помещается на место первого операнда: DX=DX-EDX.                 
MOV AX,MEM1 ;Занесение содержимого из ячейки ОП с адресом МЕМ1 в регистр АХ.
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


