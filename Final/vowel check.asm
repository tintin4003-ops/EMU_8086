.MODEL SMALL
.STACK 100H

.DATA
    MES DB 'Enter a letter: $'
    V   DB 10,13,'Vowel$'
    C   DB 10,13,'Consonant$'
    I   DB 10,13,'INVALID$'

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; Display message
    MOV AH, 9
    LEA DX, MES
    INT 21H

    ; Take one character input
    MOV AH, 1
    INT 21H
    MOV BL, AL

    ; Check uppercase A-Z
    CMP BL, 'A'
    JL INV

    CMP BL, 'Z'
    JLE CHECK_VOWEL

    ; Check lowercase a-z
    CMP BL, 'a'
    JL INV

    CMP BL, 'z'
    JG INV


CHECK_VOWEL:

    CMP BL, 'A'
    JE VOL
    CMP BL, 'E'
    JE VOL
    CMP BL, 'I'
    JE VOL
    CMP BL, 'O'
    JE VOL
    CMP BL, 'U'
    JE VOL

    CMP BL, 'a'
    JE VOL
    CMP BL, 'e'
    JE VOL
    CMP BL, 'i'
    JE VOL
    CMP BL, 'o'
    JE VOL
    CMP BL, 'u'
    JE VOL

    ; Otherwise consonant
    MOV AH, 9
    LEA DX, C
    INT 21H
    JMP EXIT


VOL:
    MOV AH, 9
    LEA DX, V
    INT 21H
    JMP EXIT


INV:
    MOV AH, 9
    LEA DX, I
    INT 21H


EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN