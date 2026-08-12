.model small


.stack 100h


.data

   a db 5
   b db 3
   c db "Hello boys $"

.code                


main proc
    
    
    
    mov ax,@data
    mov ds,ax
    
    
    mov al,a
    mov bl,al
    add bl,b
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    
    mov ah,9
    lea dx,c
    int 21h
    
    
   
    
    mov ah,4ch
    int 21h
    
main endp
end main
