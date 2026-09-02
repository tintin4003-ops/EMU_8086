.model small
.stack 100h
.data
    mes db 'Enter a digit (1 to 9):',10,13,' $'
    e db 10,13,'Even',10,13,'$'
    o db 10,13,'Odd',10,13,'$'
    i db 10,13,'Invalid',10,13,'$'
.code
main proc 
    mov ax,@data
    mov ds,ax
    
    ;display msg
    mov ah,9
    lea dx,mes
    int 21h
    
    ;input
    mov ah,1              
    int 21h
    mov bl,al
    sub bl,48
    
    cmp bl,0 
    jl INV
    
    cmp bl,9
    jg INV
    
    jmp check
     
    
CHECK:    
    cmp bl,0 
    je even    
    cmp bl,2
    je even 
    cmp bl,4
    je even 
    cmp bl,6
    je even 
    cmp bl,8
    je even    
   
    ;else odd
    mov ah,9
    lea dx,o
    int 21h
    jmp EXIT

EVEN:
    mov ah,9
    lea dx,e
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



