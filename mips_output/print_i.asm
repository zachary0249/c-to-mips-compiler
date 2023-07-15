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
incr:
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
# body of incr:
# Original instruction: lw v0,12($fp)
lw $t5,12($fp)
la $t4, v0
sw $t5,0($t4)
# Original instruction: li v2,1
li $t5,1
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
v12:
.space 4
v11:
.space 4
v9:
.space 4
v8:
.space 4
v7:
.space 4
v3:
.space 4
v13:
.space 4
v10:
.space 4
v4:
.space 4
v6:
.space 4
v14:
.space 4
v5:
.space 4

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
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# Original instruction: addi $sp,$sp,0
addi $sp,$sp,0
# save all registers needed for fn
# Original instruction: pushRegisters
la $t0, v12
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, v11
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, v9
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, v8
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, v7
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, v3
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, v13
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, v10
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
la $t0, v14
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, v5
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# body of main:
# Original instruction: addi v3,$fp,4
addi $t5,$fp,4
la $t4, v3
sw $t5,0($t4)
# Original instruction: li v4,5
li $t5,5
la $t4, v4
sw $t5,0($t4)
# Original instruction: sw v4,0(v3)
la $t5, v4
lw $t5,0($t5)
la $t4, v3
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: lw v5,4($fp)
lw $t5,4($fp)
la $t4, v5
sw $t5,0($t4)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v5,0($sp)
la $t5, v5
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
# Original instruction: addi v6,$fp,0
addi $t5,$fp,0
la $t4, v6
sw $t5,0($t4)
# Original instruction: li v7,10
li $t5,10
la $t4, v7
sw $t5,0($t4)
# Original instruction: sb v7,0(v6)
la $t5, v7
lw $t5,0($t5)
la $t4, v6
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v8,0($fp)
lb $t5,0($fp)
la $t4, v8
sw $t5,0($t4)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v8,0($sp)
la $t5, v8
lw $t5,0($t5)
sw $t5,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal print_c
jal print_c
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: lb v9,0($fp)
lb $t5,0($fp)
la $t4, v9
sw $t5,0($t4)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v9,0($sp)
la $t5, v9
lw $t5,0($t5)
sw $t5,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal print_c
jal print_c
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: li v10,10
li $t5,10
la $t4, v10
sw $t5,0($t4)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v10,0($sp)
la $t5, v10
lw $t5,0($t5)
sw $t5,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal print_c
jal print_c
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: addi v11,$fp,4
addi $t5,$fp,4
la $t4, v11
sw $t5,0($t4)
# Original instruction: lw v12,4($fp)
lw $t5,4($fp)
la $t4, v12
sw $t5,0($t4)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v12,0($sp)
la $t5, v12
lw $t5,0($t5)
sw $t5,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal incr
jal incr
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lw v13,4($sp)
lw $t5,4($sp)
la $t4, v13
sw $t5,0($t4)
# Original instruction: addi $sp,$sp,12
addi $sp,$sp,12
# Original instruction: sw v13,0(v11)
la $t5, v13
lw $t5,0($t5)
la $t4, v11
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: lw v14,4($fp)
lw $t5,4($fp)
la $t4, v14
sw $t5,0($t4)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v14,0($sp)
la $t5, v14
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
la $t1, v14
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
la $t1, v10
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, v13
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, v3
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, v7
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, v8
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, v9
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, v11
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, v12
sw $t0,0($t1)
# restore stack pointer
# Original instruction: addi $sp,$sp,12
addi $sp,$sp,12
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# ending program
# Original instruction: li $v0,10
li $v0,10
# Original instruction: syscall
syscall

