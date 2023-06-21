# binaryexit.s

.section .text
.globl _start
_start:
	movq 	$0b1111, %rdi	#move 15 in binary to rdi dest register
	movq	$60, %rax	#move exit number 60 into rax for syscall
	syscall			#return exit code 13 in rdi after syscall to stop program.
