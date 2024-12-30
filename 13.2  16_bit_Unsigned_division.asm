DATA SEGMENT
    NUM1 DW 0FFFFH
    NUM2 DW 0005H
    QUO DW 2 DUP(0)
    REM DW 1 DUP(0)
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    ; Load the dividend into AX and DX (16-bit)
    MOV AX, WORD PTR NUM1   ; Lower 16 bits of the dividend
    MOV DX, WORD PTR NUM1+2 ; Upper 16 bits of the dividend

    ; Load the divisor into BX (16-bit)
    MOV BX, NUM2

    XOR DX, DX              ; Clear the DX register for the remainder
    DIV BX                  ; Perform the division, quotient in AX, remainder in DX

    ; Store the result back into memory
    MOV WORD PTR QUO, AX
    MOV WORD PTR QUO+2, DX

    ; Move the remainder from DX to a temporary register BX
    MOV BX, DX
    ; Store the remainder in REM variable
    MOV WORD PTR REM, BX

    MOV AH, 4CH             ; DOS function to terminate the program
    INT 21H                 ; Call DOS interrupt

CODE ENDS
END START
