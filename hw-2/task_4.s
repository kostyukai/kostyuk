        .data
fmt_str:
        .string "%f"
x:
        .space 4
y:
        .space 4
        .text
        .globl main
main:
        pushl %ebp
        movl %esp, %ebp

        //subl $16, %esp

        pushl $x
        pushl $fmt_str
        call scanf

        pushl $y
        pushl $fmt_str
        call scanf

        fldl y
        fldl x

        fstpl (%esp)
        pushl $fmt_str
        call printf


        fyl2x

        /*fstpl 4(%esp)
        movl $fmt_str, (%esp)
        call printf*/

        movl $0, %eax
        movl %ebp, %esp
        popl %ebp
        ret
