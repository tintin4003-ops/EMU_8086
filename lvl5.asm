.model small
.stack 100h
.data
    PROMPT1 db 'Enter Num 1: $'
    PROMPT2 db 10, 13, 'Enter Num 2: $' ; Includes newline bytes inside data!
    RESULT  db 10, 13, 'Sum = $'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; --- Get First Digit ---
    mov ah, 9h
    lea dx, PROMPT1
    int 21h
    
    mov ah, 1h       ; Read first char digit into AL
    int 21h          
    sub al, 48       ; Subtract 48 to convert ASCII character to raw number
    mov bl, al       ; Store raw first number in BL
    
    ; --- Get Second Digit ---
    mov ah, 9h
    lea dx, PROMPT2
    int 21h
    
    mov ah, 1h       ; Read second char digit into AL
    int 21h          
    sub al, 48       ; Convert ASCII character to raw number
                     
    ; --- Math Process ---
    add bl, al       ; Add raw digits together (BL = BL + AL)
    
    ; --- Display Result Header ---
    mov ah, 9h
    lea dx, RESULT
    int 21h
    
    ; --- Print Calculation Output ---
    mov ah, 2h       ; prints single character
    mov dl, bl       ; Move the raw mathematical sum to DL
    add dl, 48       ; add 48 to convert back to a displayable ASCII char
    int 21h          ; to call the terminal for output input
    
    ; --- new line ---
    mov ah, 2h
    mov dl, 10       ; 10d / 0Ah
    int 21h
    mov dl, 13       ; 13d / 0Dh
    int 21h
    
    ; --- exit ---
    mov ah, 4ch      ; code segment exit
    int 21h
main endp
end main