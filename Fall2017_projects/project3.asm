TITLE Project 3
; AUTHOR: Alex Salazar
; DATE 09 / 27
; PROJECT number 3

INCLUDE Irvine32.inc

Print      Macro      alex
           Push       EDX

           Mov        EDX, OFFSET alex
           Call       WriteString

           Pop        EDX
ENDM

STRQRYM    Macro      value
           Push       OFFSET value
           Call       STRQRY
ENDM

.Data
Prompt    Byte "Please enter your name: ", 0
Message   Byte "the name you entered is: ", 0
firstName Byte 0 DUP(50), 0

.Code
STRQRY    PROC

          Push        EBP
          Mov         EBP, ESP

          Push        EDX
          push        ECX

          Mov         EDX, [EBP + 8]
          Call        writeString


          Mov         ECX, 50

          Mov         EDX,  OFFSET firstname
          Call        readString

          Mov         EAX, offset firstName 

          Pop         ECX
          Pop         EDX
          Pop         EBP

          Ret         4

STRQRY    ENDP

Main      PROC


          STRQRYM    prompt

          Print       Message

          Mov         EDX, EAX 
          Call        writeString 
          Call        Crlf 


EXIT
Main ENDP
END Main