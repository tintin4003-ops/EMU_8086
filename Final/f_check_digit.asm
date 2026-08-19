.model small
.stack 100h
.data
    mes db 'enter a digit: $'
    d db 10,13,'digit$'
    i db 10,13,'invalid$'
.code
main proc 
    mov ax,@data
    mov ds,ax
    
    ;display msg
    mov ah,9
    lea dx,mes
    int 21h
    
    ;take one character input
    mov ah,1              
    int 21h
    mov bl,al
    
    
    cmp bl,30h 
    jl INV
    
    cmp bl,39h
    jle CHECK
    
    
CHECK:    
    mov ah,9
    lea dx,d
    int 21h
    jmp EXIT
  
INV:                                                                  
    mov ah,9
    lea dx,i
    int 21h
EXIT:
    mov ah,4ch
    int 21h            
    





