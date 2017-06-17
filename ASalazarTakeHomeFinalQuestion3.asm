COMMENT!Written by Alexander Apollo Salazar 5 / 11 / 17
Finite State machine question 3
Take home final Portion
!COMMENT
INCLUDE Irvine32.inc
.data
msg byte "you are in state 0", 0
msg1 byte "you are in state 1", 0
msg2 byte "you are in state 2", 0
msg3 byte "please enter  either a 1 or 0, enter 2 or any  other number above to quit  ", 0
msg4 byte "Invalid input", 0
msg5 byte " your input: $ ", 0
msg6 byte " resulting output: $ ", 0
userinput word ? ; will record each input from the user
output word ? ; will record each result from the states
.code
main PROC
call clrscr
mov ax, 0
mov edx, 0
mov edx, offset msg
call writeString
call crlf
call States
exit
main ENDP
States PROC
call input
;----------State0---------
State0:
; call clrscr
cmp ax, 0
je State1; if (ax == 0) jump to state 1
cmp ax, 1
je State1; if(ax===1) jump to state 1
jmp terminate
; --------State1----------
State1:
; call clrscr
mov edx, offset msg1
call WriteString; prompts that we are in State1
call crlf 

mov ax, 1; the result of going into state 1
mov output, ax
mov edx, offset msg6; resulting message
call writeString
call writedec; prints out number
call crlf
call input; we grab the input now

cmp ax, 1; if (ax == 1)
je State1
cmp ax, 0
jz State2; jump to the next state if input is zero
jmp terminate
;--------State2-----------
State2:
; call clrscr
mov edx, offset msg2
call WriteString; prompts that we are in State2
call crlf

mov ax, 0; the result of going into state 1
mov output, ax
mov edx, offset msg6; resulting message
call writeString
call writedec; prints out number
call crlf
call input; we grab the input now

cmp ax, 0
je State2

cmp ax, 1; if (ax == 1)
je StatezeroAdd

jmp terminate

StateZeroAdd:
mov edx, offset msg
call writeString
call crlf

mov ax, 0; the result of going into state 1
mov output, ax
mov edx, offset msg6; resulting message
call writeString
call writedec; prints out number
call crlf
call input; we grab the input now
jmp State0




terminate:
call clrscr
mov edx, offset msg4;invalid input message 
call writeString
call crlf
ret



States endp
input PROC

mov edx, offset msg3
call writeString
; --------inputs------
call ReadInt
mov userinput, ax; now input = ax
ret
input endp


end main