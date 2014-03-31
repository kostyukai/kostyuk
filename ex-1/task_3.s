.data
fmt_scan:
        .string "%c"
fmt_print:
        .string "%c"
pr:
        .string "\n"
bit:
        .space 1
.text
.globl main
main:
        pushl %ebp
        movl %esp, %ebp
        movl $9, %ebx
start:
        cmpl $0 , %ebx
        je end2
        decl %ebx
        pushl $bit
        pushl $fmt_scan
        call scanf
        addl $8, %esp

        movb bit, %al

        pushl %eax

        jmp start

end2:

        movl $10, %ebx
start2:
         cmpl $0 , %ebx
        decl %ebx
        je end

        pushl $fmt_print
        call printf

        addl $8, %esp

        jmp start2
end:
        pushl $pr
        call printf

        addl $4, %esp

        movl $0 , %eax
        movl %ebp, %esp
        popl %ebp
        ret

