;a2q3.asm
;Places double the value found in $1 into $2, then place double the value of $2 into register $1. Number input using twoints.
;Registers:
;	$1 : Value 1
;	$2 : Value 2

add $2, $1, $1 ; register $2 has double the value of $1
add $1, $2, $2 ; register $1 has double the value of $2
jr $31	       ; end program
