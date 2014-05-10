.data
printd_format:
        .string "%d\n"


printf_format:
        .string "%s\n"
print:
        .string "%d"


scanf_format:
        .string "%s"
my_str:
        .space 4
my_str_cmp:
        .space 4
str_out:
        .space 4
str_out1:
        .space 4


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


        movl $my_str, %edi


        movl $33, %eax
        cld
        repne scasb
        je found

        jmp not_found
found:
        movl $0,%ebx
        movl $3, %ecx
        movl $my_str, %esi
        movl $my_str_cmp, %edi

        repe cmpsb
        jg not_eq
        jl not_eq
go_on:
        movl $str_out, %edi
        movl $my_str, %esi
        movl $0,%ebx
        movl $3, %ecx
2:
        lodsb
        incb %al
        stosb
loop 2b
        movsb
        jmp exit
not_eq:
        movl $0,%ebx
        movl $3, %ecx

        movl $my_str, %esi
        movl $str_out, %edi
1:
        lodsb
        decb %al
        stosb
loop 1b
        movsb
        jmp exit

not_found:
         movl $0,%ebx
        movl $ 3, %ecx
        movl $my_str, %esi
        movl $str_out, %edi

1:
        lodsb
        stosb
loop 1b
        movsb

exit:
        pushl $str_out
        pushl $printf_format
        call printf

end:

        movl $0, %eax
        movl %ebp, %esp
        popl %ebp
        ret

