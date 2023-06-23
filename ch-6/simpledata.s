#simpledatashort.s
#Allocates and initializes 3 quadwords of data
#Add two of them and store the result.
#Same as simpledata.s but shorter.

.globl _start

.section .data
first_value:
	.quad 4

second_value:
	.quad 6

.section .text
_start:
	#Load the values into the registers and add on the fly.
	movq 	first_value, %rdi
	addq	second_value, %rdi

	#Return value to OS
	movq	$60, %rax
	syscall

	
