;;addtwobignums.asm
;;Adding numbers that are too large

addi $2, $0, 99999999
addi $4, $0, 22222222
add $5, $3, $4
jr $31

;;Have 32 bits to encode entire instruction., using addi will leave you only 16 bits to represent a number.
