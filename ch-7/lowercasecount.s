#lowercasecount.s
#Counts the number of lower case letters in a string.

.globl _start
.section .data
mytext:
	.ascii "This is a string of characters.\0"

.section .text
_start:
	movq $mytext, %rbx	#move mytext string into base reg.
	movq $0, %rdi		#start lower case count into dest reg

mainloop:
	movb (%rbx), %al	#get next byte (next ascii char)
	cmpb $0, %al		#move to finish if we hit \0
	je finish

	cmpb $'a', %al		#compare ascii byte.
	jb loopcontrol		#if below 'a' then uppercase
	cmpb $'z', %al		
	ja loopcontrol 		#if above 'z' then it's a nonalpha symbol.

	incq %rdi

loopcontrol:
	incq %rbx		#increment the string pointer up 1 byte
	jmp mainloop		#unconditional jump to mainloop

finish:
	movq $60, %rax
	syscall
