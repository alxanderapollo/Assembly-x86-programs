TITLE Project 1
; AUTHOR: Alex Salazar
; DATE 09 / 7
; PROJECT number 1

INCLUDE Irvine32.inc

.Data
Prompt    Byte "Please enter your name: ", 0
Message   Byte "the name you entered is: ", 0
firstName Byte 0 DUP(50), 0


.Code
Main     PROC

         mov         EDX, OFFSET Prompt
         call        writeString

         mov         EDX, OFFSET firstName
         mov         ECX, 50
         call        readString

         mov         EDX, OFFSET Message
         call        writeString



         mov         EDX, OFFSET firstName
         call        writeString
         call        crlf


EXIT
Main ENDP
END Main
