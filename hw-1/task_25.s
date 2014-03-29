	.data
	.globl a
	
        a:
            .space 4

	.globl b

        b:
            .space 4
	.globl c

        c:
            .space 4
	.globl d

        d:
            .space 4
	.globl e

        e:
            .space 4
	.globl case
	case:
		.space 4	
	in:
            .string "%d"

        out:
            .string "%d\n"
            .text
            .globl pointer
            
    pointer:
            pushl   %ebp
            movl    %esp, %ebp

	  cmpl	$1, case
	  je	one

	    cmpl  $2, case
          je    two

	    cmpl  $3, case
          je    three

	    cmpl  $4, case
          je    four

	    cmpl  $5, case
          je    five
one:
	movl $a, %eax
	jmp next
two:    
        movl $b, %eax
	jmp next

three:    
        movl $c, %eax
	jmp next

four:    
        movl $d, %eax
	jmp next

five:    
        movl $e, %eax
	jmp next


next:
	    movl    %ebp, %esp
            popl    %ebp
            
            ret

	.globl main
            
    main:
            pushl   %ebp
            movl    %esp, %ebp
		
            pushl	$case
	    pushl	$in
	    call	scanf
            call    pointer
            
            pushl   %eax
            pushl   $out
            call    printf
            addl    $8, %esp
            movl    $0, %eax
            
            movl $0,%eax
            movl    %ebp, %esp
            popl    %ebp
            ret
