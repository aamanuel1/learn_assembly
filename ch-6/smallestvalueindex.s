#largestvalueindex.s
#finds the largest value and returns it from an "array" of numbers
#Similar to largestvalue.s but increments index.

.globl _start

.section .data
numberofnumbers: #The sizeof the mynumbers array
	.quad 7

mynumbers: #the array.
	.quad 5, 20, 33, 80, 52, 10, 1

.section .text
_start:
	movq 	numberofnumbers, %rcx 	#put sizeof array in counter register
	movq 	$0, %rbx		#put index of first element in base register.
	movq	$0, %rdi		#zero out the result register.
	cmp	$0, %rcx		#if there are no numbers, stop
	je endloop
	
	movq	mynumbers, %rdi		#place first value if there is at least one value in the array.

myloop:
	movq	mynumbers(,%rbx,8), %rax #get the next value using general index value(basereg, idxreg, multiplier)
	cmp	%rdi, %rax		#Check if smallest element is bigger than current element (rax)
					
	jae	loopcontrol		#if not smaller, go to the end of the loopi		
	movq	%rax, %rdi		#Else store as smallest element in rdi

loopcontrol:
	incq	%rbx			#increment index in rbx to next index.
	loopq	myloop			#loopq decrements rcx and checks if zero.
	
endloop:
	mov	$60, %rax
	syscall

