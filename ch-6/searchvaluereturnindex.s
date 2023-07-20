#searchvaluereturnindexes
#Searches for and returns the index of the array
#if it's found, 0 if it's not.
#Will perform a linear search of the array.

.globl _start
.section .data
numberofnumbers: #elements in the array
	.quad 7

mynumbers: #array of numbers
	.quad 5, 20, 33, 80, 52, 10, 1

thenumber: #The number
	.quad 24

.section .text
_start:
	movq	numberofnumbers, %rcx	#move array size into counter register
	movq	$0, %rbx		#move the index into base register 
	movq	thenumber, %rdi		#move the number to find in the dest reg.

	cmp	$0, %rcx		#if empty array then end
	je	endloop

searchloop:
	movq	mynumbers(, %rbx, 8), %rax #use general address mode with index and mult 8 for quadword.
	cmp	%rdi, %rax		#compare the number with the array entry
	je	found			#jump to found if comparison is equal
	jmp 	loopcontrol		#otherwise jump to loopcontrol

loopcontrol:
	incq	%rbx			#increment the base register to move up in the array
	loopq 	searchloop		#decrement rcx by 1 and goto searchloop

notfound:
	movq	$0, %rdi		#If the rcx register is 0, prev instruction falls through.
	jmp	endloop			#avoid falling through into found block.

found:
	movq	%rbx, %rdi		#put the index into the destination register for the echo

endloop:
	movq	$60, %rax		#return control to the OS.
	syscall
