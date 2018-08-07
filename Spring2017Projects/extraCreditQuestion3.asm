COMMENT!
Written by Alexander Apollo Salazar
Extra Credit question Problem # 3
 Convert the following C code to equivakent MASAM code
	if (a < b + c) {
		do {
			if (b == c || a < b)
				a += b;
			c--;
		} while (c > 0);
		if (a == 0 && b == 0)
			c++;
	}
!COMMENT
INCLUDE Irvine32.inc
.data
num word ? ; will hold a
num2 word ? ; will hold b
num3 word ? ; will hold c

msg byte "please enter 3 integers $:", 0
msg1 byte "please enter another $:", 0
msg2 byte "please enter another integer $:", 0
msg3 sbyte " a equals $: ", 0
msg4 sbyte " b  equals $: ", 0
msg5 sbyte " c  equals $: ", 0


.code
main PROC
call crlf
mov cx, 0; will hold c
mov ax, 0; will hold a
mov bx, 0; will hold b

call READINTEGERS
call function
call DisplayResults



exit
main ENDP
;;; the READINTEGERS procedure will read in numbers;;;;;
READINTEGERS PROC
;;;;;;;;;; collects a;;;;;;;;;
mov edx, offset msg
call writeString
call readInt
mov num, ax
;;;;;;;;;;; collects b;;;;;;;
mov edx, offset msg1
call writeString
call readInt
mov num2, ax
;;;;;;;;; collects c;;;;;;;;;;;;;
mov edx, offset msg2
call writeString
call readInt
mov num3, ax

mov  ax, num;; assigns  ax to a
mov  bx, num2;; assigns bx to b
mov  cx, num3;; assigns cx to c
ret
READINTEGERS endp
;;;;;;;;;The Function procedure;;;;;;;
function PROC

add bx, cx; bx + cx
cmp ax, bx; if (ax < bx)
jl beginwhile; jumps to while loop

beginwhile:
cmp cx, 0; while (cx > 0)
jl endwhile; if cx is less than zero jump to endwhile
add ax, bx; ax + bx
dec cx; cx--
jmp  beginwhile

endwhile:
cmp ax, 0
je L2; jumps if a is equal to zero

L2:
cmp bx, 0
je L3; jumps if b is equal to zero

L3:
inc cx; increment c

mov num, ax; updating a
mov num2, bx; updating b
mov num3, cx; updating c

ret
function endp
;;;;;;;;;DisplayResults display the resulsts of a, b, c after the call of the procedure;;;;;
DisplayResults PROC
call crlf
mov edx, offset msg3
call writeString
mov  ax, num
call writedec

mov edx, offset msg4
call writeString
mov  ax, num2
call writedec

mov edx, offset msg5
call writeString
mov  ax, num3
call writedec


ret
DisplayResults endp


end main