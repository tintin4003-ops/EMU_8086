.model small 

.stack 100h 

.data

a db "Enter first digit: $"
b db "Enter second digit: $"
cat db "Swap and Add Program $"  
d db "Values after swapping: $"
e db "First value= $"
f db "Second value= $"
g db "Sum of the values= $"

.code

main proc   
    ;initialize
    mov ax,@data
    mov ds,ax
     
     ;print c                    
    mov ah,9h   ;9
    lea dx,cat
    int 21h
      
      ;newline
      mov ah,2h
      mov dl,10   ;0Ah
      int 21h      
      mov dl,13      ;0dh
      int 21h
          
            
      ;newline
      mov ah,2h
      mov dl,10
      int 21h
      mov dl,13
      int 21h
      
       ;print a
    mov ah,9h
    lea dx,a
    int 21h
    
    ;input
      mov ah,1h
      int 21h
      mov cl,al 
      ;ascii to numeric
      sub cl,48    
          
          ;newline
      mov ah,2h
      mov dl,10
      int 21h
      mov dl,13
      int 21h
      
       ;print b
    mov ah,9h
    lea dx,b
    int 21h
    
      ;input
      mov ah,1h
      int 21h
      mov bl,al
      sub bl,48  
            
             ;newline
      mov ah,2h
      mov dl,10
      int 21h
      mov dl,13
      int 21h
          
            
      ;newline
      mov ah,2h
      mov dl,10
      int 21h
      mov dl,13
      int 21h
      
         ;print d
    mov ah,9h
    lea dx,d
    int 21h 
          ;swap
       xchg cl,bl    
          
             ;newline
      mov ah,2h
      mov dl,10
      int 21h
      mov dl,13
      int 21h
          
            
      ;newline
      mov ah,2h
      mov dl,10
      int 21h
      mov dl,13
      int 21h  
      
      ;print e
    mov ah,9h
    lea dx,e
    int 21h
    
       ;print output
       
       mov ah,2h
       mov dl,cl
       add dl,48
       int 21h  
       
        ;newline
      mov ah,2h
      mov dl,10
      int 21h
      mov dl,13
      int 21h
          
          ;print f
    mov ah,9h
    lea dx,f
    int 21h
    
       ;print output
       
       mov ah,2h
       mov dl,bl
        add dl,48
       int 21h  
            
              ;newline
      mov ah,2h
      mov dl,10
      int 21h
      mov dl,13
      int 21h
      
        ;newline
      mov ah,2h
      mov dl,10
      int 21h
      mov dl,13
      int 21h
       
       ;print g
    mov ah,9h
    lea dx,g
    int 21h     
            add cl,bl
       ;print output
       
       mov ah,2h
       mov dl,cl
        add dl,48
       int 21h  
    
     ;exit
    mov ah,4ch
    int 21h

main endp
end main
