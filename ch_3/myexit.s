# This just runs once and exits with status code.
# Hello world!

.globl _start 		#this is the symbol for the entry point

.section .text		#start of code section

_start:			#entry point
	movq    $60, %rax	#move quadword (immediate dec 60) into rax register for exit syscall
    	movq    $3, %rdi	#move quadword (imm dec 3) to rdi register for exit code 3.
    	syscall #transfer control to os.
