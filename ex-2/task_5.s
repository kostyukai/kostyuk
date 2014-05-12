.data
printd_format:
        .string "%d\n"
p:
        .space 4
i:
        .space 4

printf_format:
        .string "%s\n"


scanf_format:
        .string "%s"
scand_format:
        .string "%d"
my_str:
        .space 50
counter:
        .space 4
c:
        .space 4
slash:
        .string "\n"

.text
.globl main
main:
        pushl %ebp
        movl %esp, %ebp

        movl $my_str, %ebx
        movl $0, %ecx
read:
        pushl %ebx
        pushl %ecx
        call getchar
        popl %ecx
        popl %ebx

        cmpb $48, %al
        je continue_read
        movl %eax, (%ebx)
        incl %ebx
        incl %ecx
        jmp read
continue_read:
        decl %ecx
        movl %ecx, counter

        pushl $p
        pushl $scand_format
        call scanf
        decl p


        pushl $i
        pushl $scand_format
        call scanf

        movl $my_str, %ebx
        movl $0, c
print_1:
        movb (%ebx), %al
        pushl %eax
        call putchar
        incl %ebx
        incl c
        movl p, %ecx
        cmpl c, %ecx
        jg print_1


        movl $my_str, %ebx

        addl p, %ebx
        addl i, %ebx
        movl $0, c
print_2:
        movb (%ebx), %al
        pushl %eax
        call putchar
        incl %ebx
        incl c
        movl counter, %ecx
        cmpl c, %ecx
        jg print_2
        pushl $slash
        call printf


exit:
        movl $0, %eax
        movl %ebp, %esp
        popl %ebp
        ret
