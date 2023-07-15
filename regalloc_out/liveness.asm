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
label_0_main_str:
.asciiz "First "
label_10_label_0_main_str_pad:
.space 1
label_1_main_str:
.asciiz " terms of Fibonacci series are : "
label_11_label_1_main_str_pad:
.space 2
label_2_main_str:
.asciiz " "
label_12_label_2_main_str_pad:
.space 2

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
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# body of main:
# Original instruction: addi v0,$fp,4
addi $t4,$fp,4
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
lw $t3,4($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: sw v1,0(v0)
sw $t3,0($t4)
# Original instruction: lw v0,0(v0)
lw $t4,0($t4)
# Original instruction: addi v2,$fp,0
addi $t3,$fp,0
# Original instruction: li v3,0
li $t4,0
# Original instruction: sw v3,0(v2)
sw $t4,0($t3)
# Original instruction: lw v2,0(v2)
lw $t3,0($t3)
# Original instruction: addi v4,$fp,-4
addi $t4,$fp,-4
# Original instruction: li v5,1
li $t3,1
# Original instruction: sw v5,0(v4)
sw $t3,0($t4)
# Original instruction: lw v4,0(v4)
lw $t4,0($t4)
# Original instruction: la v6, label_0_main_str
la v6, label_0_main_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v6,0($sp)
sw v6,0($sp)
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
# Original instruction: lw v7,4($fp)
lw v7,4($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v7,0($sp)
sw v7,0($sp)
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
# Original instruction: la v8, label_1_main_str
la v8, label_1_main_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v8,0($sp)
sw v8,0($sp)
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
# Original instruction: addi v9,$fp,-12
addi $t4,$fp,-12
# Original instruction: li v10,0
li $t3,0
# Original instruction: sw v10,0(v9)
sw $t3,0($t4)
# Original instruction: lw v9,0(v9)
lw $t4,0($t4)
# loop while: BinOp(VarExpr(c),LT,VarExpr(n))
# Original instruction: lw v11,-12($fp)
lw $t4,-12($fp)
# Original instruction: lw v13,4($fp)
lw $t3,4($fp)
# Original instruction: slt v12,v11,v13
slt v12,$t4,$t3
# Original instruction: beqz v12,label_13_next
beqz v12,label_13_next
label_14_body:
# if BinOp(VarExpr(c),LE,IntLiteral(1)) then
# Original instruction: lw v14,-12($fp)
lw $t4,-12($fp)
# Original instruction: li v16,1
li $t3,1
# Original instruction: slt v15,v16,v14
slt v15,$t3,$t4
# Original instruction: xori v15,v15,1
xori v15,v15,1
# Original instruction: beq v15,$zero,label_15_else
beq v15,$zero,label_15_else
# Original instruction: addi v17,$fp,-8
addi $t3,$fp,-8
# Original instruction: lw v18,-12($fp)
lw $t4,-12($fp)
# Original instruction: sw v18,0(v17)
sw $t4,0($t3)
# Original instruction: lw v17,0(v17)
lw $t3,0($t3)
# Original instruction: j label_16_end
j label_16_end
label_15_else:
# else:
# Original instruction: addi v19,$fp,-8
addi $t4,$fp,-8
# Original instruction: lw v20,0($fp)
lw $t5,0($fp)
# Original instruction: lw v22,-4($fp)
lw $t3,-4($fp)
# Original instruction: add v21,v20,v22
add $t3,$t5,$t3
# Original instruction: sw v21,0(v19)
sw $t3,0($t4)
# Original instruction: lw v19,0(v19)
lw $t4,0($t4)
# Original instruction: addi v23,$fp,0
addi $t3,$fp,0
# Original instruction: lw v24,-4($fp)
lw $t4,-4($fp)
# Original instruction: sw v24,0(v23)
sw $t4,0($t3)
# Original instruction: lw v23,0(v23)
lw $t3,0($t3)
# Original instruction: addi v25,$fp,-4
addi $t3,$fp,-4
# Original instruction: lw v26,-8($fp)
lw $t4,-8($fp)
# Original instruction: sw v26,0(v25)
sw $t4,0($t3)
# Original instruction: lw v25,0(v25)
lw $t3,0($t3)
label_16_end:
# Original instruction: lw v27,-8($fp)
lw v27,-8($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v27,0($sp)
sw v27,0($sp)
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
# Original instruction: la v28, label_2_main_str
la v28, label_2_main_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v28,0($sp)
sw v28,0($sp)
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
# Original instruction: addi v29,$fp,-12
addi $t5,$fp,-12
# Original instruction: lw v30,-12($fp)
lw $t4,-12($fp)
# Original instruction: li v32,1
li $t3,1
# Original instruction: add v31,v30,v32
add $t3,$t4,$t3
# Original instruction: sw v31,0(v29)
sw $t3,0($t5)
# Original instruction: lw v29,0(v29)
lw $t5,0($t5)
# Original instruction: lw v33,-12($fp)
lw $t4,-12($fp)
# Original instruction: lw v35,4($fp)
lw $t3,4($fp)
# Original instruction: slt v34,v33,v35
slt v34,$t4,$t3
# Original instruction: bnez v34,label_14_body
bnez v34,label_14_body
label_13_next:
# restore stack pointer
# Original instruction: addi $sp,$sp,28
addi $sp,$sp,28
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# ending program
# Original instruction: li $v0,10
li $v0,10
# Original instruction: syscall
syscall

