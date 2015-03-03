;$8 - holds end of array
;$4 holds position of the array
;$5 - holds i
;$12 - holds j

		lis $20
		.word 0xFFFF000C
		addi $7, $0, 0
		addi $8, $2, 0	;copy of length of array
		addi $4, $1, 0
		addi $5, $1, 0
		beq $0, $0, print

print:		lw $21, 0($1)
		sw $21, 0($20)
		addi $1, $1, 4
		addi $7, $7, 1
		bne $7, $2, print
		
jr $31
