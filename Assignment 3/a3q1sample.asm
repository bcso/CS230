		lis $4
		.word mystring
; pr_str: prints out a null-terminated string
; input: $4
; locals: $8, $9, $10
pr_str:		lis $8
		.word 0XFFFF000c
		addi $9, $4, 0
pr_str_loop:	lw $10, 0($9)
		beq $10, $0, pr_str_end
		sw $10, 0($8)
		addi $9, $9, 4
		beq $0, $0, pr_str_loop
pr_str_end:	addi $10, 0, 0xA
		sw $10, 0($8)
		jr $31
mystring:	.word 0x43
		.word 0x53
		.word 0x32
		.word 0x33
		.word 0x30
		.word 0x00
