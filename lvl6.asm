.model small
.stack 100h
.data
    MSG1 db 'Enter Upper Letter: $'
    MSG2 db 10, 13, 'Enter Lower Letter: $'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; --- Part 1: Upper to Lower ---
    mov ah, 9h
    lea dx, MSG1
    int 21h
    
    mov ah, 1h       ; Get upper char (e.g., 'A' = 65)
    int 21h          
    mov bl, al       ; Save into BL
    add bl, 32       ; Adding 32 shifts case from upper to lower ('A' becomes 'a')
    
    ; --- new line ---
    mov ah, 2h       
    mov dl, 10       ; 10d / 0Ah
    int 21h
    mov dl, 13       ; 13d / 0Dh
    int 21h
    
    ; --- Print Lowercase Output ---
    mov dl, bl       ; Load converted lowercase value
    int 21h          ; Print to terminal
    
    ; --- new line ---
    mov dl, 10       ; 10d / 0Ah
    int 21h
    mov dl, 13       ; 13d / 0Dh
    int 21h
    
    ; --- Part 2: Lower to Upper ---
    mov ah, 9h
    lea dx, MSG2
    int 21h
    
    mov ah, 1h       ; Get lower char (e.g., 'z' = 122)
    int 21h          
    mov bl, al       ; Save into BL
    sub bl, 32       ; Subtracting 32 shifts case from lower to upper ('z' becomes 'Z')
    
    ; --- new line ---
    mov ah, 2h       
    mov dl, 10       ; 10d / 0Ah
    int 21h
    mov dl, 13       ; 13d / 0Dh
    int 21h
    
    ; --- Print Uppercase Output ---
    mov dl, bl       ; Load converted uppercase value
    int 21h          ; Print to terminal
    
    ; --- exit ---
    mov ah, 4ch      ; code segment exit
    int 21h
main endp
end main