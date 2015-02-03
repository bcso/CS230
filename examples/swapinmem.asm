;; Take the values in $1 and $2 and swap them, without using any other registers
;; to save the values temporarily, we will use registers for lw and sw.

	lis $3		;; Initialize $3 with address found at label data
	.word data
	sw $1, 0($3)	;; Save value from register $1 into the address found in reigster $3
	add $1, $0, $2 	;; Copy value from register $2 into $3
	lw $2, 0($3)	;; Load value found at $3 into $2
	jr $31


data:	.word 0
