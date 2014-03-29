.data
int_label: 
	.space 4
scan_str: 
	.string "%d"
	.text
printf_str: 
	.string "%d\n"
	.text
.globl  main

main:

	pushl %ebp
	movl %esp,%ebp


	pushl $int_label
	pushl $scan_str
	call scanf
	addl $8,%esp


	movl int_label,%eax

	cmp $0, %eax
	jnl more
		movl $-1, %ebx
		mull %ebx
		jmp myprintf
		
		
	more: 
		jmp myprintf


	myprintf: 
		pushl %eax
		pushl $printf_str
		call printf
		addl $8,%esp


	movl %esp,%ebp
	popl %ebp

	movl $0,%eax

	ret
