;; This program takes in three user inputs, two integers to each define a start and stop index respectively
;; and a string which will be printed as a substring according to the two integers the user has defined.
;; Registers:
;;	$4 - start index
;; 	$5 - stop index
;; 	$10 - holds value of 1
;;	$11 - counter
;;	$14, $15 - keyboard input, screen output respectively
;;	$13 - temp value store

		add $4, $1, $0
		add $5, $2, $0
		addi $10, $0, 1
		addi $11, $0, 0

		lis $14		; read from keyboard input
		.word 0xFFFF0004
		lis $15		; write to screen
		.word 0xFFFF000C

iterate:	beq $11, $4, print	; Jump to print when finished loading up to start index
		add $11, $11, $10		; Increment counter by 1
		lw $13, 0($14)		; load the next character
		beq $0, $0, iterate	; iterate again

print:		lw $13, 0($14)		; load character from $14 to $13
		sw $13, 0($15)		; load character from $13 to output (screen)
		add $11, $11, $10		; Increment counter by 1
		bne $11, $5, print	; iterate again

		addi $13, $0, 0xB	; load the new line character into register $13
		sw $13, 0($15)		; print the new line charcter
		jr $31			; end program

