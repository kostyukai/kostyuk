.data
fmt_scan:
        .string "%s"
fmt_print:
        .string "%d\n"
str:
        .space 10
.text
.globl main
main:
        pushl %ebp
        movl %esp, %ebp


        pushl $str
        pushl $fmt_scan
        call scanf
        addl $8, %esp

        movl $str, %ebx
start:
        incl %ebx
        addl $1, %eax
        cmpl $0 , (%ebx)
        jne start


        decl  %eax
        decl  %eax


        pushl %eax
        pushl $fmt_print
        call printf

        addl $8, %esp
        movl $0, %eax
        movl %ebp, %esp
        popl %ebp
        ret
