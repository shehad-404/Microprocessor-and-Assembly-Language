.MODEL small
.STACK 100h

.DATA
    inputString DB 'I am Shehad$', 0   ; Replace 'hello world' with your lowercase string
    offsetValue DB -32                ; Offset value to convert lowercase to uppercase

.CODE
MAIN PROC
    MOV AX, @DATA       ; Load the data segment address
    MOV DS, AX          ; Set DS to the data segment

    LEA SI, inputString ; Load the address of the input string into SI

    ; Loop through each character in the string until we encounter '$' (end of the string)
CONVERT_LOOP:
    MOV AL, [SI]        ; Load the current character into AL
    CMP AL, '$'         ; Check if it is the end of the string
    JE END_LOOP         ; If end of the string, jump to END_LOOP

    CMP AL, 'a'         ; Compare with 'a' (ASCII code 97)
    JB SKIP_CONVERSION  ; If the character is less than 'a', it's not a lowercase letter, skip conversion
    CMP AL, 'z'         ; Compare with 'z' (ASCII code 122)
    JA SKIP_CONVERSION  ; If the character is greater than 'z', it's not a lowercase letter, skip conversion

    ADD AL, offsetValue ; Convert lowercase to uppercase by adding the offset value
    MOV [SI], AL        ; Store the uppercase character back into the string

SKIP_CONVERSION:
    INC SI              ; Move to the next character in the string
    JMP CONVERT_LOOP    ; Jump back to CONVERT_LOOP to process the next character

END_LOOP:
    ; The uppercase string is now stored in inputString

    ; Display the uppercase string on the screen
    MOV AH, 09h         ; DOS function to display a string
    LEA DX, inputString ; Load the address of the input string into DX
    INT 21h             ; Call DOS interrupt to display the string

    ; Terminate the program
    MOV AH, 4Ch         ; DOS function to terminate the program
    INT 21h             ; Call DOS interrupt

MAIN ENDP

END MAIN
