    .data
hello_string:
    .string "Enter your number:\n"
int_1:
    .space  4
int_2:
    .space  4
fmt_int:
    .string "%d"
fmt_endl:
    .string "\n"
format_print:
    .string "scanned = %d\n"
format_eax_edx:
    .string "eax = %d\t edx = %d\n"
format_edx:
    .string "edx\t= %d\n"
    
    .text
    .globl  main
main:
    pushl   %ebp        #Prolog
    movl    %esp,   %ebp    #Prolog
    
    pushl   $hello_string   #"Enter your number"
    call    printf
    addl    $4, %esp
    
    pushl   $int_1      
    pushl   $fmt_int    #"%d"
    call    scanf
    addl    $8,     %esp
    movl    int_1,  %eax    #scanned value is in eax
    
    movl    $0, %edx    #edx = 0;
    movl    $0, %ebx    #ebx is counter
    movl    $2, %ecx    #ecx = 2;
    
start:
    cmpl    $0, %eax    #(eax==0)?
    jng middle

    movl    $0, %edx    #NB!    eax = (edx:eax)/ecx
#   movl    $2, %ecx    #ecx = 2;   
    divl    %ecx        #edx = eax mod ecx; eax = (edx:eax)/ecx;
    pushl   %edx
    
    incl    %ebx        #ebx++;
    jmp start   
middle:
    cmpl    $0, %ebx    #ebx is counter
    jng end 

    pushl   $fmt_int    #"%d"   
    call printf
    addl    $8, %esp

    decl    %ebx        #ebx--;
    jmp middle  
end:    

    pushl   $fmt_endl
    call printf
    addl    $4, %esp
    
    movl    %ebp,   %esp
    popl    %ebp
    ret
