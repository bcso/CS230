; Introduction to using an array
; Put the first three values from the array into registers $3, $4, and $5

	lw $3, 0($1)	; Index position 0 of array elements found at address in $1
	lw $4, 4($1)
	lw $5, 8($1)
	jr $31
