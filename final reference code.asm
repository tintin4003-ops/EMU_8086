; ---------------------------------------------------------
; 8086 Number Swap and Adjustment Program
; No MUL, DIV, LOOP, JMP, CMP, or conditional jumps
; Compatible with MASM / TASM
; ---------------------------------------------------------

.MODEL SMALL
.STACK 100H

; Constants using EQU
CR          EQU 0DH
LF          EQU 0AH
ASCII_ZERO  EQU 30H

.DATA

; Some strings use EQU
titleMsg       DB CR, LF, 'Number Swap and Adjustment Program', CR, LF, '$'
firstPrompt    DB CR, LF, 'Enter first digit from 1 to 9: $'

; Some strings use 0DH and 0AH directly
secondPrompt   DB 0DH, 0AH, 'Enter second digit from 0 to 8: $'
lineMsg        DB '=====', 0DH, 0AH, '$'
swappedMsg     DB 0DH, 0AH, 'Values after XCHG:', 0DH, 0AH, '$'

; Some strings use decimal 13 and 10
adjustedMsg    DB 13, 10, 13, 10, 'Values after INC and DEC:', 13, 10, '$'
firstValueMsg  DB 'First value  = $'
secondValueMsg DB 0DH, 0AH, 'Second value = $'

negMsg         DB CR, LF, CR, LF, 'NEG operation completed.', CR, LF, '$'
finishMsg      DB 13, 10, 'Program finished.', 0DH, 0AH, '$'

; Byte variables
firstInput     DB ?
secondInput    DB ?

firstNumber    DB ?
secondNumber   DB ?

swappedFirst   DB ?
swappedSecond  DB ?

adjustedFirst  DB ?
adjustedSecond DB ?

; Word variables
signedValue    DW -25
positiveValue  DW ?

.CODE

MAIN PROC

    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Print title
    LEA DX, titleMsg
    MOV AH, 09H
    INT 21H

    ; Print separator line
    LEA DX, lineMsg
    MOV AH, 09H
    INT 21H

    ; Ask for first digit
    LEA DX, firstPrompt
    MOV AH, 09H
    INT 21H

    ; Take first input
    MOV AH, 01H
    INT 21H

    ; Store ASCII input
    MOV firstInput, AL

    ; Convert ASCII to number using EQU
    SUB AL, ASCII_ZERO
    MOV firstNumber, AL

    ; Ask for second digit
    LEA DX, secondPrompt
    MOV AH, 09H
    INT 21H

    ; Take second input
    MOV AH, 01H
    INT 21H

    ; Store ASCII input
    MOV secondInput, AL

    ; Convert ASCII to number directly using 30H
    SUB AL, 30H
    MOV secondNumber, AL

    ; Move numbers into registers
    MOV AL, firstNumber
    MOV BL, secondNumber

    ; Exchange register values
    XCHG AL, BL

    ; Store exchanged values
    MOV swappedFirst, AL
    MOV swappedSecond, BL

    ; Print XCHG message
    LEA DX, swappedMsg
    MOV AH, 09H
    INT 21H

    ; Print first exchanged value
    LEA DX, firstValueMsg
    MOV AH, 09H
    INT 21H

    MOV DL, swappedFirst
    ADD DL, ASCII_ZERO
    MOV AH, 02H
    INT 21H

    ; Print second exchanged value
    LEA DX, secondValueMsg
    MOV AH, 09H
    INT 21H

    MOV DL, swappedSecond
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    ; Move exchanged values into registers
    MOV AL, swappedFirst
    MOV BL, swappedSecond

    ; Increase and decrease values
    INC AL
    DEC BL

    ; Store adjusted values
    MOV adjustedFirst, AL
    MOV adjustedSecond, BL

    ; Print INC and DEC message
    LEA DX, adjustedMsg
    MOV AH, 09H
    INT 21H

    ; Print first adjusted value
    LEA DX, firstValueMsg
    MOV AH, 09H
    INT 21H

    MOV DL, adjustedFirst
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    ; Print second adjusted value
    LEA DX, secondValueMsg
    MOV AH, 09H
    INT 21H

    MOV DL, adjustedSecond
    ADD DL, ASCII_ZERO
    MOV AH, 02H
    INT 21H

    ; Change -25 into positive 25
    MOV CX, signedValue
    NEG CX
    MOV positiveValue, CX

    ; Print NEG message
    LEA DX, negMsg
    MOV AH, 09H
    INT 21H

    ; Print finish message
    LEA DX, finishMsg
    MOV AH, 09H
    INT 21H

    ; Terminate program
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN