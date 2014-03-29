
.globl	a
.data
a:
.space 12
val:
.string	"%d"
out:
.string "%d\n"
summ:
.space 4
count:
.space 4
.text
.globl	main
main:
	pushl	%ebp 
	movl	%esp, %ebp

	movl $0,%eax 
	movl %eax, count

jmp	next_1
read:
	movl	count, %eax
	sall	$2, %eax
	addl	$a, %eax
	pushl	%eax
	pushl	$val
	call	scanf
	addl $8, %esp
	movl count, %eax
	addl	$1, %eax
	movl %eax, count
next_1:
	movl count, %eax
	cmpl	$2, %eax 
	jle	read

	movl a, %eax 
	movl %eax, summ

	movl $1, %eax 
	movl %eax, count
	jmp next_2
summa:
	movl count, %eax 
	sall $2, %eax
	addl $a, %eax

	movl (%eax), %edx
	movl summ, %eax 
	addl %edx, %eax

	movl %eax, summ

	movl count, %eax
	addl $1, %eax
	movl %eax, count
next_2:
	movl count, %eax 
	cmpl $2, %eax
	jle summa


	movl summ, %eax 
	pushl %eax
	pushl $out
	call printf
	addl $8, %esp

	movl %ebp, %esp
	popl %ebp

	movl $0, %eax 
	ret

