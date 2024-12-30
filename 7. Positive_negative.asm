DATA SEGMENT
    NUM DB ?
    BUFFER DB 6 ; Buffer to store user input (maximum 6 characters, including null terminator)
    PROMPT DB 10, 13, 'ENTER A NUMBER: $'
    POSITIVE_MSG DB 10, 13, 'The number is POSITIVE $'
    NEGATIVE_MSG DB 10, 13, 'The number is NEGATIVE $'
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    ; Display prompt for user input
    MOV DX, OFFSET PROMPT
    MOV AH, 09H
    INT 21H

    ; Read user input
    MOV DX, OFFSET BUFFER
    MOV AH, 0AH ; Function 0AH - Buffered Input
    INT 21H

    ; Convert the user input to a signed 8-bit number
    MOV AL, BUFFER+2 ; ASCII value of the first character entered by the user
    CMP AL, '-'      ; Check if the number is negative
    JNZ IS_POSITIVE  ; If the first character is not '-', it is positive
    MOV AL, BUFFER+3 ; ASCII value of the second character (after '-')
    NEG AL           ; Negate the ASCII value to convert to numeric value
    JMP CHECK_NEGATIVE

IS_POSITIVE:
    SUB AL, '0'      ; Convert ASCII character to numeric value

CHECK_NEGATIVE:
    MOV NUM, AL

    ; Check if the number is negative
    MOV AL, NUM
    ROL AL, 1
    JC NEGATIVE

POSITIVE:
    ; If the number is positive, display the positive message
    MOV DX, OFFSET POSITIVE_MSG
    JMP EXIT

NEGATIVE:
    ; If the number is negative, display the negative message
    MOV DX, OFFSET NEGATIVE_MSG

EXIT:
    ; Display the appropriate message
    MOV AH, 09H
    INT 21H

    ; Exit the program
    MOV AH, 4CH
    INT 21H

CODE ENDS
END START
