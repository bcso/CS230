;Compute the sum of squares of register values $1 and $2, placing the result in $3.
;Registers:
;	$1 : Value 1
;	$2 : Value 2
;	$3 : Result

mult $1, $1 ;Multiply value in register $1 by itself, find the square
mflo $1     ;Move multipled value to register $1
mult $2, $2 ;Multiply value in register $2 by itself, find the square
mflo $2     ;Move multiplied value to register $2
add  $3, $1, $2 ;Add values found in registers $1 and $2 and place result in $3
jr   $31        ;end program
