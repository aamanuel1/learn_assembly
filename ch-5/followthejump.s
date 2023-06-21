#followthejump.s
#A complex example with lots of jumps
#Should return 11 (in rdi, call echo $? in command line)

.globl _start

.section .text
_start:
	movq	$25, %rax	#1 move 25 into accumulator.
	jmp	thelabel	#2 jump to 3

somewhere:
	movq	%rax, %rdi	#13move value in accumulator (11) into destination register
	jmp	anotherlabel	#14 move to anotherlabel (#15)

label1:
	addq	%rbx, %rax	#7 add the value in the base reg (30). into the acc(25) and store in acc (55)
	movq	$5, %rbx	#8 store 5 in the base reg.
	jmp 	here		#9 jump to here label

labellabel:
	syscall			#17 end this monstrosity. rdi should have 11.

anotherlabel:
	movq	$60, %rax	#15 get ready for syscall
	jmp labellabel		#16 jump to labellabel to end this.

thelabel:
	movq	%rax, %rbx	#3 move accumulator val (25) to rbx (base reg)
	jmp	there		#4 jump to "there"

here:
	divq	%rbx		#10 divide the source (rax) by rbx (5) or 55/5=11 no remainder (rdx=0)
	jmp	somewhere	#11 jump to someshere (#12)

there:
	addq	$5, %rbx	#5 add 25+5=30 and store in rbx
	jmp 	label1		#6 jump to label1.

anywhere:
	jmp	thelabel	#dead code.
	
