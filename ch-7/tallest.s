#tallest.s
#Finds the tallest entry in the persondata.s file

.globl _start
.section .text
_start:
	leaq people, %rbx	#First record in base reg
	movq numpeople, %rcx	#Number of people in counter reg
	movq $0, %rdi		#Tallest value found in dest reg

	cmpq $0, %rcx		#Empty array then end.
	je finish

mainloop:
	# Direct memory mode, basereg is pointing to the start of struct,
	# Store in rax 
	movq HEIGHT_OFFSET(%rbx), %rax

	cmpq %rdi, %rax		#compare the tallest in rdi with the current record
	jbe endloop		#If rax below or equal to rdi then don't replace
	
	movq %rax, %rdi		#If rax above rdi then replace

endloop:
	#Move rbx to point to next record, 
	#then increment rcx and return to mainloop
	addq $PERSON_RECORD_SIZE, %rbx
	loopq mainloop

finish:
	movq $60, %rax		#Return control to OS
	syscall

