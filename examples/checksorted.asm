;; Check the elements of an array to see if they are in order (ascending).
;; assume that the array has at least 2 elements
;; Register #3 is 0 if they are in order, and it will be 1 if they are not in order
;; Registers:
;;	$1 - address of the first element of the array
;;	$2 - number of elements in the array
;; 	$3 - result (0 means sorted, 1 means not sorted)
;; 	$4 - check order of pairwise elements
;; 	$5 - element from the array
;; 	$6 - element from the array
;; 	$7 - address of the stopping position in the array
;; 	$8 - current element address 

	addi $8, $0, 4		; setting up the array stopping point
	mult $2, $8		; calculate the address location immediately
	mflo $8 		; following the last element
	add $8, $8, $1		; of the array
	addi $8, $8, -4		; address location of the last element of the array
	addi $9, $1, 0		; initlialize $9 - address of the next element
	addi $3, $0, 0 		; assume things are in order to start

loop:	lw $5, 0($9)		; read an element of the array
	lw $6, 4($9)		; read the adjacent element of the array
	slt $4, $5, $6		; compare adjacent elements
if:	bne $4, $0, endif	; skip the next line if $4 is not 0
	addi $3, $0, 1		; set $3 to 1 if $5 >= $6
endif:
	addi $9, $9, 4		; move to the next element
	bne $9, $8, loop	; repeat i not at the last element of the array
	jr $31			; end program
