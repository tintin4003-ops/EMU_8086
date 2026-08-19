.model small
.stack 100h
.data
 
 msg1 db 13,10,'Enter 2 digits : ',10,13,'$'
 msg2 db 13,10,'Equal $'
 msg3 db 13,10,'Not Equal $'    
  msg4 db 13,10,'Enter 1st digit : $'
   msg5 db 13,10,'Enter 2nd digit : $'
   
 .code
 
 main proc
    
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9h
    lea dx,msg1
    int 21h   
    
    mov cl,0
    
   ;input 1
    mov ah,9h
    lea dx,msg4
    int 21h
    
    mov ah,1h
    int 21h
    mov bl,al
    sub bl,48
    
          
   ;input 2
        mov ah,9h
    lea dx,msg5
    int 21h  
    

    mov ah,1h
    int 21h
    mov cl,al
    sub cl,48
    
    cmp cl,bl
    
    je  EQUAL
    
    jmp NOT_EQUAL
   
    
     

EQUAL:     
      mov ah,9h
    lea dx,msg2
    int 21h
    
    mov ah,4ch
    int 21h   
    
NOT_EQUAL:
    
     mov ah,9h
    lea dx,msg3
    int 21h
    
    mov ah,4ch
    int 21h   
    
       
main endp
end main




