.data
printd_format:
        .string "%d\n"


printf_format:
        .string "%s\n"

str_1:
        .space 20
str_2:
        .space 20
scanf_format:
        .string "%s"

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
        je count_2
        movl %eax, (%ebx)
        incl %ebx
        incl %ecx
        jmp read_str_2
count_2:
        movl %ecx, counter_2
check_1:
        movl counter_1, %eax
        cmpl counter_2,%eax
        jl no_consist
check_2:
        movl $0, %ecx
        movl $0, help_counter
        movl $str_1, %ebx
cmp_1:
        incl %ebx
        incl help_counter
        movl help_counter, %eax
        cmpl counter_1, %eax
        je no_consist

        movl $0,%ecx
        movl $str_2, %edx

compare:
        movb (%edx), %al
        cmpb (%ebx), %al
        jne cmp_1
        incl %ecx
        cmpl counter_2, %ecx
        je consist
        incl %ebx
        incl %edx
        jmp compare
no_consist:
        movl $100, %eax
        pushl %eax
        pushl $printd_format
        call printf
        jmp exit
consist:
         movl help_counter, %eax

        pushl %eax
        pushl $printd_format
        call printf



exit:
        movl $0, %eax
        movl %ebp, %esp
        popl %ebp
        ret
