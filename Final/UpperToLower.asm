.model small
.stack 100h
.data

msg1 db 10,13,"Enter upper case letter: ",10,13,"$"
msg2 db 10,13,"Converted to lower case: ",10,13,"$"

.code

main proc
    
   mov ax,@data
   mov ds,ax
   
   mov ah,9h
   lea dx,msg1
   int 21h
   
   mov ah,1h
   int 21h
   mov bl,al
   
   or bl,20h
   
   mov ah,9h
   lea dx,msg2
   int 21h
   
   mov ah,2h
   mov dl,bl
   int 21h 
     
   mov ah,4ch
   int 21h  
main endp
end main





