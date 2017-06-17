COMMENT!Written by Alexander Apollo Salazar 5 / 11 / 17
write a procedure that receives a number in ax, counts the number of ones in its
binary represntation, and returns this count in bx. have it do this using no motr
than seven instructions.
!COMMENT
INCLUDE Irvine32.inc

.data
.code
main PROC
mov bx, 0
mov ax, 0
mov cx, 0
call ones
call dumpregs
exit
main ENDP

ones PROC
mov cx, 16
first:
shl ax, 1
jnc second
inc bx
second:
loop first
ret
ones endp
end main