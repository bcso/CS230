;; Input:
;;	$3	: the new line character
;;	$4, $5	: intial and final index for substring
;;	$6	: The word array
;; 	$7	: the screen output
;;	$8	: The temp chracter store
;;	$9	: temporary counter

add $4, $1, $0 		; Get first number (initial index) to store into $4
add $5, $2, $0 		; Get second number (final index)  to store into $5
addi $9, $0, 0		; init counter to 0

lis $6
.word testWord	; get the input from keyboard
addi $11, $6, 0

lis $7
.word 0xFFFF000C	; The screen output
addi $3, $0, 0x1B	; the new line char

increment_first_index: 	beq $4, $9, print 	; if we are at starting print position, go start printing
			addi $9, $0, 1		; update counter by 1
			addi $6, $6, 4 		; move to next char
			beq $0, $0, increment_first_index ; loop back to check

print:  
	lw $8, 0($6) 		; load curr char in array position $6 into $8
	addi $6, $6, 4
	sw $8, 0($7)		; save char found in $8 to $7
	bne $8, $3, print
testWord:
	.word 0x43 ; C
	.word 0x53 ; S
	.word 0x32 ; 2
	.word 0x33 ; 3
	.word 0x30 ; 0
	.word 0x0A ; LF
	.word 0x00 ; NUL

jr $31
