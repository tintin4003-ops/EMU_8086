 .model small 

; .model small means the model is using small memory model
; there are three segments like code data and stack 

 .stack 100h    
 
 ; this line means we are using 100 bytes for stack memory
 
 .data    
 
 ; here we call a data segment and used for variable string and numbers declaration
 a DB "Hello Course takers $"  
 
 ; $ helps to tell the interupt to stop printing string hrere
 .code  
 
 ; here we tell about the coding main parts basically logical parts
 
 ; we can call it also program logic
 
 main Proc   
    
 ; the main procedure starts here   
    
    mov ax,@data 
  ; we are loading the address of the data segment into the ax register with it the CPU can locate the data segment which is is sepearte memory
                                     
    mov ds, ax
  ; copy the address of the data segment in data segment register.  
    
    mov ah,09h      
  ; with it we will call dos for printing a string a string and it will stop when we will get a $.
  ; AH = 01h	input character , 2h output character, 09h print string, 4Ch exit program
    lea dx,a        
  ; loading the address of the varaible a in dx
    int 21h  
  ; transfers control from the program to DOS, which performs the task specified in AH and returns control back to the program.
    
    mov ah,2    
  ;select DOS function 02h which prints a single character
    mov dl,10 
  ;select ascii value 10 for new line print
    int 21h
    mov dl,13
  ;Load ASCII value 13.Moves cursor to start of line
    int 21h
    
    
    mov ah,1
    int 21h
    mov cl,al
    sub cl,48  ;48/30h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,1
    int 21h
    mov bl,ah
    sub bl,48
    
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    add bl,cl
    add bl,48
    
    
    
    mov ah,2
    mov dl,bl
    int 21h
    
    ;exit 
    mov ah,4CH
    int 21h
    
main endp
end main
    
    