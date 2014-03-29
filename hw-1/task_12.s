.data

	int_1:
		.space 4
	int_2:
                .space 4
	fmt_int:
		.string "%d"
	stradd:
		.string "%d " #a+b
	strsub:
                .string "%d " #a-b
	strdiv:
                .string "%d\n" #a/b
	strmul:
                .string "%d " #a*b

	
.text
	.globl main
main:
	pushl	%ebp		
	movl	%esp, 	%ebp

	
	pushl	$int_1		
	pushl	$fmt_int	
	call	scanf
	addl	$8, 	%esp	
	pushl	$int_2		
	pushl	$fmt_int	#"%d"
	call	scanf
	addl	$8, 	%esp
	movl    int_1,  %eax
	

	addl int_2, %eax
	pushl   %eax 
	pushl   $stradd
	call printf
	addl    $8,     %esp
	
	movl    int_1,  %eax	

	subl int_2, %eax
        pushl   %eax
        pushl   $strsub
        call printf
        addl    $8,     %esp

	movl    int_1,  %eax
	movl	int_2,	%ebx

        mull 	%ebx
        pushl   %eax
        pushl   $strmul
        call printf
        addl    $8,     %esp

	movl    int_1,  %eax

        movl    int_2,  %ebx

	sarl 	$31, %edx
	divl 	%ebx       
        pushl   %eax
        pushl   $strdiv        
        call printf
        addl    $8,     %esp

	movl $0, %eax
	movl %ebp, %esp
        popl %ebp
        ret




























