.data

fmt_char:
	.space 1
fmt_short:
        .space 2
fmt_int:
        .space 4
fmt_double:
        .space 8

fmt_sc:
	.string "%c %hd %d %lf"
fmt_pr_c:
	.string "%c "
fmt_pr_s:
        .string "%hd "
fmt_pr_i:
        .string "%d "
fmt_pr_d:
        .string "%lf\n"
.text
.globl main

function:
	pushl %ebp
	movl %esp, %ebp
	
	pushl $fmt_double
	pushl $fmt_int
	pushl $fmt_short
	pushl $fmt_char
	pushl $fmt_sc
	call scanf
//char
	movb fmt_char, %al
	pushl %eax
	 pushl $fmt_pr_c
        call printf
//short
	   movw fmt_short, %ax
        pushl %eax
         pushl $fmt_pr_s
        call printf
//int
	   movl fmt_int, %eax
        pushl %eax
         pushl $fmt_pr_i
        call printf
//double
	   	fldl fmt_double
movl $fmt_pr_d, %eax
fstpl	4(%esp)
movl %eax, (%esp)
call printf
//pushl $pr
//call printf

	movl $0, %eax
	movl %ebp, %esp	
	popl %ebp
	ret
main:
        pushl %ebp
        movl %esp, %ebp
	
	call function
	
	    movl $0, %eax
        movl %ebp, %esp 
        popl %ebp
        ret


