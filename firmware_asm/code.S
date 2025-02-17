.equ OFFSET, 0x20
.text

	addi a0, zero, 2
	addi a0, a0, 5
	addi a1, zero, OFFSET
	sw a0, 4(a1)
