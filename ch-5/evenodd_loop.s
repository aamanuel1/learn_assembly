#evenodd_divq.s
#tells you if a number is even or odd using divq
#and the modulus concept.

.globl _start

.section .text
_start:
	movq 	$6, %rax	#Store 2 in rax to check even.
	movq	$2, %rbx	#Store number to check in rbx
	movq	$0, %rdx	#zero out the remainder
	divq	%rbx		#5/2 = 2 remainder 1
	cmpq 	$0, %rdx	#compare to 0, if equal then even
	je	even
	jmp	odd		#Otherwise jump to odd

even:
	movq	$1, %rdi	#return 1
	jmp 	complete	#jump to complete

odd:
	movq	$0, %rdi	#return 0, no need for jump, falls through.

complete:
	movq	$60, %rax	#initiate end of program.
	syscall
