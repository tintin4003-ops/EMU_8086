.model small
.stack 100h
.data
    mes db 'Enter a digit: $'
    d db 10,13,'Digit$'
    i db 10,13,'Invalid$' ;0-9 
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
    sub bl,48
    
    
    cmp bl,0 
    jl INV
    
    cmp bl,9
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

main endp
end main       
    


