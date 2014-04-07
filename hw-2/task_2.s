.data
printd_format:
        .string "%d\n"


printf_format:
        .string "%s\n"

scanf_format:
        .string "%s"
my_str:
        .space 10
my_str_cmp:
        .space 10
str_out:
        .space 10

.text
.globl main
main:
        pushl %ebp
        movl %esp, %ebp

        pushl $my_str
        pushl $scanf_format
        call scanf

        pushl $my_str_cmp
        pushl $scanf_format
        call scanf


        movl $my_str, %esi
        movl $str_out, %edi
        movl $0,%ebx
        movl $ 9, %ecx
1:
        lodsb
        incb %al
        stosb
loop 1b
        movsb


        pushl $str_out
        pushl $printf_format
        call printf
        addl $8, %esp

/*      movb $1, %al
        movl $0, %ebx
        movl $10, %ecx
        movl $my_str, %esi

mov_el:
        repe scasb
        jcxz exit
        incl %ebx
        jmp mov_el

*/

          movl $my_str, %esi
        movl $my_str_cmp, %edi
        repe cmpsb
        jnz exit
        pushl $my_str
        pushl $printd_format
        call printf

exit:
        pushl $my_str
        pushl $printd_format
        call printf

end:

        movl $0, %eax
        movl %ebp, %esp
        popl %ebp
        ret
