.data
    int_1:
        .space 4
    fmt_int:
        .string "%x"
    fmt_int1:
        .string "%d"
        pr:
            .string "\n"

.text
    .globl main
main:
    pushl %ebp
    movl %esp, %ebp
	
    pushl $int_1
    pushl $fmt_int1 
    call scanf
    addl $8, %esp
    movl int_1, %eax 	 

 
    pushl %eax

    pushl $int_1
    pushl $fmt_int1
    call scanf
    addl $8, %esp
    movl int_1, %ebx

    popl %eax

    andl %ebx, %eax
    
  
    shll $3,%eax

    pushl %eax
    pushl $fmt_int1
    call printf
    addl $8, %esp

    



end:
    movl %ebp, %esp
    popl %ebp
    movl $0, %eax
    ret


