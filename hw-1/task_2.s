.data
	int_1:
		.space	4
	fmt_int:
		.string	"%d"
	endl:
		.string "\n"
.text
	.globl main
main:
	pushl	%ebp		
	movl	%esp, 	%ebp	
	
	pushl	$int_1		
	pushl	$fmt_int	
	call	scanf
	addl	$8, 	%esp
	movl	int_1,	%eax
	
	movl	$32,	%ecx

	shear:
		shll	$1,%eax

		movl	$0, %ebx
		jnc 	printb
		incl	%ebx
		
	printb:
		pushl 	%eax
		pushl	%ecx
		pushl	%ebx
		pushl	$fmt_int	
		call printf
		addl	$8,	%esp
		popl	%ecx
		popl	%eax
	loop	shear

        pushl   $endl
        call printf
        addl    $4,     %esp


	movl	%ebp,	%esp
	popl	%ebp
	movl $0, %eax
	ret

