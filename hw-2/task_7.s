.data
printd_format:
        .string "%d\n"
printc_format:
	.string "%c\n"

printf_format:
        .string "%s\n"

str_1:
        .string "NO\n"
str_2:
        .string "YES\n"
scanf_format:
        .string "%s"
my_str:
        .space 100
my_str_cmp:
        .space 4
str_out:
        .space 4
str_out1:
        .space 4
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

        cmpb $33, %al
        je work
        movl %eax, (%ebx)
        incl %ebx
        incl %ecx
        jmp read
work:
       // decl %ecx
        movl %ecx, counter
	/*pushl counter
	pushl $printd_format
	call printf*/
	
        movl $my_str, %ebx
        movl $0, c
check:
        addl counter, %ebx
        decl %ebx
	/*pushl (%ebx)
	pushl $printc_format
	call printf*/
        cmpb $65, (%ebx)
        jl rule_2_1
        cmpb $90, (%ebx)
        ja rule_2_1
        movb (%ebx), %al
        movl counter, %ecx
        decl %ecx
        movl $my_str, %ebx
        my_cmp:
                cmpb (%ebx), %al
                je rule_2_1
                incl %ebx
        loop my_cmp


        jmp rule_1

rule_2_1:
	movl $my_str, %ebx
	// jmp continue
	movl $0, c
rule_2:
        movb (%ebx), %al
        pushl %eax
        call putchar
        call putchar
        incl %ebx
        incl c
        movl counter, %ecx
        cmpl c, %ecx
        jg rule_2
        pushl $slash
        call printf

        jmp exit

rule_1:
	//jmp continue
        movl $my_str, %ebx
        movl counter, %ecx
        decl %ecx
        change:
                 cmpb $49, (%ebx)
                 jl pass
                cmpb $57, (%ebx)
                ja pass
                addb $48, (%ebx)
        pass:
                incl %ebx
                loop change

continue:
        movl $my_str, %ebx
        movl $0, c
print:
        movb (%ebx), %al
        pushl %eax
        call putchar
        incl %ebx
        incl c
        movl counter, %ecx
        cmpl c, %ecx
        jg print
        pushl $slash
        call printf


exit:
        movl $0, %eax
        movl %ebp, %esp
        popl %ebp
        ret
