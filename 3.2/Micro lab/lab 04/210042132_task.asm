org 100h

.DATA

    numbers db 1, 2, 3, 4, 5, 6, 7, 8, 9 
    RESULT dw 0                            
    input_msg db 'Enter the value of N (2-9):$'
    output_msg db 0Dh, 0Ah, 'The result is: $'
    newline db 0Dh, 0Ah, '$'

.CODE 

MAIN PROC

    mov ax, @DATA
    mov ds, ax

    mov ah, 09h
    lea dx, input_msg
    int 21h

    mov ah, 01h
    int 21h
    sub al, 48
    mov cl, al

    xor ax, ax
    xor bx, bx
    mov si, 0

Loop_1:
    mov bl, numbers[si]
    mov al, bl
    mul bl
    add RESULT, ax
    inc si
    loop Loop_1

    mov ah, 09h
    lea dx, output_msg
    int 21h

    mov ax, RESULT
    call DisplayNumber

    mov ah, 09h
    lea dx, newline
    int 21h

    mov ah, 4Ch
    int 21h

MAIN ENDP



DisplayNumber PROC
    push ax
    push bx
    push cx
    push dx

    mov bx, 10
    xor cx, cx

ConvertLoop:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz ConvertLoop

DisplayLoop:
    pop dx
    add dl, 48
    mov ah, 02h
    int 21h
    loop DisplayLoop

    pop dx
    pop cx
    pop bx
    pop ax
    ret
DisplayNumber ENDP

END MAIN
RET
