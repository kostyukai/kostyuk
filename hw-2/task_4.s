#x>0 !!!
        
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

        movl x, %eax
        movl y, %ebx

        cmpl $0, %ebx
        je   m1

        flds y
        flds x

        fyl2x

        fstpl (%esp)
        pushl $fmt_str
        call printf




        movl $0, %eax
        movl %ebp, %esp
        popl %ebp
        ret
        
FRNDINT ОКРУГЛЕНИЕ
