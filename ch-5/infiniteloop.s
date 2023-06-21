#infiniteloop.s
#This is the loop that never ends
#it just goes on and on... etc.

.globl _start

.section .text
_start:
	movq 	$60, %rax

another_location:
	movq	$8, %rdi
	jmp 	another_location
	
	#Will never return.
	syscall

