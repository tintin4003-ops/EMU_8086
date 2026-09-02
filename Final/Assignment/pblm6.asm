  .model small

.stack 100h

.data

.code

main proc
      
      mov cx,9
      mov ah,2h
      mov bl,1  
      
Print:
      mov dl,bl
      add dl,48
      int 21h 
      inc bl
      
LOOP print                
    
Exit:
    
    mov ah,4ch
    int 21h
    
main endp
end main


