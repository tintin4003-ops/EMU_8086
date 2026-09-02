.model small
.stack 100h
.data
    msg1 db 10, 13, "Enter binary digits one by one: ", 10, 13, "$"

.code
main proc
    mov ax, @data
    mov ds, ax
        
 
    mov ah, 9h
    lea dx, msg1
    int 21h
         
    mov bl, 0
    mov cx, 4  
        
    mov ah, 1h
input:  
    int 21h
    sub al, 48       
    
    shl bl, 1        
    or bl, al        
    
    loop input  
    
  
    mov ah, 2h
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h


  
    
    mov cx, 8 
    mov ah, 2h
    
output:
    rol bl, 1        
    jc print1       
    
    mov dl, '0' 
    int 21h  
    jmp skip2   

print1:
    mov dl, '1'
    int 21h  
skip2:    
   
    loop output     

    ; Exit program
    mov ah, 4ch
    int 21h             
main endp
end main


