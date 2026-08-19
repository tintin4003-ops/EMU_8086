.model small
.stack 100h
.data
    mes db 'enter a letter: $'
    v db 10,13,'vowel$'
    c db 10,13,'consonant$'
    i db 10,13,'invalid$'
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
    jg INV  
    
CHECK_VOWEL:    
    cmp bl,'A'
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
    




