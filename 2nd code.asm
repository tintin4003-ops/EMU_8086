
.model small


.stack 100h

                 
           
.data

a DB "We are learning Assembly $"
b DB "test yourself $"
    
    
.code


main proc 
    
       
     mov ax,@data
     mov ds,ax
       
     mov ah,9
     lea dx,a
     int 21h   
     
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     mov ah,9
     lea dx,b
     int 21h
    
    
     mov ah,1
     int 21h
     mov cl,al
     sub cl,48
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     
     mov ah,1
     int 21h
     mov bl,al
     sub cl,48  
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     
     add bl,cl
     add bl,48  
     
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     
     mov ah,2
     mov dl,bl
     int 21h
     
     ;exit
     
     mov ah,4ch
     int 21h
     
main endp

end main