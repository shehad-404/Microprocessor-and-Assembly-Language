



.MODEL SMALL
.STACK 100H 

.DATA
MSG DB "Addition of 2 Numbres$"

PROMPT1 DB 10,10,13,"FIRST NUMBER: $"
PROMPT2 DB 10,13,"SECOND NUMBER: $"
PROMPT3 DB 10,13,"SUM: $"     
NUM1    DB ?,'$'
NUM2    DB ?,'$'
   
.CODE

MAIN PROC

MOV AX,@DATA
MOV DS,AX
INT 21H

MOV AH,9
MOV DX,OFFSET MSG     ;showing the message of MSG
INT 21H

MOV AH,9              ;showing the message of PROMPT1
MOV DX,OFFSET PROMPT1
INT 21H

MOV AH,1              ;takes input of first number
INT 21H
SUB AL,30H
MOV NUM1,AL

MOV AH,9              ;showing the message of PROMPT2
MOV DX,OFFSET PROMPT2
INT 21H

MOV AH,1              ;takes input of second number
INT 21H
SUB AL,30H
MOV NUM2,AL

MOV AH,9              ;showing the message of PROMPT3
MOV DX,OFFSET PROMPT3
INT 21H

MOV AL,NUM1           ;move NUM1 to AL
ADD AL,NUM2           ;AL= AL+NUM2
ADD AL,30H            ;converting AL to HEXA-DECIMAL
                         
MOV AH,2              ;showing output
MOV DL,AL
INT 21H

MOV AH,4CH            ;return
INT 21H

ENDP

END MAIN