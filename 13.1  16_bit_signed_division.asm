;8086 Assembly Language Program for 16 Bit Division for Signed numbers
DATA SEGMENT
  NUM1 DW 0014H
  NUM2 DW 0FFFBH
  QUO DW 2 DUP(0)
  REM DW 1 DUP(0)
DATA ENDS
CODE SEGMENT
  ASSUME CS:CODE,DS:DATA
  START: MOV AX,DATA
  MOV DS,AX
  MOV AX,NUM1 ; Move the lower bit of Dividend to AX
  MOV DX,NUM1+2
  CWD
  IDIV NUM2
  MOV QUO,AX
  MOV REM,DX
  MOV AH,4CH
  INT 21H
  CODE ENDS
END START