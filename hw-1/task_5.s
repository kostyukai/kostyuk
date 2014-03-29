	.data
in:
	.string "%f"
int_print:
	.string "%d"
float:
	.space 4
out:
	.string "\n"
	.text
	.globl main
main:
	pushl	%ebp	
	movl	%esp,	%ebp

	pushl	$float	
	pushl	$in
	call	scanf
	addl	$8,	%esp

	movl	float,	%eax	
	movl	$32,	%ecx
	movl	$0,	%edx 
move:
	shll	$1,	%eax
	movl	$0,	%ebx
	jnc	print	
	movl	$1,	%ebx
	movl	$1,	%edx 
print:
	cmpl	$1,	%edx
	jne	end

	pushl	%edx	
	pushl	%ecx
	pushl	%eax
	
	pushl	%ebx	
	pushl	$int_print
	call	printf
	addl	$8,	%esp

	popl	%eax	
	popl	%ecx
	popl	%edx
end:
	loop	move

	pushl	$out
	call	printf
	addl	$4, %esp

	movl	%ebp,	%esp	
	popl	%ebp

	movl	$0,	%eax	
ret
