.MODEL SMALL
.STACK 100H
 
.DATA
 
.CODE
 
MAIN PROC
 
    MOV AX, @DATA
    MOV DS, AX
 
    MOV CX,0;         
 
    JCXZ SKIP  
 
TOP:
 
    MOV AH, 02H
    MOV DL, '*'
    INT 21H
 
    LOOP TOP
 
SKIP:               
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h          
    MOV CX,0
   JCXZ EXIT
 
TOP1:
    MOV AH, 2
    MOV DL, 'A'
    INT 21H
 
LOOP TOP1

EXIT:           
    MOV AH, 4CH
    INT 21H
 
MAIN ENDP
END MAIN




