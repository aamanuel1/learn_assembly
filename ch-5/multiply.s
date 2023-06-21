#multiply.s
#Exercise 4 in Chapter 5 of Learn to Program with Assembly
#Does mulq but does it through sequential adding.

.globl _start

.section .text
_start:
	movq 	$5, %rbx	#Store first operand for multiplcation into base
	movq 	$4, %rcx	#Store second operand for mult into counter.
	movq	$0, %rax	#Set accumulator to 0 to start.

mainloop:
	cmpq	$0, %rcx	#check if second operand equal to zero.
	jz	complete
	addq	%rbx, %rax	#Add first operand sequentially.
	decq	%rcx
	jmp 	mainloop

complete:
	movq	%rax, %rdi	#store result into destination reg.
	movq	$60, %rax	#end the program.
	syscall
