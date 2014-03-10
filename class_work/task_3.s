.text
.globl  my_extern_sub
        my_extern_sub:
                pushl   %ebp
                movl    %esp, %ebp

                pushl   %ebx
                movl    8(%ebp), %eax
                movl    12(%ebp), %ebx
                subl    %eax, %ebx
                movl    %ebx, %eax
                jmp     return
.globl  my_extern_div
        my_extern_div:
                pushl   %ebp
                movl    %esp, %ebp

                pushl   %ebx
                movl    8(%ebp), %eax
                movl    12(%ebp), %ebx
                sarl    $31, %edx
 divl    %ebx
                jmp     return

.globl my_extern_add
        my_extern_add:
                pushl   %ebp
                movl    %esp, %ebp

                pushl   %ebx
                movl    8(%ebp), %eax
                movl    12(%ebp), %ebx
                addl    %eax, %ebx
                movl    %ebx, %eax
                jmp     return
.globl  my_extern_mul
        my_extern_mul:
                pushl   %ebp
                movl    %esp, %ebp

                pushl   %ebx
                movl    8(%ebp), %eax
   movl    12(%ebp), %ebx
                mull    %ebx
                jmp     return


        return:
                popl    %ebx
                movl    %ebp, %esp
                popl    %ebp
                ret

