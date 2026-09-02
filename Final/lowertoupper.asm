.model small
.stack 100h
.data

msg1 db 10,13,"Enter lower case letter: ",10,13,"$"
msg2 db 10,13,"Converted to upper case: ",10,13,"$"

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
   
   and bl,0dfh
   
   mov ah,9h
   lea dx,msg2
   int 21h
   
   mov ah,2h
   mov dl,bl
   int 21h 
    
main endp
end main



