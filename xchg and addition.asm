.model small

.stack 100h


.data
 
 a db ?
 b db ?
 c db 'updated value of a: $'
 d db 'updated value of b; $' 
 e db 'after addition : $'

.code


  main proc
    
    mov ax,@data
    mov ds,ax
    
    
    mov ah,1
    int 21h
    mov a,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    mov ah,1
    int 21h
    mov b,al
    
    mov  dl,a
    xchg dl,b
    mov  a,dl
    
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h           
              
              
    mov ah,9
    lea dx,c
    int 21h
    
    
    
    mov ah,2
    mov dl,a
    int 21h 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,d
    int 21h 
    
    mov ah,2
    mov dl,b
    int 21h   
    
    mov al,a 
    add al,b
    mov a,al 
    sub a,30h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,e
    int 21h
    
    mov ah,2
    mov dl,a
    int 21h
   
    
    
    ; exit
    
    mov ah,4ch
    int 21h
           
           
    
  main endp