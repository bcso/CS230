;;ddtwobignumnsv2.asm
;;Add two big numbers that are too large for immediate addressing

lis $3		;;Look at next line, place copy of that value into register $3
.word 99999999
lis $4
.word 22222222
add $5, $3, $4
jr $31
