		addi $4, $1, 0		; set up to run with twoint
		beq $0, $0, pr_int
; pr_int: prints out an integer value
; input:  $4
; locals: $8, $9, $10, $11
pr_int:		lis $8			; set up $8 for output
		.word 0xffff000c
		addi $9, $4, 0		; set up value in $9
		addi $11, $0, 0		; set up counter in $11
		slt $10, $9, $0		; check for negative number
		beq $10, $0, pr_int_comp
		addi $10, $0, 0x2D	; print minus sign
		sw $10, 0($8)
		sub $9, $0, $9		; change $9 to positive
pr_int_comp:	addi $11, $11, 1	; increment counter
		addi $10, $0, 10
		div $9, $10		; divide by 10
		mfhi $10
		addi $30, $30, -4	; store remainder on stack
		sw $10, 0($30)
		mflo $9			; check result and restart loop
		bne $9, $0, pr_int_comp
pr_int_output:	lw $10, 0($30)		; start output from stack
		addi $30, $30, 4
		addi $10, $10, 0x30
		sw $10, 0($8)
		addi $11, $11, -1
		bne $11, $0, pr_int_output
		addi $10, $0, 0xA	; print LF
		sw $10, 0($8)
		jr $31
