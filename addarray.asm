;; add contents of an array and place the results in $3
;; Registers:
;;	$1 - address of the first element of the array
;;	$2 - size of the array
;; 	$3 - sum of the array contents
;; 	$4 - index position of the array
;; 	$5 - temp
;; High level:
;;	sum = 0
;;	for i:0 size - 1
;;		sum = sum  array [i]

	addi $3, $0, 0		; initialize the sum
	addi $4, $0, 0		; initialize the index
	beq $2, $0, endloop	; skip the loop if the array size is 0
loop:	lw $5, 0($1)		; load array contents from memory
	add $3, $3, $5		; update the totalte index counter
	addi $1, $1, 4		; move to the next element position
	bne $4, $2, loop	; repeat until index == size
endloop:
	jr $31			; end program
