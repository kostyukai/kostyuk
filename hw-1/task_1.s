	.data
int_1:
        .space 4
fmt_str:
        .string "%d"

        .text
        .globl main
main:
        pushl %ebp
        movl %esp, %ebp

        pushl $int_1
        pushl $fmt_str
        call scanf

        movl int_1, %eax
        pushl %eax
        pushl $fmt_str
        call printf

        movl %ebp, %esp
        popl %ebp
             
	ret       
