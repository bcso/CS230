;; a3q2, find sum of numbers in an array of integers where the numbers are less than the average of all numbers in array
		addi $25, $0, 0	; init sum register
		addi $15, $0, 0	; init counter register
		addi $14, $0, 0 	; init the average hold
		addi $24, $0, 0 	; init temp register
		addi $7, $1, 0	; save start position of array
		addi $8, $0, 0	; init slt checker

findtotal:	lw $24, 0($1)	; load value of array
		add $25, $25, $24	; compute sum
		addi $15, $15, 1	; update count by 1
		addi $1, $1, 4	; increment index by 1
		bne $15, $2, findtotal	; loop to find sum

findavg:	div $25, $2	; find average
		mflo $14		; store average into register $14
		mfhi $25		; store remainder into $25

resetregisters:	add $15, $0, $0	; reset counter
		addi $1, $7, 0			; reset $1 with original array index
		addi $7, $0, 0			; reset $8 for use as temporary final result holder

findRemainder:	bne $25, $0, decimalAvg 		; if avg is decimal, adjust it
		beq $0, $0, compareToAvg				; begin comparing		

decimalAvg:	addi $14, $14, 1					; adjust for decimal avg by adding 1 to avg (round up)
		beq $0, $0, compareToAvg 				; begin comparing
	
compareToAvg:	lw $24, 0($1)		
		slt $8, $24, $14						; $8 is 1 if $24 < $14
		mult $8, $24							; Multiply $9 to current array value
		mflo $25								; save value into $25
		add $7, $7, $25
		addi $1, $1, 4							; increment array pointer by 1
		addi $15, $15, 1						; increment counter by 1
		bne $15, $2, compareToAvg

		addi $1, $7, 0
		jr $31
