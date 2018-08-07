TITLE Project 6
; AUTHOR: Alex Salazar
; DATE 11 / 20
; PROJECT number 6

INCLUDE Irvine32.inc

GetProcessHeap PROTO
HeapAlloc      PROTO,
hHeap:HANDLE,
	dwFlags : DWORD,
	dwBytes : DWORD
	HeapFree       PROTO,
	hHeap : HANDLE,
	dwFlags : DWORD,
	lpMem : DWORD

; Macro to ease the use of alloc procedure
mAlloc      Macro      Value
            Push       offset  value
            Call       ALLOC
endM

;Macro to ease the use of memFree
 free       Macro      value
            push       value
	          Call       memFree
endM


; Macro to ease the use of the alloc procedure, for character data
 cAlloc     Macro      Value
            mov        EAX, sizeof BYTE
	          imul       EAX, Value

            Push       EAX
	          Call       alloc
endM

;Macro to ease the use of of the alloc procedure for integer Data
iAlloc      Macro      Value
            mov        EAX, sizeof WORD
	          imul       EAX, Value

            Push       EAX
            Call       alloc
endM

;Macro to ease the use of the alloc for long interger DATA
lAlloc      Macro      Value
            mov        EAX, sizeof DWORD
	          imul       EAX, Value

            Push       EAX
            Call       alloc
endM

;Macro for string query
STRQRYM    Macro      value
           Push       OFFSET value
           Call       strQry
ENDM

;Macros for printing  procedures to be tested

Print      Macro      alex
           Push       EDX

           Mov        EDX, OFFSET alex
           Call       WriteString
	         Call       crlf

		       POP        EDX
ENDM

PrintChar  MACRO   char
           Push       EAX

	         MOV        AL, char
	         call       writeChar
	         call       crlf

	         pop        EAX
ENDM

PrintInt   MACRO   number
           push       EAX

	         MOV        AX, number
	         call       writeInt
	         call       crlf

	         pop        EAX
ENDM

PrintLong  MACRO   number
           Push       EAX

	         Mov        EAX, number
	         call       writeInt
	         call       crlf

	         Pop        EAX
ENDM

.data
           HeapHandle TEXTEQU <[EBP - 4]>
	         Prompt    Byte "Please enter your name: ", 0
	         Message   Byte "the name you entered is: ", 0


.code
ALLOC     PROC
          push        EBP
          MOV         EBP, ESP
          SUB         ESP, 4

          INVOKE      GetProcessHeap
          MOV         HeapHandle, EAX
          INVOKE      HeapAlloc, HeapHandle, HEAP_ZERO_MEMORY,[EBP + 8]

          ADD         ESP, 4
          POP         EBP
          RET         4

ALLOC     ENDP

memFree   PROC
          push        EBP
	        MOV         EBP, ESP
	        SUB         ESP, 4

	        INVOKE      GetProcessHeap
	        MOV         HeapHandle, EAX
	        Invoke      HeapFree, HeapHandle, HEAP_ZERO_MEMORY, [EBP + 8]

	        ADD          ESP, 4
	        POP          EBP
          RET          4

memFree   ENDP

strQry     PROC
			     Push        EBP
           Mov         EBP, ESP

           Push        EDX
           push        ECX

			;print prompt string
           Mov         EDX, [EBP + 8]
           Call        writeString

	       ;create byte and push 50 characters into a variable
	        cAlloc      50

	        mov         EDX, eax
	        Mov         ECX, 50
          Call        readString

			;used for returning name in the eax register
          Mov         EAX,  EDX

          Pop         ECX
          Pop         EDX
          Pop         EBP

          Ret         4

strQry    ENDP

;procedure to test int
intProc   PROC

          push        EBP
          MOV         EBP, ESP

          push        ESI

          iAlloc      4

          MOV         ESI, EAX
          MOV         EAX, 0
          ; 65535 is the biggest number that can be placed in an int, adding just a digit more would cause an error
          MOV         WORD PTR[esi], 65535
          MOV         WORD PTR[esi + 2], 60000

			;printing allocated memory
	        PrintInt  WORD PTR[esi]
	        PrintInt  WORD PTR[esi + 2]

			; relase memory used
          free        ESI

          POP         ESI
          POP         EBP
          RET         4

IntProc   ENDP

longInt   PROC
          push        EBP
          MOV         EBP, ESP

          push        ESI

          lalloc       2
          MOV          ESI, EAX

          MOV          DWORD PTR[esi], 4000000
          MOV          DWORD PTR[esi + 4], 8000000

          PrintLong[esi]
	        PrintLong[esi + 4]

	        ;relase memory used
          free            ESI

          POP             ESI
          POP             EBP
          RET             4
longInt   ENDP

charProc  PROC
          push        EBP
          MOV         EBP, ESP
          push        ESI

          calloc      5

           MOV         ESI, EAX
           MOV         EAX, 0

           MOV         BYTE PTR[esi], 'A'
           MOV         BYTE PTR[esi + 1], 'L'
           MOV         BYTE PTR[esi + 2], 'E'
			     MOV         BYTE PTR[esi + 3], 'X'



	        ;printing allocated memory
          PrintChar BYTE PTR[esi]
          PrintChar BYTE PTR[esi + 1]
          PrintChar BYTE PTR[esi + 2]
	        PrintChar BYTE PTR[esi + 3]

		    ;relase memory used
          free        ESI

          POP         ESI
          POP         EBP
          RET         4

charProc  ENDP




MAIN      PROC

	        STRQRYM     prompt

		      print       message

		      MOV         EDX, EAX
          call        writeString
	        call        crlf
           ;clear memory used in String query proc
			    free        EAX

            ;Testing the int procedure
		      call        intProc
	        call        crlf
	       ;Testing The longInt procedure
	        call        longInt
	        call        crlf
           ;Testing the character procedure
          call        charProc
          call        crlf
EXIT
Main ENDP
END Main
