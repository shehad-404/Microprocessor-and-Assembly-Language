DATA SEGMENT
   NUM1 DW 03E8H
   NUM2 DW 0002H
   PROD DW 2 DUP(0)
DATA ENDS
CODE SEGMENT
   ASSUME CS:CODE,DS:DATA
   START: MOV AX,DATA
   MOV DS,AX
   LEA SI,NUM1 ; SI pointed to the Multiplicand
   MOV AX,[SI] ; Multiplicand has to be in AX register
   MOV BX,NUM2 ; SI+2 pointed to the Multiplier and move it to BX
   MUL BX ;Perform the multiplication
   MOV PROD,AX ;32 bit product stored in DX-AX registers
   MOV PROD+2,DX
   MOV AH,4CH
   INT 21H
CODE ENDS
END START