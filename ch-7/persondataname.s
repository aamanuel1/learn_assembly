#persondataname.s
#Includes all the person-data data for use in ch 7.
#Shoe offset added from persondata.s, name now included.

.section .data
.globl people, numpeople
numpeople:
	#calc the number of people in the array
	.quad (endpeople - people) / PERSON_RECORD_SIZE

people:
	#Array of people
	.ascii "Gilbert Keith Chester\0"
	.quad 200, 10, 2, 74, 20
	.ascii "Jonathan Bartlett\0"
	.quad 280, 12, 2, 72, 44
	.ascii "Clive Silver Lewis\0"
	.quad 150, 8, 1, 68, 30
	.ascii "Tommy Aquinas\0"
	.quad 250, 14, 3, 75, 24
	.ascii "Isaac Newn\0"
	.quad 250, 10, 2, 70, 11
	.ascii "Gregory Mend\0"
	.quad 180, 11, 5, 69, 65
endpeople: #End of array

#Describe the struct.
.globl NAME_OFFSET, WEIGHT_OFFSET, SHOE_OFFSET 
.globl HAIR_OFFSET, HEIGHT_OFFSET, AGE_OFFSET
.equ NAME_OFFSET, 0
.equ WEIGHT_OFFSET, 32
.equ SHOE_OFFSET, 40
.equ HAIR_OFFSET, 48
.equ HEIGHT_OFFSET, 56
.equ AGE_OFFSET, 64

#Total size of the struct
.globl PERSON_RECORD_SIZE
.equ PERSON_RECORD_SIZE, 72
