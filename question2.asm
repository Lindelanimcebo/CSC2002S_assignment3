## Lindelani Mbatha
## MBTLIN007
## question2.asm: Convert a string into an integer

.data
prompt: .asciiz "Enter a string:\n"
rtn: .asciiz "The value +5 is:\n"
sstr: .space 8
.text

main:	
	la $a0, prompt		# Print the prompt string
	li $v0, 4
	syscall
	
	# Getting the string
	li $a1, 8
	la $a0, sstr
	li $v0, 8
	syscall
	
	la $a0, rtn
	li $v0, 4
	syscall
	
	li $t1, 0
	la $t0, sstr

	lp:
		lb $t2, 1($t0)		# loop to convert the string to int
		addi $t0, $t0, 1
	
		beq $t2, 10, final	# check if reached '\n'
		
		mul $t1, $t1, 10	
		sub $t2, $t2, '0'	# converting from char to decimal
		add $t1, $t1, $t2

		j lp

	final:
		addi $t1, $t1, 5
		move $a0, $t1
		li $v0, 1
		syscall

	exit:
		li $v0, 10
		syscall
	