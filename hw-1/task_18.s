.data

int_label: 
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

	pushl $int_label
	pushl $scan
	call scanf
	addl $8,%esp

	movl $0, %eax
	movl int_label, %ebx

	cmp $0,%ebx
	jne loop_start
		movl $0,%eax
		jmp mypr
	loop_start:
		cmp $0,%ebx
		jne sum
			jmp loop_end
	sum: 
		 	addl %ebx, %eax
			dec %ebx
			jmp loop_start
	loop_end: jmp myprint


myprint: 
	pushl %eax
	pushl $print
	call printf
	addl $8,%esp


	movl %esp,%ebp
	popl %ebp

	movl $0, %eax
ret
