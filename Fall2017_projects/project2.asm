TITLE Project 2
; AUTHOR: Alex Salazar
; DATE 09 / 7
; PROJECT number 2

INCLUDE Irvine32.inc

Print         Macro      alex
              Push       EDX

              Mov        EDX, OFFSET alex
              Call       WriteString

              Pop        EDX
ENDM

.Data 
Prompt    Byte "Please enter your name: ", 0
Message   Byte "the name you entered is: ", 0
firstName Byte 0 DUP(50), 0

.Code
Main       PROC

           Print       Prompt 
	       
	       Mov         EDX, OFFSET firstName
	       Mov         ECX, 50
	       Call        readString

	       Print       Message 
			
	       Print       firstName 
	       Call        Crlf

	 


EXIT
Main ENDP
END Main