.model small
.stack 100h
.data
 
 msg1 db 13,10,'Enter characters : ',10,13,'$'
 msg2 db 13,10,'Stopped because found X. $'
 
 .code
 
 main proc
    
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9h
    lea dx,msg1
    int 21h 
    
    mov ah,1h
      
Inputs: 
    
    int 21h
    cmp al,'X'
    je EXIT  
    
    jmp inputs   
   
EXIT:     
    mov ah,9h
    lea dx,msg2
    int 21h  
    
    mov ah,4ch
    int 21h   
           
main endp
end main




