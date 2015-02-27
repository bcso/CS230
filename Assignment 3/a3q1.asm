		add $3, $1, $0 ; start index
		add $4, $2, $0 ; stop index
		addi $5, $0, 1 ; save 1
		addi $6, $0, 0 ; init the counter

		lis $7		; read from keyboard input
		.word 0xFFFF0004
		lis $8		; write to screen
		.word 0xFFFF000C

iterate:	beq $6, $3, print	; Jump to print when finished loading up to start index
		add $6, $6, $5		; Increment counter by 1
		lw $9, 0($7)		; load the next character
		beq $0, $0, iterate	; iterate again

print:		lw $9, 0($7)		; load character from $7 to $9
		sw $9, 0($8)		; load character from $9 to output (screen)
		add $6, $6, $5		; Increment counter by 1
		bne $6, $4, print	; iterate again

		addi $9, $0, 0xB	; load the new line character into register $9
		sw $9, 0($8)		; print the new line charcter
		jr $31			; end program

