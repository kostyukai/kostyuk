.data
    int_1:
        .space  4
    fmt_int:
        .string "%x"
    fmt_int1:
        .string "%d"
    hello_string:
        .string "Enter your number:\n"
.text
    .globl main
main:
    pushl   %ebp        
    movl    %esp,   %ebp    
    
    pushl   $hello_string   
    call    printf
    addl    $4, %esp
    
    pushl   $int_1      
    pushl   $fmt_int    
    call    scanf
    addl    $8,     %esp
    movl    int_1,  %eax
    
    movl    $32,    %ecx

    shear:
        shll    $1,%eax
        /*pushl   %eax
                pushl   $fmt_int
                call printf
                addl    $8,     %esp*/

        movl    $0, %ebx
        jnc     printb
        incl    %ebx
        
    printb:
        pushl   %eax
        pushl   %ecx
        pushl   %ebx
        pushl   $fmt_int1   
        call printf
        addl    $8, %esp
        popl    %ecx
        popl    %eax
    loop    shear

    movl    %ebp,   %esp
    popl    %ebp
    ret

