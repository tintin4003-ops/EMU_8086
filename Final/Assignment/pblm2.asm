.model small

.stack 100h

.data

msg1 db 10,13,"Enter a number: ",10,13,"$"
msg2 db 10,13,"Number is Positive. ",10,13,"$"
msg3 db 10,13,"Number is Negative. ",10,13,"$"
msg4 db 10,13,"Number is Zero. ",10,13,"$" 
msg5 db 10,13,"Invalid. ",10,13,"$"

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
     sub bl,48
        
     cmp bl,0
     jl NEGATIVE
     
     cmp bl,9
     jle POSITIVE 
     
     jmp INVALID 
    
NEGATIVE: 
     
     mov ah,9h
     lea dx,msg3
     int 21h
     jmp EXIT
     
POSTIVE:
      cmp bl,0
      je  ZERO
      
      move ah,9h
      lea dx,msg2
      int 21h
      jmp EXIT
      
ZERO:
      move ah,9h
      lea dx,msg4
      int 21h
      jmp EXIT 
          
INVALID:
      
        move ah,9h
      lea dx,msg5
      int 21h
      jmp EXIT   
    
EXIT:
     mov ah,4ch
     int 21h    
    
main endp
end main



