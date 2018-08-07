COMMENT!Written by Alexander Apollo Salazar 5 / 12 / 17
extra Credit Question # 2
write an assembly program that takes a sequence of numbers from the user,
the program continues to ask for a new numbers until the accumulative
product
of these numbers is greater than 1000 - base 10 - if the user enters a
non - digit charcter shall skip it.
!COMMENT
INCLUDE Irvine32.inc
.data
result dword ?
input dword ?
input2 dword ?
validinputcheck dword ?
msg byte " please enter two digits to be multiplied: ", 0
msg1 byte "invalid input type, please run the program again ", 0
msg2 byte " Enter another interget to be multiplied: ", 0
msg3 byte "current total :", 0
msg4 byte "The resulting total is exceeds 1000: "
msg5 byte "program ending...", 0
.code
main PROC
call clrscr
mov eax, 0
mov edx, 0
mov ebx, 0
call firstdigits
call multiply
exit
main ENDP
; ---- - function will record and store inputs from the user-- -
firstdigits PROC
; ------------first digit----------------
mov edx, offset msg; first prompt
call writeString
call Readint
;call inputvalidation; will check to see if the input is valid
mov input, eax; first readin is stored input
; ------------second input and prompt--------
mov edx, offset msg2; second prompt
call writeString
call readint
mov input2, eax

mov eax, input; eax will equal input
mov ebx, input2;  ebx will equal input 2
ret
firstdigits endp

multiply PROC
;---function to get product------
function:
mul ebx
mov result, eax
mov ebx, result
mov edx, offset msg3
call writeString; prints out result prompt
call writedec
call crlf
; ---- - condition---- -
.if (eax> 1000)
jg terminate; if eax is greater than 1000 jump to terminate 

.elseif (eax < 1000)
mov edx, offset msg2
call writeString
call Readint
jmp multiply
.endif
terminate:
mov eax, result
mov edx, offset msg4
call writeString
call writedec
call crlf
ret
multiply endp

inputvalidation PROC

call isdigit
cmp al, '0'
jb firstdigits
cmp al, '9'
jb firstdigits
test ax, 1
ret
; endprog:
;	mov edx, offset msg1
;	call writeString
;	call crlf
;	jmp endprogram


inputvalidation endp

endprogram:
mov edx, offset msg5;end program prompt
call writeString 
call crlf


end main