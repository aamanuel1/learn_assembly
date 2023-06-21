#valuesize.s

.section .text
.globl _start

_start:
	movw	$0b0000000100000010, %bx #16 bit value in bx
	addb	%bh, %bl 		 #add the high byte and low bite (1+2) and stored in bl
	movb 	$0, %bh 		 #zero out the high byte so the return is 3.
	movq 	%rbx, %rdi 		 #move the stored value in bx into rdi so we can echo it.

	movq 	$60, %rax 		 #get ready to terminate with exit code 60.
	syscall 			 #return control to OS.
