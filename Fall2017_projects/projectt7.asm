
TITLE project 7
Include Irvine32.inc
Include macros.inc
Include floatio.inc
; AUTHOR: Alex Salazar
; DATE 12 / 12
.data
         ;letters with values in the equation
         numA        real8   4.0
         numB        real8   13.0
         numC        real8 - 5.0
         num4        real8   4.0
         secondB     real8   13.0
         negB        real8 - 13.0
         num2        real8   2.0

	     ;variables to do expressions
         eval_4a     real8 ?
         eval_4ac    real8 ?
         evalInRad   real8 ?
         evalRadical real8 ?
         addNumer    real8 ?
         subNumer    real8 ?
         eval_2a	  real8 ?

         Val1         BYTE    "a = ", 0
         Val2         BYTE    "b = ", 0
         Val3         BYTE    "c = ", 0
         Val4         BYTE    "x = ", 0
.code

main     PROC


fld      numA



         ;printing expression values
	       ;first Value
         mov     edx, OFFSET val1
         call    WriteString
         call    WriteFloat
         call    CrLf
         fld     numB

	       ;second value
         mov     edx, OFFSET val2
         call    WriteString
         call    WriteFloat
         call    CrLf
         fld     numC

	       ;third value
         mov     edx, OFFSET val3
         call    WriteString
         call    WriteFloat
         call    CrLf
         fld     num4
         fmul    st(0), st(3)


         fstp    eval_4a
         fld     eval_4a


         fmul    st(0), st(1)
         fstp    eval_4ac
         fld     eval_4ac

         fld     secondB
         fmul    st(0), st(3)
         fstp    eval_4ac
         fld     eval_4ac

         fsub    st(0), st(1)


         fstp    evalInRad
         fld     evalInRad


         fsqrt


         fstp    evalRadical
         fld     evalRadical
         fld     num2
         fmul    st(0), st(5)
         fstp    eval_2a
         fld     eval_2a


         fld     negB

         fadd    st(0), st(2)

         fstp    addNumer
         fld     addNumer

         fdiv    st(0), st(1)

	       ;printing answer 1
         mov     edx, OFFSET val4
         call    WriteString
         call    WriteFloat
         call    CrLf

         fld     numB
         fchs

         fsub    st(0), st(3)

         fstp    subNumer
         fld     subNumer

         fdiv    st(0), st(2)

         ;printing answer 2
         mov     edx, OFFSET val4
         call    WriteString
         call    WriteFloat
         call    CrLf
exit
main    ENDP
end     main
