.data

.data

.text
# Original instruction: j main
j main

.data

.text
mcmalloc:
# push frame pointer onto stack
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# initialize frame pointer
# Original instruction: add $fp,$sp,$zero
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
# Original instruction: pushRegisters
# Original instruction: lb $a0,12($fp)
lb $a0,12($fp)
# Original instruction: li $v0,9
li $v0,9
# Original instruction: syscall
syscall
# Original instruction: sw $v0,8($fp)
sw $v0,8($fp)
# restore saved registers from stack
# Original instruction: popRegisters
# restore stack pointer
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# jump to return address
# Original instruction: jr $ra
jr $ra

.data

.text
read_i:
# push frame pointer onto stack
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# initialize frame pointer
# Original instruction: add $fp,$sp,$zero
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
# Original instruction: pushRegisters
# Original instruction: li $v0,5
li $v0,5
# Original instruction: syscall
syscall
# Original instruction: sw $v0,8($fp)
sw $v0,8($fp)
# restore saved registers from stack
# Original instruction: popRegisters
# restore stack pointer
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# jump to return address
# Original instruction: jr $ra
jr $ra

.data

.text
read_c:
# push frame pointer onto stack
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# initialize frame pointer
# Original instruction: add $fp,$sp,$zero
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
# Original instruction: pushRegisters
# Original instruction: li $v0,12
li $v0,12
# Original instruction: syscall
syscall
# Original instruction: sb $v0,8($fp)
sb $v0,8($fp)
# restore saved registers from stack
# Original instruction: popRegisters
# restore stack pointer
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# jump to return address
# Original instruction: jr $ra
jr $ra

.data

.text
print_c:
# push frame pointer onto stack
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# initialize frame pointer
# Original instruction: add $fp,$sp,$zero
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
# Original instruction: pushRegisters
# Original instruction: lw $a0,8($fp)
lw $a0,8($fp)
# Original instruction: li $v0,11
li $v0,11
# Original instruction: syscall
syscall
# restore saved registers from stack
# Original instruction: popRegisters
# restore stack pointer
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# jump to return address
# Original instruction: jr $ra
jr $ra

.data

.text
print_i:
# push frame pointer onto stack
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# initialize frame pointer
# Original instruction: add $fp,$sp,$zero
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
# Original instruction: pushRegisters
# Original instruction: lw $a0,8($fp)
lw $a0,8($fp)
# Original instruction: li $v0,1
li $v0,1
# Original instruction: syscall
syscall
# restore saved registers from stack
# Original instruction: popRegisters
# restore stack pointer
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# jump to return address
# Original instruction: jr $ra
jr $ra

.data

.text
print_s:
# push frame pointer onto stack
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# initialize frame pointer
# Original instruction: add $fp,$sp,$zero
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
# Original instruction: pushRegisters
# Original instruction: lw $a0,8($fp)
lw $a0,8($fp)
# Original instruction: li $v0,4
li $v0,4
# Original instruction: syscall
syscall
# restore saved registers from stack
# Original instruction: popRegisters
# restore stack pointer
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# jump to return address
# Original instruction: jr $ra
jr $ra

.data
# Allocated labels for virtual registers
v2:
.space 4
v1:
.space 4
v0:
.space 4

.text
bar:
# push frame pointer onto stack
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# initialize frame pointer
# Original instruction: add $fp,$sp,$zero
add $fp,$sp,$zero
# allocate local variables
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# save all registers needed for fn
# Original instruction: pushRegisters
la $t0, v2
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, v1
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, v0
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# body of bar:
# Original instruction: li v0,3
li $t5,3
la $t4, v0
sw $t5,0($t4)
# Original instruction: lw v2,12($fp)
lw $t5,12($fp)
la $t4, v2
sw $t5,0($t4)
# Original instruction: add v1,v0,v2
la $t5, v0
lw $t5,0($t5)
la $t4, v2
lw $t4,0($t4)
add $t3,$t5,$t4
la $t2, v1
sw $t3,0($t2)
# Original instruction: sw v1,8($fp)
la $t5, v1
lw $t5,0($t5)
sw $t5,8($fp)
# restore saved registers from stack
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, v0
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, v1
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, v2
sw $t0,0($t1)
# restore stack pointer
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# jump to return address
# Original instruction: jr $ra
jr $ra

.data
# Allocated labels for virtual registers
v3:
.space 4
v4:
.space 4
v6:
.space 4
v5:
.space 4

.text
foo:
# push frame pointer onto stack
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# initialize frame pointer
# Original instruction: add $fp,$sp,$zero
add $fp,$sp,$zero
# allocate local variables
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# save all registers needed for fn
# Original instruction: pushRegisters
la $t0, v3
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, v4
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, v6
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, v5
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# body of foo:
# Original instruction: addi v3,$fp,4
addi $t5,$fp,4
la $t4, v3
sw $t5,0($t4)
# Original instruction: li v4,4
li $t5,4
la $t4, v4
sw $t5,0($t4)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v4,0($sp)
la $t5, v4
lw $t5,0($t5)
sw $t5,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal bar
jal bar
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lw v5,4($sp)
lw $t5,4($sp)
la $t4, v5
sw $t5,0($t4)
# Original instruction: addi $sp,$sp,12
addi $sp,$sp,12
# Original instruction: sw v5,0(v3)
la $t5, v5
lw $t5,0($t5)
la $t4, v3
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: lw v6,4($fp)
lw $t5,4($fp)
la $t4, v6
sw $t5,0($t4)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v6,0($sp)
la $t5, v6
lw $t5,0($t5)
sw $t5,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal print_i
jal print_i
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# restore saved registers from stack
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, v5
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, v6
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, v4
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, v3
sw $t0,0($t1)
# restore stack pointer
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# jump to return address
# Original instruction: jr $ra
jr $ra

.data

.text
main:
# push frame pointer onto stack
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# initialize frame pointer
# Original instruction: add $fp,$sp,$zero
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
# Original instruction: pushRegisters
# body of main:
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal foo
jal foo
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# restore saved registers from stack
# Original instruction: popRegisters
# restore stack pointer
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# ending program
# Original instruction: li $v0,10
li $v0,10
# Original instruction: syscall
syscall

