COMMENT!Written by Alexander Apollo Salazar 5 / 12 / 17
Fibinacci Recursion
extra Credit Question
!COMMENT
INCLUDE Irvine32.inc
.data
x dword ?
msg byte "Enter a integer: ", 0
msg2 byte "resulting number after fibnacci function: ", 0
.code
main PROC
mov eax, 0
mov edx, 0
mov edx, offset msg
call writeString
call ReadInt
mov x, eax

call fib
exit
main ENDP


fib PROC
cmp eax, 1
 jb exception
 cmp eax, 1
jg exception2

; ****************first return statement*****************
exception:
mov eax, 1
mov edx, offset msg2
call writeString
call writeDec
ret


; ***********second retrn statement
exception2:

dec eax
push eax; Fib(n - 1)
call fib
mov[ebp - 4], eax; store first result

dec dword ptr[esp]; (n - 1) on the stack -> (n - 2)
call fib
add esp, 4; clean up stack

add eax, [ebp - 4]; add result and stored first result

jmp Quit

; exception2:
; mov eax, 1; start values : 1, 1
; dec eax; start values : 0, 1

;--------------
mov eax, 1
call writedec
call crlf
quit:
mov esp, ebp; restore esp
pop ebp; restore ebp
	ret
fib endp
end main