.model small
.stack 100h
.data
 
 .code
 
 main proc
    
    
    mov ax,@data
    mov ds,ax
    
    mov bl,'A'
    mov ah,2h
      
print: 
    mov dl,bl
    int 21h
    
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    inc bl
    cmp bl,'Z'
    jg ExIT
    jmp print
   
EXIT:     
   
    mov ah,4ch
    int 21h   
           
main endp
end main
