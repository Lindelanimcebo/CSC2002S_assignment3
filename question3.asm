## Lindelani Mbatha
## MBTLIN007
## question3.asm -- mini-spreadsheet simulator

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
			
			lb $t2, 0($t1)
			move $t5, $t1
		
			beq $t2, 61, formulae
			
			move $a0, $t1
			li $v0, 4
			syscall
			
			addi $t1, $t1, 8
			addi $t0, $t0, 1
			j lp
			
			formulae:
				
				move $t3, $t5
				li $t4, 0
				
				lpf:
					lb $t2, 1($t3)
					addi $t3, $t3, 1
					
					beq $t2, 10, final
					
					mul $t4, $t4, 10
					sub $t2, $t2, '0'
					add $t4, $t4, $t2
					
					j lpf
					
				final:
					la $t5, input
					mul $t4, $t4, 8
					add $t5, $t5, $t4
					
					lb $t6, 0($t5)
					beq $t6, 61, formulae
					
					move $a0, $t5
					li $v0, 4
					syscall
					
					addi $t1, $t1, 8
					addi $t0, $t0, 1
			
					j lp
			
			addi $t1, $t1, 8
			addi $t0, $t0, 1
			
			j lp
					
		exit:
			li $v0, 10
			syscall
		
		
		
	