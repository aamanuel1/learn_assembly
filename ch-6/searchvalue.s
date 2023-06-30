#searchvalue.s
#Searches for and returns 1 if it's found, 0 if it's not.
#Will perform a linear search of the array.

.globl _start
.section .data
numberofnumbers:
	.quad 7

mynumbers:
	.quad 5, 20, 33, 80, 52, 10, 1

thenumber:
	.quad 80

.section .text
_start:
	movq	numberofnumbers, %rcx
	movq	$0, %rbx
	movq	thenumber, %rdi

	cmp	$0, %rcx
	je	endloop

searchloop:
	movq	mynumbers(, %rbx, 8), %rax
	cmp	%rdi, %rax
	je	found
	cmp	$0, %rcx
	je 	notfound

loopcontrol:
	loopq 	searchloop

notfound:
	movq	$0, %rdi
	jmp	endloop

found:
	movq	$1, %rdi

endloop:
	movq	$60, %rax
	syscall
