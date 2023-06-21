#exponentloop.s
#Calculates exponents but this time use conditional branches
#will calculate 2^3. (=8)
#modify %rbx (base register) and %rcx (counter register)
#to calculate another exponential.

.globl _start

.section .text
_start:
	movq	$2, %rbx	#%rbx will hold the base (2^x)
	movq 	$3, %rcx	#%rcx will hold the current exponent count
	movq	$1, %rax	#store the accumulated value in accumulator (%rax)
	cmpq	$0, %rcx	#compare 0 and rcx
	je complete		#jump if compare sets 0 flag (0 and rcx are equal)

mainloop:
	mulq	%rbx		#Otherwise, multiply rax by the base (rbx).
	loopq	mainloop	#loopq does the decrementing of rcx, and jump/comparisons in one command.

complete:
	movq	%rax, %rdi	#move accumulated value to destination register to return it.
	
	#call the "exit" system call
	movq	$60, %rax
	syscall 
