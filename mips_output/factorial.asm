.data

.data

.text
# Original instruction: jal main
jal main

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

.text
fact:
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
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
# body of fact:
# if BinOp(VarExpr(n),EQ,IntLiteral(0)) then
# Original instruction: lw v0,12($fp)
lw $s7,12($fp)
# Original instruction: li v2,0
li $t3,0
# Original instruction: xor v1,v0,v2
xor $t3,$s7,$t3
# Original instruction: sltiu v1,v1,1
sltiu $t3,$t3,1
# Original instruction: beq v1,$zero,label_9_else
beq $t3,$zero,label_9_else
# return statement
# Original instruction: li v3,1
li $t3,1
# Original instruction: sw v3,8($fp)
sw $t3,8($fp)
# Original instruction: j label_10_end
j label_10_end
label_9_else:
# else:
# return statement
# Original instruction: lw v4,12($fp)
lw $s3,12($fp)
# Original instruction: lw v6,12($fp)
lw $s7,12($fp)
# Original instruction: li v8,1
li $t3,1
# Original instruction: sub v7,v6,v8
sub $t3,$s7,$t3
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v7,0($sp)
sw $t3,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal fact
jal fact
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lw v9,4($sp)
lw $t3,4($sp)
# Original instruction: addi $sp,$sp,12
addi $sp,$sp,12
# Original instruction: mul v5,v4,v9
mul $t3,$s3,$t3
# Original instruction: sw v5,8($fp)
sw $t3,8($fp)
label_10_end:
# restore saved registers from stack
# Original instruction: popRegisters
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
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
label_0_main_str:
.asciiz "Enter a number: "
label_11_label_0_main_str_pad:
.space 3

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
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# body of main:
# Original instruction: la v10, label_0_main_str
la $t3, label_0_main_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v10,0($sp)
sw $t3,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal print_s
jal print_s
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: addi v11,$fp,4
addi $s7,$fp,4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal read_i
jal read_i
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lw v12,4($sp)
lw $t3,4($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: sw v12,0(v11)
sw $t3,0($s7)
# Original instruction: lw v11,0(v11)
lw $s7,0($s7)
# Original instruction: li v13,10
li $t3,10
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v13,0($sp)
sw $t3,0($sp)
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
# Original instruction: addi v14,$fp,0
addi $s7,$fp,0
# Original instruction: lw v15,4($fp)
lw $t3,4($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v15,0($sp)
sw $t3,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal fact
jal fact
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lw v16,4($sp)
lw $t3,4($sp)
# Original instruction: addi $sp,$sp,12
addi $sp,$sp,12
# Original instruction: sw v16,0(v14)
sw $t3,0($s7)
# Original instruction: lw v14,0(v14)
lw $s7,0($s7)
# Original instruction: lw v17,0($fp)
lw $t3,0($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v17,0($sp)
sw $t3,0($sp)
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

