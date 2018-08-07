INCLUDE Irvine32.inc
.data
Num1 DWORD ?
Num2 DWORD ?
numtimes dword 0
Remainder DWORD ?
cero dword 0
MSG byte "please enter two integers to be Divided", 0
MSG1 byte " The number of times that number goes in is: ", 0
MSG2 byte " The remaining numbers are :", 0
Divi byte  "/", 0
equals byte "=", 0
.code
main PROC
call clrscr
mov eax, 0
mov ebx, 0
mov numtimes, 0; this will display how many times a number can go into another
mov Remainder, 0; this is the remainder

mov edx, offset MSG; message one
call WriteString; prints message
call Divide; call the divide procedure

exit
main ENDP

Divide PROC
call ReadInt; reads the first int
mov  Num1, eax; first int goes into eax
call writedec; prints out the first number

mov edx, offset divi; give the address of divi to edx
call writeString; prints out /

call ReadInt; reads in second number

mov Num2, eax; make Num2 equal the new readin number
;eax now holds the second number

call writedec; prints out the second input  number
mov eax, Num1; assign eax to the first number
mov ebx, Num2; assign ebx to the second input
mov edx, offset equals; this will help print the equals
call writeString
.while (eax >= ebx); if the first number is bigger than the second input
inc numtimes; ; increase the amount of times the second digit enters the first digit
sub eax, ebx; subtract eax, 
.endw
.if (eax < edx);we save the remainder here
mov	Remainder, eax
.endif


mov eax, numtimes; print the number of times the divsor has been divided
call writedec
mov edx, offset msg1

mov eax, Remainder; move the remainder into the eax register 
	mov edx, offset MSG2


call writeString
call writedec
ret
Divide endp
END main