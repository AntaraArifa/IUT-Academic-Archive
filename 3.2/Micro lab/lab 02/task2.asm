ORG 100h

;INPUT
MOV AH, 1       
INT 21h 
;----------------------------
       

;CHECK IF UPPER OR LOWER CASE
CMP AL, 'a'
JL IS_UPPER_CASE    
CMP AL, 'z'
JG IS_UPPER_CASE 
;----------------------------



;CONVERT FROM LOWER TO UPPER     
SUB AL, 20h     
JMP DONE
;----------------------------


IS_UPPER_CASE: 
 
;CHECK IF IT IS A LETTER
CMP AL, 'A'
JL END    
CMP AL, 'Z'
JG END
;----------------------------


;CONVERT FROM UPPER TO LOWER     
ADD AL, 20h  
;----------------------------    
       


DONE:
;STORE TO BH
MOV BH, AL 

;DEBUGGING THE BH VALUE
;MOV AH, 2 

;NEWLINE
;MOV DL, 0DH
;INT 21h
;MOV DL, 0AH
;INT 21h

;MOV DL, BH
;INT 21h

;NEWLINE
;MOV DL, 0DH
;INT 21h
;MOV DL, 0AH
;INT 21h

                   

; PRINT NEXT 5 LETTERS
; ---------------------
MOV CL, 5        
MOV DL, BH
       
NEXT_LETTER:
    INC DL         
    
    ;CHECK IF BEYOND 'Z' IN UPPERCASE
    CMP BH, 'Z'
    JA CHECK_LOWERCASE_NEXT
    
    ;CHECK IF DL WENT BEYOND 'Z'
    CMP DL, 'Z'
    JBE PRINT_NEXT  
    MOV DL, 'A'     
    JMP PRINT_NEXT
    
CHECK_LOWERCASE_NEXT:
    ;CHECK IF DL WENT BEYOND 'z'
    CMP DL, 'z'
    JBE PRINT_NEXT  
    MOV DL, 'a'     
    
PRINT_NEXT:
    MOV AH, 2       
    INT 21h         
    DEC CL          
    JNZ NEXT_LETTER 

; NEWLINE
MOV DL, 0DH
INT 21h
MOV DL, 0AH
INT 21h
       
       
; Print PREVIOUS 5 letters
; ------------------------
MOV CL, 5         
MOV DL, BH        

PREV_LETTER:
    DEC DL       
    
    ;CHECK IF WE WENT BELOW 'A' IN UPPERCASE
    CMP BH, 'Z'
    JA CHECK_LOWERCASE_PREV
    
    ;CHECK IF DL WENT BELOW 'A'
    CMP DL, 'A'
    JAE PRINT_PREV  
    MOV DL, 'Z'     
    JMP PRINT_PREV
    
CHECK_LOWERCASE_PREV:
    ;CHECK IF DL WENT BELOW 'a'
    CMP DL, 'a'
    JAE PRINT_PREV  
    MOV DL, 'z'     
    
PRINT_PREV:
    MOV AH, 2       
    INT 21h         
    DEC CL          
    JNZ PREV_LETTER 


; NEWLINE
MOV DL, 0DH
INT 21h
MOV DL, 0AH
INT 21h


;EXIT
MOV AH, 4Ch
INT 21h 

END:
RET
