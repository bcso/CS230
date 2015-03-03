; function for inserting.
; Registers:
;	$10 - slt bit store
;	$12 - holds value of 1
;	$14 - temp value store
;	$15 - temp value store
;	$25 - temp value store

insert:		lw $14, 0($4)		; load value of sorted array
		slt $10, $14, $15	; value in sorted array is less than new value of interest		
		beq $10, $12, lessthan 	; go to lessthan case
		bne $10, $12, greaterthan ; go to greaterthan case

lessthan:	addi $4, $4, 4		; increment inserting check pointer
		bne $4, $5, insert 	; go back to insert to load next value from sorted array to check for insert
		jr $31			; reach end of sorted array, go back to olooop

greaterthan:	addi $25, $15, 0	; add $15 to temp val	  
		addi $15, $14, 0	; move value $14 to $15
		addi $14, $25, 0	; move prev value of $15 into $25
		sw $14, 0($4)
		addi $4, $4, 4
		sw $15, 0($4)
		jr $31			; finished inserting current value, go back to oloop