#largestvalue.s
#finds the largest value and returns it from an "array" of numbers

.globl _start

.section .data
numberofnumbers: #The sizeof the mynumbers array
	.quad 7

mynumbers: #the array.
	.quad 5, 20, 33, 80, 52, 10, 1

.section .text
_start:
	movq 	numberofnumbers, %rcx 	#put sizeof array in counter register
	movq 	$mynumbers, %rbx	#put address of first element in base register.
	movq	$0, %rdi		#zero out the result register.
	cmp	$0, %rcx		#if there are no numbers, stop
	je endloop

myloop:
	movq	(%rbx), %rax		#get the next value indirectly addressed  by (%rbx)
	cmp	%rdi, %rax		#Check if biggest element is bigger than current element (rax)
					
	jbe	loopcontrol		#if not bigger, go to the end of the loopi		
	movq	%rax, %rdi		#Else store as biggest element in rdi

loopcontrol:
	addq	$8, %rbx		#change address in %rbx to point to next value.
	loopq	myloop			#loopq decrements rcx and checks if zero.
	
endloop:
	mov	$60, %rax
	syscall

