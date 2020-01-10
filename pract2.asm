.386
.model flat, stdcall
 option casemap :none
 include \masm32\include\windows.inc
 include \masm32\include\user32.inc
 include \masm32\include\kernel32.inc
 includelib \masm32\lib\user32.lib
 includelib \masm32\lib\kernel32.lib
.data
    A DD 0FFFFFFFFh,0FFFFFFFFh, 0FFFFFFFFh, 0FFFFF0FFh

    B DD -1, -1, -1, -1
    total DD 0
    k dd 4
    head db "result",0
    true db "Массив полон",0
    false db "в массиве А  элементов без нулей - %.1hu",0
    result byte 50 dup(?)
.code
start:
    MOV ECX, k
    XOR EBX, EBX
    XOR ESI,ESI
    loop1:
        XOR EDX, EDX ;Подсчёт номера бита
        MOV EAX, A[ESI]
        CMP EAX, 0FFFFFFFFh
        jz one
        for_bit:
            test eax, 080000000h
            jz zero
            inc edx
            shl eax, 1
            jmp for_bit
        zero:
            mov B[esi], edx
            jmp next
        one:
            inc total
        next:
            add esi,4
        loop loop1
    cmp total, 0
    jz fine
    jmp fail
fine:
    invoke MessageBox, NULL, addr true, addr head, MB_OK
    jmp close
fail:
    invoke wsprintf, addr result, addr false, total
    invoke MessageBox, NULL, addr result, addr head, MB_OK
close:
    invoke ExitProcess, NULL
end start