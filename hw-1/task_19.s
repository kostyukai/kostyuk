.data

N: .space 4

myscan: 
	.string "%d"
	.text
myprintt:
	.string "%d\n"
	.text

	.globl main


main:

	pushl %ebp
	movl %esp,%ebp



	pushl $N
	pushl $myscan
	call scanf
	addl $8,%esp

	movl N, %eax
	movl N, %ebx
	dec %ebx

	cmp $0,%eax
	jne not_equal
		movl $1, %eax
		jmp myprint

	not_equal: 
		cmp $1,%eax
		jne loop_start
			movl $1,%eax
			jmp myprint
	loop_start:
		
		mull %ebx
		dec %ebx
		cmp $0, %ebx
		je loop_end
		   
		   jmp loop_start
		

	loop_end: jmp myprint

myprint:
		pushl %eax
		pushl $myprintt
		call printf
		addl $8, %esp

	movl %esp,%ebp
	popl %ebp

	movl $0,%eax


 
  
ret



