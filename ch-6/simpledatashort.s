#simpledata.s
#Allocates and initializes 3 quadwords of data
#Add two of them and store the result.

.globl _start

.section .data
first_value:
	.quad 4

second_value:
	.quad 6

final_result:
	.quad 0

.section .text
_start:
	#Load the values into the registers
	movq 	first_value, %rbx
	movq	second_value, %rcx

	#add them
	addq	%rbx, %rcx

	#store into final result.
	movq	%rcx, final_result

	#Return value to OS
	movq	$60, %rax
	movq	final_result, %rdi
	syscall

	
