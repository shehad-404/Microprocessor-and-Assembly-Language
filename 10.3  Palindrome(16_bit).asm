DATA SEGMENT
  X DW 0FFFFH
  MSG1 DB 10,13,'NUMBER IS PALINDROME$'
  MSG2 DB 10,13,'NUMBER IS NOT PALINDROME$'
DATA ENDS
CODE SEGMENT
 ASSUME CS:CODE,DS:DATA
 START: MOV AX,DATA     ;Load the Data to AX.
        MOV DS,AX       ;Move the Data AX to DS.
        MOV AX,X        ;Move DW to AX.
        MOV CL,10H      ;Initialize the counter 10.
   UP: ROR AX,1         ;Rotate right one time.
       RCL DX,1         ;Rotate left with carry one time.
       LOOP UP          ;Loop the process.
       CMP AX,DX        ;Compare AX and DX.
       JNZ DOWN         ;If no zero go to DOWN label.
       LEA DX,MSG1      ;Declare as a PALINDROME.
       MOV AH,09H
       INT 21H
       JMP EXIT         ;Jump to EXIT label.
  DOWN: LEA DX,MSG2     ; Declare as not a PALINDROME
        MOV AH,09H
        INT 21H
  EXIT:MOV AH,4CH
       INT 21H
CODE ENDS
END START