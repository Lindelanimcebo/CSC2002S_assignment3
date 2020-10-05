## Lindelani Mbatha
## MBTLIN007
## question1.asm Get 5 values

.data
# Initializing memory locations for the strings
prompt: .asciiz "Enter a series of 5 formulae:\n"
rtn: .asciiz "The values are:\n"
input: .space 40
.text

main:
	li $a1, 8		# Limiting read to 8 characters 
	
	la $a0, prompt	# Printing the prompt string
	li $v0, 4
	syscall
	
	li $t0, 0  # read loop counter
	la $t1, input # load the address to input
	
	read:
		beq $t0, 5, output
		move $a0, $t1
		li $v0, 8
		syscall
		
		addi $t1, $t1, 8
		addi $t0, $t0, 1
		
		j read
	
	output:
		la $a0, rtn	# Printing the prompt string
		li $v0, 4
		syscall
	
		li $t0, 0  # read loop counter
		la $t1, input # load the input address
		
		lp:
			beq $t0, 5, exit
			move $a0, $t1
			li $v0, 4
			syscall
			
			addi $t1, $t1, 8
			addi $t0, $t0, 1
			
			j lp
		
		exit:
			li $v0, 10
			syscall