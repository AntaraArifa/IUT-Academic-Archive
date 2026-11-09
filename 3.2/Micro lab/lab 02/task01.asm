ORG 0100h

MAIN PROC
    
    MOV AH, 1
    INT 21h
    MOV BL, AL
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
    
    MOV AL, BL
    AND AL, 01h
    
    CMP AL, 0
    JZ PRINT_EVEN
    
    MOV AH, 2
    MOV DL, 'O'
    INT 21h
    JMP EXIT
    

PRINT_EVEN:
    MOV AH, 2
    MOV DL, 'E'
    INT 21h
    
    
EXIT:
    
    MOV AH, 4CH
    INT 21h
    
    
MAIN ENDP
END MAIN