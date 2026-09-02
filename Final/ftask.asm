.model small
.stack 100h
.data

msg1 db 10,13,"Enter a vowel: ",10,13,"$"
msg2 db 10,13,"Original : ",10,13,"$"
msg3 db 10,13,"Uppercase : ",10,13,"$"
msg4 db 10,13,"Binary : ",10,13,"$"
msg5 db 10,13,"Invalid ",10,13,"$"  

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
       
       mov ah,9h
       lea dx,msg2
       int 21h
        
        mov ah,2h
        mov dl,bl
        int 21h
        
       cmp bl,'a'
       je convert  
       
       cmp bl,'e'
       je convert
       
       cmp bl,'i'
       je convert
       
       cmp bl,'o'
       je convert
       
       cmp bl,'u'
       je convert  
       
        jmp invalid
Convert:       
         sub bl,20h
         
         mov ah,9h
       lea dx,msg3
       int 21h
          
          mov ah,2h
          mov dl,bl
          int 21h
          
      mov ah,2h
      mov dl,10
      int 21h
      mov dl,13
      int 21h    
      
        mov ah,9h
       lea dx,msg4
       int 21h 
        
       mov cx,8   
binary:
       rol bl,1
       jnc print1
       
        mov ah,2h
       mov dl,1
       add dl,48
       int 21h 
       jmp skip         

print1: 
       mov ah,2h
       mov dl,0
       add dl,48
       int 21h    
skip:       
       loop binary
               
         jmp exit
Invalid:
         mov ah,9h
       lea dx,msg5
       int 21h  
       jmp exit
 
     
            
Exit:
     mov ah,4ch
     int 21h      
main endp
end main


