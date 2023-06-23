#largestvaluercx.s
#finds the largest value and returns it from an "array" of numbers
#Similar to largestvalue.s but decrements the index instead.

.globl _start

.section .data
numberofnumbers: #The sizeof the mynumbers array
	.quad 7

mynumbers: #the array.
	.quad 5, 20, 33, 80, 52, 10, 1

.section .text
_start:
	movq 	numberofnumbers, %rcx 	#put sizeof array in counter register
	movq	$0, %rdi		#zero out the result register.
	cmp	$0, %rcx		#if there are no numbers, stop
	je endloop

myloop:
	#shift -8 bytes from the numberofnumbers count and get the next value.
	movq	mynumbers-8(,%rcx,8), %rax #get the next value using general index value(basereg, idxreg, multiplier)
	cmp	%rdi, %rax		#Check if biggest element is bigger than current element (rax)
					
	jbe	loopcontrol		#if not bigger, go to the end of the loopi		
	movq	%rax, %rdi		#Else store as biggest element in rdi

loopcontrol:
	loopq	myloop			#loopq decrements rcx and checks if zero.
	
endloop:
	mov	$60, %rax
	syscall

