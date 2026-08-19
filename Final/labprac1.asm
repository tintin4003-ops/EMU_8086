.model small
.stack 100h
.data
 
 msg1 db 13,10,'Enter 4 digits : ',10,13,'$'
 msg2 db 13,10,'Stopped because of digit found 0. $'
 msg3 db 13,10,'Sum: $'    
  msg4 db 13,10,'Enter 1st digit : $'
   msg5 db 13,10,'Enter 2nd digit : $'
    msg6 db 13,10,'Enter 3rd digit : $'
     msg7 db 13,10,'Enter 4th digit : $'
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
    
    cmp bl,0
    je EXIT
    
    add cl,bl 
    
      mov ah,9h
    lea dx,msg3
    int 21h
    
    mov ah,2h
    mov dl,cl
    add dl,48
    int 21h
          
   ;input 2
        mov ah,9h
    lea dx,msg5
    int 21h  
    

    mov ah,1h
    int 21h
    mov bl,al
    sub bl,48
    
    cmp bl,0
    je EXIT  
    
    add cl,bl 
    
      mov ah,9h
    lea dx,msg3
    int 21h
    
    mov ah,2h
    mov dl,cl
    add dl,48
    int 21h
    
      ;input 3
        mov ah,9h
    lea dx,msg6
    int 21h  
    

    mov ah,1h
    int 21h
    mov bl,al
    sub bl,48
    
    cmp bl,0
    je EXIT  
    
    add cl,bl 
    
      mov ah,9h
    lea dx,msg3
    int 21h
    
    mov ah,2h
    mov dl,cl
    add dl,48
    int 21h 
    
     ;input 4
        mov ah,9h
    lea dx,msg7
    int 21h  
    

    mov ah,1h
    int 21h
    mov bl,al
    sub bl,48
    
    cmp bl,0
    je EXIT  
    
    add cl,bl 
    
    jmp SUM

EXIT:     
      mov ah,9h
    lea dx,msg2
    int 21h
    
    mov ah,4ch
    int 21h   
    
SUM:
      mov ah,9h
    lea dx,msg3
    int 21h
    
    mov ah,2h
    mov dl,cl
    add dl,48
    int 21h 
    
    ;exit
      mov ah,4ch
    int 21h   
    
       
main endp
end main


