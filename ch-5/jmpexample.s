#jmpexample.s
#an example of the jump instruction.
#Prints 7 and not 8.

.globl _start

.section .text
_start:
	movq	$7, %rdi	#move 7 into dest. register
	jmp 	nextplace	#jump to nextplace marker

	#Dead code
	movq	$8, %rbx
	addq	%rbx, %rdi

nextplace:
	movq	$60, %rax	#exit system call code
	syscall
