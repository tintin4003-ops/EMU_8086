.MODEL SMALL
.STACK 100H

.DATA

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX


    
    MOV AH, 01H
    INT 21H

    SUB AL, 30H
    MOV BL, AL

    MOV AH, 02H
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H


    
    MOV AH, 01H
    INT 21H

    SUB AL, 30H
    MOV BH, AL

    MOV AH, 02H
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H


    
    MOV AH, 01H
    INT 21H

    SUB AL, 30H
    MOV CL, AL


    
    MOV AL, BL

    
    CMP AL, BH
    JGE CHECK_THIRD

    MOV AL, BH


CHECK_THIRD:

    
    CMP AL, CL
    JGE PRINT_RESULT

    MOV AL, CL


PRINT_RESULT:

    MOV BL, AL

    
    ADD BL, 30H

    
    MOV AH, 02H
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H

    
    MOV DL, BL
    MOV AH, 02H
    INT 21H


    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN