.data

int_count: 
     .space 4
 scan:
 	.string "%d"
	.text
print:
	.string "%d\n"
	.text
	.globl main


main:


	pushl %ebp
	movl %esp,%ebp

	pushl $int_count
	pushl $scan
	call scanf
	addl $8,%esp


	movl int_count,%ecx
	movl $0,%eax
	cmp $0, %ecx
	jne for
	   jmp  myprintf
	for:
		addl %ecx,%eax
		loop for

   myprintf:
	pushl %eax
	pushl $print
	call printf
	addl $8,%esp


	movl %esp,%ebp
	popl %ebp

	movl $0,%eax

ret 
