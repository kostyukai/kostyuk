.data
printd_format:
        .string "%d\n"


printf_format:
        .string "%s\n"
p:
        .space 4

str_1:
        .space 20
str_2:
        .space 20
scanf_format:
        .string "%s"
scand_format:
        .string "%d"

counter_1:
        .space 4
counter_2:
        .space 4
help_counter:
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

        movl $str_1, %ebx
        movl $0, %ecx
read_str_1:
        pushl %ebx
        pushl %ecx
        call getchar
        popl %ecx
        popl %ebx

        cmpb $48, %al
        je count_1
        movl %eax, (%ebx)
        incl %ebx
        incl %ecx
        jmp read_str_1
count_1:
        movl %ecx, counter_1
        movl $str_2, %ebx
        movl $0, %ecx
read_str_2:
        pushl %ebx
        pushl %ecx
        call getchar
        popl %ecx
        popl %ebx

        cmpb $48, %al
        je  read_p
        movl %eax, (%ebx)
        incl %ebx
        incl %ecx
        jmp read_str_2
read_p:
        movl %ecx, counter_2
        pushl $p
        pushl $scand_format
        call scanf

 movl $str_1, %ebx
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

        movl $str_2,%ebx
        movl $0, c
print_2:
        movb (%ebx), %al
        pushl %eax
        call putchar
        incl %ebx
        incl c
        movl counter_2, %ecx
        cmpl c, %ecx
        jg print_2




        movl $str_1, %ebx

        addl p, %ebx
        movl $0, c
print_3:
        movb (%ebx), %al
        pushl %eax
        call putchar
        incl %ebx
        incl c
        movl counter_1, %ecx
        cmpl c, %ecx
        jg print_3
        pushl $slash
        call printf

exit:
        movl $0, %eax
        movl %ebp, %esp
        popl %ebp
        ret
