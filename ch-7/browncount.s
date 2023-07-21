#browncount.s
#Counts the number of people with brown hair.
#Similar to tallest.s

.globl _start
.section .text
_start:
	
	#similar to tallest.s, store pointer,
	#record count, and brown hair count
	leaq people, %rbx
	movq numpeople, %rcx
	movq $0, %rdi

	#Check preconditions
	cmpq $0, %rcx	#Empty array check
	je finish
	
mainloop:
	#check if hair part of struct is equal to code 2.
	#if not equal to 2 then increment the pointer and start again
	cmpq $2, HAIR_OFFSET(%rbx) 	
	jne endloop			
	incq %rdi

endloop:
	#Advance the base register by person_record_size
	addq $PERSON_RECORD_SIZE, %rbx
	loopq mainloop

finish:
	movq $60, %rax
	syscall
