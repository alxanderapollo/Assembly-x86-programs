TITLE Project 4
; AUTHOR: Alex Salazar
; DATE 09 / 28
; PROJECT number 4

INCLUDE Irvine32.inc

Print         Macro      alex
              Push       EDX

              Mov        EDX, OFFSET alex
              Call       WriteString

              Pop        EDX
ENDM

STRQRYMac     Macro      value
              Push       OFFSET value
              Call       STRQRY
ENDM

STRLENMac     Macro      value2
              Push       value2
              Call       STRLEN
ENDM


.Data
Prompt        Byte "Please enter your name: ", 0
Message       Byte "the name you entered is: ", 0
countDisplay  byte "Number of characters in that name is : ", 0
firstName     dword 0 DUP(50), 0

.Code
STRQRY        PROC

              Push        EBP
              Mov         EBP, ESP

              Push        EDX
              push        ECX


              Mov         EDX, [EBP + 8]
              Call        writeString


              Mov         ECX, 50

	            Mov         EDX, OFFSET firstname
	            Call        readString

	            Mov         EAX, EDX


	            Pop         ECX
              Pop         EDX
              Pop         EBP

              Ret         4

STRQRY  ENDP

STRLEN        PROC

              Push        EBP
              Mov         EBP, ESP

	            Push        EDX
	            push        EBX

	            Mov         EDX, [EBP + 8]

	            Mov         EAX, 0


TopLoop:
              Mov         bh, [EDX + EAX]
		          CMP	        bh, 0
              JE          EndLoop
              inc         EAX
              JMP         TopLoop
EndLoop:
			        Pop         EBX
			        Pop         EDX
			        Pop         EBP
			        ret         4

STRLEN ENDp

Main          PROC

			        STRQRYMac   prompt

			        STRLENMac   EAX

              Print       countDisplay
              Call        writeDec
	            Call        Crlf

EXIT
Main ENDP
END Main
