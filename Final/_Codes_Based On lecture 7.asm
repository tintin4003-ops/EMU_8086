
.MODEL SMALL
.STACK 100H

.DATA
    msg_and1  DB 'AND: C5h AND 7Fh = $'
    msg_and2  DB 'AND: ASCII 5 to decimal = $'
    msg_and3  DB 'AND: a to uppercase = $'
    msg_or1   DB 'OR : 4Ch OR 81h = $'
    msg_or2   DB 'OR : 5 to ASCII = $'
    msg_xor1  DB 'XOR: ABCDh XOR itself = $'
    msg_not1  DB 'NOT: AAh flipped = $'
    msg_even  DB 'TEST: 24 is EVEN$'
    msg_odd   DB 'TEST: number is ODD$'
    msg_shl1  DB 'SHL: 5 SHL 1 = $'
    msg_shl2  DB 'SHL: 5 SHL 2 = $'
    msg_shl3  DB 'SHL: 8Ah SHL 3 = $'
    msg_shr1  DB 'SHR: 20 SHR 1 = $'
    msg_shr2  DB 'SHR: 8Ah SHR 2 = $'
    msg_sar1  DB 'SAR: F1h SAR 1 = $'
 
    newline   DB 0Dh, 0Ah, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX


; AND: clear sign bit  C5h AND 7Fh = 45h


    LEA DX, msg_and1
    MOV AH, 09h
    INT 21h

    MOV AL, 0C5h
    AND AL, 7Fh

    MOV BL, AL
    MOV CL, 4
    SHR AL, CL
    CMP AL, 9
    JLE A1H
    ADD AL, 7

A1H:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    MOV AL, BL
    AND AL, 0Fh
    CMP AL, 9
    JLE A1L
    ADD AL, 7

A1L:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    LEA DX, newline
    MOV AH, 09h
    INT 21h

; AND: ASCII '5' to decimal  35h AND 0Fh = 05h

    LEA DX, msg_and2
    MOV AH, 09h
    INT 21h

    MOV AL, '5'
    AND AL, 0Fh

    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    LEA DX, newline
    MOV AH, 09h
    INT 21h


; AND: lowercase to uppercase 61h AND DFh = 41h = 'A'

    LEA DX, msg_and3
    MOV AH, 09h
    INT 21h

    MOV AL, 'a'
    AND AL, 0DFh

    MOV DL, AL
    MOV AH, 02h
    INT 21h
    LEA DX, newline
    MOV AH, 09h
    INT 21h

; OR: set MSB and LSB  4Ch OR 81h = CDh

    LEA DX, msg_or1
    MOV AH, 09h
    INT 21h

    MOV AL, 4Ch
    OR  AL, 81h

    MOV BL, AL
    MOV CL, 4
    SHR AL, CL
    CMP AL, 9
    JLE O1H
    ADD AL, 7         
    
O1H:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    MOV AL, BL
    AND AL, 0Fh
    CMP AL, 9
    JLE O1L
    ADD AL, 7  
    
O1L:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    LEA DX, newline
    MOV AH, 09h
    INT 21h


; OR: decimal 5 to ASCII 05h OR 30h = 35h = '5'

    LEA DX, msg_or2
    MOV AH, 09h
    INT 21h

    MOV AL, 5
    OR  AL, 30h

    MOV DL, AL
    MOV AH, 02h
    INT 21h
    LEA DX, newline
    MOV AH, 09h
    INT 21h


; XOR: ABCDh XOR ABCDh = 0000h

    LEA DX, msg_xor1
    MOV AH, 09h
    INT 21h

    MOV AX, 0ABCDh
    XOR AX, AX

    MOV DL, '0'
    MOV AH, 02h
    INT 21h
    LEA DX, newline
    MOV AH, 09h
    INT 21h


; NOT: AAh  55h (10101010 → 01010101)

    LEA DX, msg_not1
    MOV AH, 09h
    INT 21h

    MOV AL, 0AAh
    NOT AL

    MOV BL, AL
    MOV CL, 4
    SHR AL, CL
    CMP AL, 9
    JLE N1H
    ADD AL, 7
    
N1H:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    MOV AL, BL
    AND AL, 0Fh
    CMP AL, 9
    JLE N1L
    ADD AL, 7 
    
N1L:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    LEA DX, newline
    MOV AH, 09h
    INT 21h


; TEST: bit 0 of 24 = 0 

    MOV AL, 24
    TEST AL, 1
    JZ   EVEN
    LEA DX, msg_odd
    MOV AH, 09h
    INT 21h
    JMP  DONE_TEST
EVEN:
    LEA DX, msg_even
    MOV AH, 09h
    INT 21h
DONE_TEST:
    LEA DX, newline
    MOV AH, 09h
    INT 21h

;SHL

    LEA DX, msg_shl1
    MOV AH, 09h
    INT 21h

    MOV AL, 5
    SHL AL, 1

    MOV BL, AL
    MOV CL, 4
    SHR AL, CL
    CMP AL, 9
    JLE S1H
    ADD AL, 7

S1H:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    MOV AL, BL
    AND AL, 0Fh
    CMP AL, 9
    JLE S1L
    ADD AL, 7

S1L:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    LEA DX, newline
    MOV AH, 09h
    INT 21h

; SHL: 5 SHL 2 = 14h = 20

    LEA DX, msg_shl2
    MOV AH, 09h
    INT 21h

    MOV AL, 5
    MOV CL, 2
    SHL AL, CL

    MOV BL, AL
    MOV CL, 4
    SHR AL, CL
    CMP AL, 9
    JLE S2H
    ADD AL, 7

S2H:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    MOV AL, BL
    AND AL, 0Fh
    CMP AL, 9
    JLE S2L
    ADD AL, 7

S2L:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    LEA DX, newline
    MOV AH, 09h
    INT 21h


; SHL: 8Ah SHL 3 = 50h

    LEA DX, msg_shl3
    MOV AH, 09h
    INT 21h

    MOV AL, 8Ah
    MOV CL, 3
    SHL AL, CL

    MOV BL, AL
    MOV CL, 4
    SHR AL, CL
    CMP AL, 9
    JLE S3H
    ADD AL, 7

S3H:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    MOV AL, BL
    AND AL, 0Fh
    CMP AL, 9
    JLE S3L
    ADD AL, 7
S3L:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    LEA DX, msg_shr1
    MOV AH, 09h
    INT 21h

    MOV AL, 20
    SHR AL, 1

    MOV BL, AL
    MOV CL, 4
    SHR AL, CL
    CMP AL, 9
    JLE R1H
    ADD AL, 7
R1H:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    MOV AL, BL
    AND AL, 0Fh
    CMP AL, 9
    JLE R1L
    ADD AL, 7
R1L:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    LEA DX, newline
    MOV AH, 09h
    INT 21h


    LEA DX, msg_shr2
    MOV AH, 09h
    INT 21h

    MOV AL, 8Ah
    MOV CL, 2
    SHR AL, CL

    MOV BL, AL
    MOV CL, 4
    SHR AL, CL
    CMP AL, 9
    JLE R2H
    ADD AL, 7
R2H:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    MOV AL, BL
    AND AL, 0Fh
    CMP AL, 9
    JLE R2L
    ADD AL, 7
R2L:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    LEA DX, msg_sar1
    MOV AH, 09h
    INT 21h

    MOV AL, 0F1h
    SAR AL, 1

    MOV BL, AL
    MOV CL, 4
    SHR AL, CL
    CMP AL, 9
    JLE T1H
    ADD AL, 7
T1H:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    MOV AL, BL
    AND AL, 0Fh
    CMP AL, 9
    JLE T1L
    ADD AL, 7
T1L:ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
