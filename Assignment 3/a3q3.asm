; Perform insertion sort on an array.
; Registers:
;	$4 - final result
;	$5 - holds array incrementer, i for outer loop
;	$8 - length of array
;	$9 - copy start address of $1 for resetting after inserting
;	$10 - slt bit store
;	$12 - holds value of 1
;	$14 - temp value store
;	$15 - temp value store
;	$16 - holds original value of $31
;	$25 - temp value store

		addi $8, $0, 4		
		mult $8, $2
		mflo $8			
		add  $8, $8, $1		; end position at $8

		addi $4, $1, 0		; save array start pos to $4
		addi $5, $1, 0		; save array start pos to $5
		addi $5, $5, 4		; have $5 counter start one value ahead, since first value is sorted
		addi $9, $1, 0		; save array start pos to $9 
		addi $10, $0, 0		; init slt bit store	
		addi $12, $0, 1		; init 12, used for slt comparison
		addi $16, $31, 0	; save original return address	
		beq $0, $0, oloop

oloop:		lw $15, 0($5)		; store value at curpos of oloop to $21 (value to insert into sorted array)
		beq $5, $8, end		; end program, finished iterating through all i
		addi $4, $9, 0		; reset the index of sorted array, for insertion	
		jal insert		; go to insert $21 into sorted array
		addi $5, $5, 4		; increment outer loop
		beq $5, $8, end 	; end program, finished interating through all i
		bne $5, $8, oloop	; go loop again

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

end:		addi $31, $16, 0	; restore original value of $31
		jr $31
