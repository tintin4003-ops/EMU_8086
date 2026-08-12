.MODEL SMALL
.STACK 100H
.DATA

A DB "My Name is : $"
B DB "Mahi Muqtadir$" 
C DB "My ID is : $"  
ID DB "23-53303-3$" 
D DB "A$"
S DB " $"
P DB "*$"
NEWLINE DB 0AH,0DH,'$'
NEW DB 10,13,'$'
.CODE 

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS, AX
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    
    MOV AH,9
    LEA DX,B
    INT 21H   
    
    MOV AH,9
    LEA DX,NEWLINE
    INT 21H
    
    MOV AH,9
    LEA DX,C
    INT 21H

    MOV AH,9
    LEA DX,ID
    INT 21H

    MOV AH,9
    LEA DX,NEWLINE
    INT 21H       
        
     
     MOV AH,9
    LEA DX,D
    INT 21H

    MOV AH,9
    LEA DX,NEWLINE
    INT 21H    
     
      MOV AH,9
    LEA DX,D
    INT 21H
    
      MOV AH,9
    LEA DX,D
    INT 21H
    
      MOV AH,9
    LEA DX,NEWLINE
    INT 21H 
    
      MOV AH,9
    LEA DX,D
    INT 21H  
    
      MOV AH,9
    LEA DX,D
    INT 21H
    
      MOV AH,9
    LEA DX,D
    INT 21H
    
      MOV AH,9
    LEA DX,NEWLINE
    INT 21H  
    
      MOV AH,9
    LEA DX,D
    INT 21H
    
      MOV AH,9
    LEA DX,D
    INT 21H
    
      MOV AH,9
    LEA DX,D
    INT 21H
    
      MOV AH,9
    LEA DX,D
    INT 21H
    
      MOV AH,9
    LEA DX,NEWLINE
    INT 21H 
    
     MOV AH,9
    LEA DX,S
    INT 21H
    
      MOV AH,9
    LEA DX,S
    INT 21H
    
      MOV AH,9
    LEA DX,S
    INT 21H
    
      MOV AH,9
    LEA DX,P
    INT 21H  
    
     MOV AH,9
    LEA DX,S
    INT 21H
    
      MOV AH,9
    LEA DX,S
    INT 21H
    
      MOV AH,9
    LEA DX,S
    INT 21H
    
    
      MOV AH,9
    LEA DX,NEWLINE
    INT 21H    
 
      MOV AH,9
    LEA DX,S
    INT 21H
    
      MOV AH,9
    LEA DX,S
    INT 21H
    
      MOV AH,9
    LEA DX,P
    INT 21H
    
      MOV AH,9
    LEA DX,P
    INT 21H  
    
     MOV AH,9
    LEA DX,P
    INT 21H
    
      MOV AH,9
    LEA DX,S
    INT 21H
    
      MOV AH,9
    LEA DX,S
    INT 21H
    
    
      MOV AH,9
    LEA DX,NEWLINE
    INT 21H    
  
    
       MOV AH,9
    LEA DX,S
    INT 21H
    
      MOV AH,9
    LEA DX,P
    INT 21H
    
      MOV AH,9
    LEA DX,P
    INT 21H
    
      MOV AH,9
    LEA DX,P
    INT 21H  
    
     MOV AH,9
    LEA DX,P
    INT 21H
    
      MOV AH,9
    LEA DX,P
    INT 21H
    
      MOV AH,9
    LEA DX,S
    INT 21H
    
    
      MOV AH,9
    LEA DX,NEWLINE
    INT 21H    
   
    
    MOV AH,9
    LEA DX,P
    INT 21H
    
      MOV AH,9
    LEA DX,P
    INT 21H
    
      MOV AH,9
    LEA DX,P
    INT 21H
    
      MOV AH,9
    LEA DX,P
    INT 21H  
    
     MOV AH,9
    LEA DX,P
    INT 21H
    
      MOV AH,9
    LEA DX,P
    INT 21H
    
      MOV AH,9
    LEA DX,P
    INT 21H
    
    
      MOV AH,9
    LEA DX,NEWLINE
    INT 21H    
 
    MOV AH,1
    INT 21H
    MOV CH,AL
    
    MOV AH,9
    LEA DX,NEW
    INT 21H
        
    MOV AH,2 ;
    MOV DL,BH
    INT 21H 
    
    MOV AH,2
    MOV DL,CH
    INT 21H  
    
    ADD BH,CH
    SUB BH,4h
    
    MOV AH,9
    LEA DX,NEWLINE
    INT 21H
    
    MOV AH,2
    MOV DL, BH
    INT 21H
    
       ;EXIT
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN
