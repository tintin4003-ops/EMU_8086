.model small

.stack 100h

.data

msg1 db 10,13,"Enter first digit: ",10,13,"$"

msg2 db 10,13,"Enter second digit: ",10,13,"$"

msg3 db 10,13, "Enter thrid digit: ",10,13,"$"   

msg4 db 10,13,"Biggest number is: ",10,13,"$"


.code

main proc
    
    mov ax,@data
    mov ds,ax
        
     ;digit1 
     
    mov ah,9h
    lea dx,msg1
    int 21h
    
    mov ah,1h
    int 21h
    mov cl,al
    sub cl,48
     
     ;digit2
     
     mov ah,9h
    lea dx,msg2
    int 21h
    
    mov ah,1h
    int 21h
    mov bl,al
    sub bl,48 
    
    ;digit3
     
     mov ah,9h
    lea dx,msg3
    int 21h
    
    mov ah,1h
    int 21h 
    mov ch,al
    sub ch,48
    
    cmp cl,bl
    jae check1 
    
    cmp bl,ch
    jae print2         
     
     jmp print3
     
print3:
      mov ah,9h
     lea dx,msg4
     int 21h
     
     mov ah,2h
     mov dl,ch
     add dl,48
     int 21h
     
     jmp exit     
    
print2:
       mov ah,9h
     lea dx,msg4
     int 21h
     
     mov ah,2h
     mov dl,bl
     add dl,48
     int 21h
     
     jmp exit
       

    
check1:
      cmp cl,ch
      jae print1
      jmp print3 

print1:

     mov ah,9h
     lea dx,msg4
     int 21h
     
     mov ah,2h
     mov dl,cl
     add dl,48
     int 21h
     
     jmp exit


exit:
    mov ah,4ch
    int 21h
    
main endp
end main