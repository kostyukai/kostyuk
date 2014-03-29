#<2 -2 2<x<6 -4 6<x<18 -12 x>18 -24

.data

 int_l:
 	.space 4
scan_str:
	.string "%d"
	.text
s2:
	.string "2\n"
	.text
s4:
	.string "4\n"
	.text
s12:  
	.string "12 \n"
	.text
s24:
	.string "24\n"
	.globl main
main:
	pushl %ebp
	movl %esp,%ebp


	
	pushl $int_l
	pushl $scan_str
	call scanf
	addl $8,%esp
	movl int_l, %eax
   
     	cmp $2, %eax
	jb  case2
		cmp $6,%eax
		jb case6
			cmp $18,%eax
			jb case18

			jmp case19
	case2:
		pushl %eax
		pushl $s2
		jmp next
	case6:
		pushl %eax
		pushl $s4
		jmp next
	case18:
		pushl %eax
		pushl $s12
		jmp next
	case19:
		pushl %eax
		pushl $s24
		jmp next
	

	next: 
		call printf
		addl $8, %esp

		 movl %esp,%ebp
		 popl %ebp
		 movl $0,%eax

		 ret
