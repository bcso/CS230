;Registers:
;	$4 - final result
;	$5 - holds array incrementer, i for outer loop
;	$8 - length of array
;	$9 - copy of unsorted array ($1) for use in inner loop
;	$10 - slt bit store
;	$11 - value of interest to be swapped, retrieved from current i position
;	$12 - holds original value of $31

		lis $6
		.word 0xFFFF000C
		addi $8, $2, 0		
		addi $4, $1, 0		
		addi $5, $1, 0		
		addi $5, $5, 4		 
		addi $9, $1, 0		 
		addi $10, $0, 0	
		addi $11, $0, 0		
		addi $12, $31, 0	
		beq $0, $0, oloop

oloop:		lw $21, 0($5)		; store value at curpos of oloop to $21 (value to insert into sorted array)
		beq $5, $8, end		; end program, finished iterating through all i
		jal insert		; go to insert $21 into sorted array
		addi $5, $5, 4		; increment $5 by 1

insert:		lw $22, 0($4)		; save value of sorted array
		  

end:		addi $31, $12, 0	; restore original value of $31
		jr $31

jr $31
