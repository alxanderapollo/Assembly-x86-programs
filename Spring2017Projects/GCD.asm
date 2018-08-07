INCLUDE Irvine32.inc
.data
Num1 DWORD ?
Num2 DWORD ?
numtimes dword 0
Remainder DWORD 0
temp dword 0
MSG byte "please enter the first integer:", 0
MSG1 byte "please enter the second  integer:", 0
MSG3 byte " The GCD is: ", 0
.code
main PROC
call clrscr
mov eax, 0
mov ebx, 0
mov numtimes, 0; this will display how many times a number can go into another
mov Remainder, 0; this is the remainder

mov edx, offset MSG; first message
call writeString
call ReadInt; reads the first int
mov  Num1, eax; first int goes into eax

mov edx, offset MSG1
call WriteString; second message
call ReadInt; reads in second number
mov Num2, eax; make Num2 equal the new readin number
; eax now holds the second number

call GCD
exit
main ENDP

GCD PROC

mov eax, Num1; assign eax to the first number
mov ebx, Num2; assign ebx to the second inpu

.while ( ebx!= 0)
mov edi, ebx; edi will be like a temp variable
call Divide; Divide procedure
mov eax, edi
call writeDec
.endw;;;;;;;;;; the end of the scope for the while loop

mov edx, offset MSG3;
call WriteString
call writedec
GCD endp

Divide PROC
.while (eax >= ebx); if the first number is bigger than the second input
inc numtimes; ; increase the amount of times the second digit enters the first digit
sub eax, ebx; subtract eax,
mov Num1, eax
mov Num2, ebx
.endw
.if (eax < edx); we save the remainder here
	mov	Remainder, eax

	mov ebx, Remainder
	.endif
	mov eax, numtimes; print the number of times the divsor has been divided
	mov eax, Remainder; move the remainder into the eax register 
	ret
	Divide endp

	
	END main