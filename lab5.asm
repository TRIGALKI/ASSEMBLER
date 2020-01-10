.386
.model flat, stdcall       
option casemap :none          
include \masm32\include\windows.inc 
include \masm32\include\user32.inc 
include \masm32\include\kernel32.inc 
include \masm32\include\fpu.inc ; 
includelib \masm32\lib\user32.lib 
includelib \masm32\lib\kernel32.lib 
includelib \masm32\lib\fpu.lib ;   
.data  
A  DD +4.0 ; катет а
DROB DD +0.5 ; коэффицент 
ALPHA DD +0.1 ; угол
res DT  0  ;ответ 
str1 db "Результат работы программы",0
str2 db "дробное число:            ",0

.CODE 
start: 
push A 
push DROB 
push ALPHA 
call result 
FSTP res                 
invoke FpuFLtoA, addr res, 5, addr str2+16, SRC1_REAL or SRC2_DIMM or STR_REG
invoke MessageBox,0, addr str2, addr str1, MB_OK
invoke ExitProcess, NULL 
result proc
    push esp ;Сохранение регистра esp
    FLD dword ptr [esp+8]
    FPTAN
    FMUL dword ptr [esp+12] 
    FMUL dword ptr [esp+16]
    FMUL dword ptr [esp+16]
    pop esp  ;Восстановление регистра esp
    ret 12 ;Возврат с извлечением параметров из стека
result endp 
end start
