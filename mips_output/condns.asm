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
label_46_v12:
.space 4
label_21_v2:
.space 4
label_33_v9:
.space 4
label_41_v11:
.space 4
label_35_v8:
.space 4
label_32_v7:
.space 4
label_26_v3:
.space 4
label_42_v13:
.space 4
label_38_v10:
.space 4
label_22_v4:
.space 4
label_36_v6:
.space 4
label_18_v0:
.space 4
label_17_v1:
.space 4
label_28_v5:
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
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# save all registers needed for fn
# Original instruction: pushRegisters
la $t0, label_46_v12
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_21_v2
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_33_v9
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_41_v11
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_35_v8
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_32_v7
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_26_v3
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_42_v13
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_38_v10
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_22_v4
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_36_v6
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_18_v0
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_17_v1
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_28_v5
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# body of main:
# Original instruction: addi v0,$fp,4
addi $t5,$fp,4
la $t4, label_18_v0
sw $t5,0($t4)
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
# Original instruction: lw v1,4($sp)
lw $t5,4($sp)
la $t4, label_17_v1
sw $t5,0($t4)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: sw v1,0(v0)
la $t5, label_17_v1
lw $t5,0($t5)
la $t4, label_18_v0
lw $t4,0($t4)
sw $t5,0($t4)
# loop while: BinOp(VarExpr(x),GE,IntLiteral(0))
# Original instruction: lw v2,4($fp)
lw $t5,4($fp)
la $t4, label_21_v2
sw $t5,0($t4)
# Original instruction: li v4,0
li $t5,0
la $t4, label_22_v4
sw $t5,0($t4)
# Original instruction: slt v3,v2,v4
la $t5, label_21_v2
lw $t5,0($t5)
la $t4, label_22_v4
lw $t4,0($t4)
slt $t3,$t5,$t4
la $t2, label_26_v3
sw $t3,0($t2)
# Original instruction: xori v3,v3,1
la $t4, label_26_v3
lw $t4,0($t4)
xori $t4,$t4,1
la $t3, label_26_v3
sw $t4,0($t3)
# Original instruction: beqz v3,label_7_next
la $t5, label_26_v3
lw $t5,0($t5)
beqz $t5,label_7_next
label_8_body:
# Original instruction: lw v5,4($fp)
lw $t5,4($fp)
la $t4, label_28_v5
sw $t5,0($t4)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v5,0($sp)
la $t5, label_28_v5
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
# Original instruction: addi v6,$fp,4
addi $t5,$fp,4
la $t4, label_36_v6
sw $t5,0($t4)
# Original instruction: lw v7,4($fp)
lw $t5,4($fp)
la $t4, label_32_v7
sw $t5,0($t4)
# Original instruction: li v9,1
li $t5,1
la $t4, label_33_v9
sw $t5,0($t4)
# Original instruction: sub v8,v7,v9
la $t5, label_32_v7
lw $t5,0($t5)
la $t4, label_33_v9
lw $t4,0($t4)
sub $t3,$t5,$t4
la $t2, label_35_v8
sw $t3,0($t2)
# Original instruction: sw v8,0(v6)
la $t5, label_35_v8
lw $t5,0($t5)
la $t4, label_36_v6
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: li v10,10
li $t5,10
la $t4, label_38_v10
sw $t5,0($t4)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v10,0($sp)
la $t5, label_38_v10
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
# Original instruction: lw v11,4($fp)
lw $t5,4($fp)
la $t4, label_41_v11
sw $t5,0($t4)
# Original instruction: li v13,0
li $t5,0
la $t4, label_42_v13
sw $t5,0($t4)
# Original instruction: slt v12,v11,v13
la $t5, label_41_v11
lw $t5,0($t5)
la $t4, label_42_v13
lw $t4,0($t4)
slt $t3,$t5,$t4
la $t2, label_46_v12
sw $t3,0($t2)
# Original instruction: xori v12,v12,1
la $t4, label_46_v12
lw $t4,0($t4)
xori $t4,$t4,1
la $t3, label_46_v12
sw $t4,0($t3)
# Original instruction: bnez v12,label_8_body
la $t5, label_46_v12
lw $t5,0($t5)
bnez $t5,label_8_body
label_7_next:
# restore saved registers from stack
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_28_v5
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_17_v1
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_18_v0
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_36_v6
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_22_v4
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_38_v10
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_42_v13
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_26_v3
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_32_v7
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_35_v8
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_41_v11
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_33_v9
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_21_v2
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_46_v12
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

