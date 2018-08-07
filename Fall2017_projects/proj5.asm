TITLE Project 5
; AUTHOR: Alex Salazar
; DATE 10 / 5
; PROJECT number 5

INCLUDE Irvine32.inc

Print      Macro      alex
           Push       EDX

           Mov        EDX, OFFSET alex
           Call       WriteString

Pop        EDX
ENDM

STRQRYMac  Macro      value
           Push       OFFSET     value
           Call       STRQRY
ENDM

STRLENMac  Macro      value2
           Push       value2
           Call       STRLEN
ENDM

STRREVMac  Macro      value3
           Push       value3
           Call       STRREV
ENDM

Swapm      Macro       x,y: REQ

           xor         x, y
           xor         y, x
           xor         x, y
ENDM



.Data
          Prompt      Byte "Please enter your name: ", 0
          Message     Byte "the name you entered is: ", 0
          countDisplay Byte "Number of characters: ", 0
          firstName   dword 0 DUP(50), 0
          value1      Byte  0; 5
          value2      Byte  0
.Code
STRQRY    PROC

          Push       EBP
          Mov        EBP, ESP

          Push        EDX
          push        ECX

          Mov         EDX, [EBP + 8]
          Call        writeString


          Mov         ECX, 50


          ;Mov         EDX, OFFSET firstname
	      Call         readString

	      Mov         EAX, edx

          Pop         ECX
          Pop         EDX
          Pop         EBP

          Ret         4

STRQRY    ENDP

STRLEN    PROC

          Push        EBP
          Mov         EBP, ESP

          Push        EDX
          Mov         EDX, [EBP + 8]
	 
          Mov         EAX, 0


TopLoop:
          Mov         bh, [EDX + EAX]
          CMP	      bh, 0
          JE          EndLoop
          inc         EAX
          JMP         TopLoop
EndLoop:
		  Pop         EDX
		  Pop         EBP
		  ret         4
STRLEN    ENDp



 STRREV   PROC

		  Push        EBP
		  Mov         EBP, ESP

		  push        esi
		  push        ebx
		  push        edx

		  ;Get the index of last char
          Push        [ebp+8]
          Call        STRLEN	;get the length of the string
	      dec         eax   

		  Mov         esi, [ebp + 8]
		  Mov         edx, 0

Toploop:
			;Reverse char
			 mov bh,[esi+eax]
			 Swapm [esi+edx],bh
			 mov [esi+eax],bh

			 inc edx
			 dec eax
		  CMP	     edx,eax
		  JE        EndLoop
          JMP       TopLoop

		
Endloop:
		  mov        eax,[ebp+8]
		  pop        edx
		  pop        ebx
		  pop        esi
		  Pop        EBP

          ret        4      
          
STRREV    ENDP

Main      PROC
         
		   
		  STRQRYMac   prompt
		   
		  STRREVMac   eax
            
          mov        edx, eax 
		  Call       writestring 

EXIT
Main ENDP
END Main