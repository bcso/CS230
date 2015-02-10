;; Calculate the value of x^3 -y^3 where x will be 
;; in $1 to start and y will be
;; in $2 to start. Place the result in $3.

	add $15, $31, $0	; save value of $31
	add $16, $2, $0		; save the value of $2, we need a second value!

;; Calculate x^3
	add $4, $1, $0		; value from $1 is an argument to the subroutine
	jal cube		; jump and link to the sub routine
	
	add $3, $2, $0		; copy the value returned from subroutine (in $2) to return address ($3)
	
	add $4, $16, $0		; value originally in $2 is now an argument
	jal cube		; register $2 now has value of y^3

	sub $3, $3, $2		; $3 = x^3 - y^3
	add $31, $15, $0	; restore jr $31
	jr $31

;; Subroutine to compute n^3
;; Parameter is in $4
;; Locals: $8
cube: 	mult $4, $4
	mflo $8			; has the value n^2
	mult $8, $4
	mflo $8			; has the value n^3
	add $2, $8, $0 		; return value is now in register $2
	jr $31			; return to main routine

