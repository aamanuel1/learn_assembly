#arithmetic.s

.globl _start
.section .text

_start:
	movq	$3, %rdi	#3 in rdi
	movq	%rdi, %rax	#3 in rax
	addq	%rdi, %rax	#3 + 3 = 6 in rax
	mulq	%rdi		#3 * 6 = 18 in rax
	movq	$2, %rdi	#2 in rdi
	mulq	%rdi		#18 * 2 = 36 in rax
	movq	$4, %rdi	#4 in rdi
	mulq	%rdi		#36 * 4 = 144 in rax
	movq 	%rax, %rdi	#move rax into rdi for return at exit

	#set exit system call number
	movq	$60, %rax
	
	#perform syscall
	syscall
