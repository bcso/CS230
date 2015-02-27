;; a3q2, find sum of numbers in an array of integers where the numbers are less than the average of all numbers in array
		addi $3, $0, 0	; init sum register
		addi $4, $0, 0	; init counter register
		addi $5, $0, 0 	; init the average hold
		addi $6, $0, 0 	; init temp register
		addi $7, $1, 0	; save start position of array
		addi $8, $0, 0	; init slt checker

findtotal:	lw $6, 0($1)	; load value of array
		add $3, $3, $6	; compute sum
		addi $4, $4, 1	; update count by 1
		addi $1, $1, 4	; increment index by 1
		bne $4, $2, findtotal	; loop to find sum

findavg:	div $3, $2	; find average
		mflo $5		; store average into register $5
		mfhi $3		; store remainder into $3

resetregisters:	add $4, $0, $0	; reset counter
		addi $1, $7, 0	; reset $1 with original array index
		addi $7, $0, 0	; reset $8 for use as temporary final result holder

findRemainder:	bne $3, $0, decimalAvg 		; if avg is decimal, adjust it
		beq $0, $0, compareToAvg	; begin comparing		

decimalAvg:	addi $5, $5, 1			; adjust for decimal avg by adding 1 to avg (round up)
		beq $0, $0, compareToAvg 	; begin comparing
	
compareToAvg:	lw $6, 0($1)		
		slt $8, $6, $5	; $8 is 1 if $6 < $5
		mult $8, $6	; Multiply $9 to current array value
		mflo $3		; save value into $3
		add $7, $7, $3
		addi $1, $1, 4	; increment array pointer by 1
		addi $4, $4, 1	; increment counter by 1
		bne $4, $2, compareToAvg

		addi $1, $7, 0
		jr $31
