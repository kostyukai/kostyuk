	.data
scanf_format:
.string	"%lf %lf"
printf_format:
.string	"%.2f\n"

.bss
x:
.space	8
y:
.space	8
log:
.space	8
int:
.space	8
fract:
.space	8

.text
.globl main

main:

pushl	%ebp
movl	%esp, %ebp

finit

pushl	$y
pushl	$x
pushl	$scanf_format
call	scanf

fldl	y
fldl	x
fyl2x


fstl	log
frndint
fstl	int
fldl	log


fsubp


f2xm1
fld1
faddp
fstl	fract	


fldl	int
fld1
fscale	
fldl	fract

fmulp

fstl	(%esp)

pushl	$printf_format
call	printf

movl	%ebp, %esp
popl	%ebp
ret
