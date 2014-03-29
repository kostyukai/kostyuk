	.data
.globl array
array:
.space 12
scan:
.string	"%d"
print:
.string "%d\n"
min:
.space 4
count:
.space 4
.text
.globl	main
main:
pushl	%ebp 
movl	%esp, %ebp
movl $0,	%eax
movl %eax, count
jmp	next_1
init:
movl	count, %eax
sall	$2, %eax
addl	$array, %eax
pushl	%eax
pushl	$scan
call	scanf
addl $8, %esp
movl count, %eax
addl	$1, %eax
movl %eax, count
next_1:
movl count, %eax
cmpl	$2, %eax 
jle	init

movl array, %eax 
movl %eax, min

movl $1, %eax
movl %eax, count
jmp next_2
small_one:
movl count, %eax
sall $2, %eax
addl $array, %eax

movl (%eax), %edx
movl %edx, %eax

movl min, %ebx
cmpl %ebx, %eax
js more
jmp less
more: 
movl %eax, min
less: 
movl count, %eax
addl $1, %eax
movl %eax, count
next_2:
movl count, %eax
cmpl $2, %eax
jle small_one	
movl min, %eax
pushl %eax
pushl $print
call printf
addl $8, %esp

movl %ebp, %esp 
popl %ebp

movl	$0, %eax
ret
