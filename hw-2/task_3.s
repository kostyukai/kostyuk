# sum of a 4-elements array
.data
fmt_string:
.string "%f"
array:
.space 16
fmt_string_pr:
.string "%f\n"
.text

sum:

pushl %ebp
movl %esp, %ebp

subl $12, %esp 
movl $0x00000000, %eax
movl %eax, -8(%ebp) #s = 0.0;
movl $0, -4(%ebp) #i = 0;
jmp check
loop_start:
movl -4(%ebp), %eax #eax = i;
sall $2, %eax #sizeof(float) 
addl 8(%ebp), %eax
flds (%eax) #a[i]
flds -8(%ebp) #s
faddp %st, %st(1) #s = s + a[i];
fstps -8(%ebp)
addl $1, -4(%ebp) #i++;
check:
movl -4(%ebp), %eax
cmpl 12(%ebp), %eax #i < n
jl loop_start
movl -8(%ebp), %eax #return s;
movl %eax, -12(%ebp)
flds -12(%ebp)

movl %ebp, %esp
popl %ebp
ret
.globl main
main:

pushl %ebp
movl %esp, %ebp
#Read input data section
movl $0, %ecx
begin:
movl %ecx, %eax
sall $2, %eax
addl $array, %eax
pushl %ecx
pushl %eax
pushl $fmt_string
call scanf
addl $8, %esp
popl %ecx
incl %ecx
cmpl $4, %ecx
jl begin

subl $20, %esp
movl $4, 4(%esp)
movl $array, (%esp)
call sum
fstpl 4(%esp)
movl $fmt_string_pr, %eax
movl %eax, (%esp)
call printf

movl $0, %eax
movl %ebp, %esp
popl %ebp
ret
