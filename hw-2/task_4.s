.data
scanf_format:
.string	"%f %f"
printf_format:
.string	"%f\n"


x:
.space	4
y:
.space	4
log:
.space	4
int:
.space	4
fract:
.space	4

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

//int of ylog2(x)
fstl	log
frndint
fstl	int
fldl	log

fsubp

// 2^ fract of log
f2xm1
fld1
faddp
fstl	fract	

// 2^(int of log
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
