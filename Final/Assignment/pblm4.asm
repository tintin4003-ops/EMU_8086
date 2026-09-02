.model small
.stack 100h
.data
    mes db 'Enter a letter:',10,13,' $'
    v db 10,13,'Vowel',10,13,'$'
    c db 10,13,'Consonant',10,13,'$'
    i db 10,13,'Invalid',10,13,'$'
.code
main proc 
    mov ax,@data
    mov ds,ax
    
    ;display msg
    mov ah,9
    lea dx,mes
    int 21h
    
    ;take one character input
    mov ah,1              
    int 21h
    mov bl,al
    
    ;check upper A-Z
    cmp bl,'A' ;if bl=B 62-61=1
    jl INV
    
    cmp bl,'Z'
    jle CHECK_VOWEL
    
    ;check lowercase a-z
    cmp bl,'a'
    jl INV
    
    cmp bl,'z'
    ja INV  
    
CHECK_VOWEL:    
    cmp bl,'A' bl==a
    je VOL    
    cmp bl,'E'
    je VOL
    cmp bl,'I'
    je VOL
    cmp bl,'O'
    je VOL
    cmp bl,'U'
    je VOL   
    cmp bl,'a'
    je VOL
    cmp bl,'e'
    je VOL
    cmp bl,'i'
    je VOL
    cmp bl,'o'
    je VOL
    cmp bl,'u'
    je VOL    
    
    ;else consonant
    mov ah,9
    lea dx,c
    int 21h
    jmp EXIT

VOL:
    mov ah,9
    lea dx,v
    int 21h
    jmp EXIT
    
INV:
    mov ah,9
    lea dx,i
    int 21h
EXIT:
    mov ah,4ch
    int 21h    

main endp
end main        
    







