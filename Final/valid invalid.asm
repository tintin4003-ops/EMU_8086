.MODEL SMALL
.STACK 100H

.DATA

MSG1 DB 'Valid input$'
MSG2 DB 'Invalid input$'

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    
    MOV AH, 01H
    INT 21H

    MOV BL, AL

    ;uppercase A-Z 
    
    CMP BL, 'A'
    JL CHECK_DIGIT

    CMP BL, 'Z'
    JLE VALID


CHECK_DIGIT:

    ; Check digit 0-9
    
    CMP BL, '0'
    JL INVALID

    CMP BL, '9'
    JG INVALID


VALID:

    MOV AH, 02H
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H

    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    JMP EXIT


INVALID:

    MOV AH, 02H
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H

    LEA DX, MSG2
    MOV AH, 09H
    INT 21H


EXIT:

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN