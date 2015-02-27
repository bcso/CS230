;;Execute subroutine to print string contained in register 4.
;;Addition to notes on slide 62, module 2.
	add $1, $31, $0		; Save the value of $31
	lis $4
	.word mystring1		; Address of mystring1 to be printed
	jal pr_str		; execute the subroutine
	lis $4
	.word mystring2		; Address of mystring2 to be printed
	jal pr_str
	
	add $31, $1, $0		; Restore the value of $31
	jr $31			; end program
