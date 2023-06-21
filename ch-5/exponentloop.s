#exponent.s
#Calculates exponents
#will calculate 2^3. (=8)
#modify %rbx (base register) and %rcx (counter register)
#to calculate another exponential.

.globl _start

.section .text
_start:
	movq	$2, %rbx	#%rbx will hold the base (2^x)
	movq 	$3, %rcx	#%rcx will hold the current exponent count
	movq	$1, %rax	#store the accumulated value in accumulator (%rax)
	
mainloop:
	addq	$0, %rcx	#add zero to exponent allow use of zero flag in next line.
	
	jz complete		#if exponent was 0 (rcx was 0) jump to end

	mulq	%rbx		#Otherwise, multiply rax by the base (rbx).
	decq	%rcx		#decrement exponent count
	jmp mainloop		#loop until exponent count is 0.

complete:
	movq	%rax, %rdi	#move accumulated value to destination register to return it.
	
	#call the "exit" system call
	movq	$60, %rax
	syscall 
