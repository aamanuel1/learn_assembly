#evenodd_loop.s
#tells you if a number is even or odd using loops
#and addq

.globl _start

.section .text
_start:
	movq 	$5, %rax	#Store 2 in rax to check even.
	movq	$2, %rbx	#Store number to check in rbx
	movq	$0, %rdx	#zero out the remainder

loop:
	subq	%rax, %rax	#5/2 = 2 remainder 1
	cmpq 	$0, %rax	#compare to 0, if equal then even
	je	even
	jb	odd
	jmp	loop		#Otherwise jump to odd

even:
	movq	$1, %rdi	#return 1
	jmp 	complete	#jump to complete

odd:
	movq	$0, %rdi	#return 0, no need for jump, falls through.

complete:
	movq	$60, %rax	#initiate end of program.
	syscall
