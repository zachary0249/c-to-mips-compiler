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
.asciiz "Enter a positive integer: "
label_8_label_0_main_str_pad:
.space 1

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
# body of main:
# Original instruction: addi v0,$fp,-4
addi $t4,$fp,-4
# Original instruction: li v1,0
li $t3,0
# Original instruction: sw v1,0(v0)
sw $t3,0($t4)
# Original instruction: lw v0,0(v0)
lw $t4,0($t4)
# Original instruction: la v2, label_0_main_str
la $t3, label_0_main_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v2,0($sp)
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
# Original instruction: addi v3,$fp,4
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
# Original instruction: lw v4,4($sp)
lw $t3,4($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: sw v4,0(v3)
sw $t3,0($t4)
# Original instruction: lw v3,0(v3)
lw $t4,0($t4)
# if BinOp(BinOp(VarExpr(n),EQ,IntLiteral(0)),OR,BinOp(VarExpr(n),EQ,IntLiteral(1))) then
# Original instruction: lw v5,4($fp)
lw $t4,4($fp)
# Original instruction: li v7,0
li $t3,0
# Original instruction: xor v6,v5,v7
xor $t3,$t4,$t3
# Original instruction: sltiu v6,v6,1
sltiu $t3,$t3,1
# Original instruction: bnez v6,label_9_
bnez $t3,label_9_
# Original instruction: lw v9,4($fp)
lw $t4,4($fp)
# Original instruction: li v11,1
li $t3,1
# Original instruction: xor v10,v9,v11
xor $t3,$t4,$t3
# Original instruction: sltiu v10,v10,1
sltiu $t3,$t3,1
# Original instruction: bnez v10,label_9_
bnez $t3,label_9_
# Original instruction: li v8,0
li $t3,0
# Original instruction: j label_10_
j label_10_
label_9_:
# Original instruction: li v8,1
li $t3,1
label_10_:
# Original instruction: beq v8,$zero,label_11_else
beq $t3,$zero,label_11_else
# Original instruction: addi v12,$fp,-4
addi $t4,$fp,-4
# Original instruction: li v13,1
li $t3,1
# Original instruction: sw v13,0(v12)
sw $t3,0($t4)
# Original instruction: lw v12,0(v12)
lw $t4,0($t4)
# Original instruction: j label_12_end
j label_12_end
label_11_else:
label_12_end:
# Original instruction: addi v14,$fp,0
addi $t4,$fp,0
# Original instruction: li v15,2
li $t3,2
# Original instruction: sw v15,0(v14)
sw $t3,0($t4)
# Original instruction: lw v14,0(v14)
lw $t4,0($t4)
# Original instruction: addi v16,$fp,-8
addi $t4,$fp,-8
# Original instruction: li v17,0
li $t3,0
# Original instruction: sw v17,0(v16)
sw $t3,0($t4)
# Original instruction: lw v16,0(v16)
lw $t4,0($t4)
# loop while: BinOp(BinOp(VarExpr(i),LE,BinOp(VarExpr(n),DIV,IntLiteral(2))),AND,BinOp(VarExpr(b),EQ,IntLiteral(0)))
# Original instruction: lw v18,0($fp)
lw $t4,0($fp)
# Original instruction: lw v20,4($fp)
lw $t4,4($fp)
# Original instruction: li v22,2
li $t3,2
# Original instruction: div v20,v22
div $t4,$t3
# Original instruction: mflo v21
mflo $t3
# Original instruction: slt v19,v21,v18
slt $t3,$t3,$t4
# Original instruction: xori v19,v19,1
xori $t3,$t3,1
# Original instruction: li v23,0
li $t3,0
# Original instruction: beqz v19,label_13_
beqz $t3,label_13_
# Original instruction: lw v24,-8($fp)
lw $t4,-8($fp)
# Original instruction: li v26,0
li $t3,0
# Original instruction: xor v25,v24,v26
xor $t3,$t4,$t3
# Original instruction: sltiu v25,v25,1
sltiu $t3,$t3,1
# Original instruction: beqz v25,label_13_
beqz $t3,label_13_
# Original instruction: li v23,1
li $t3,1
label_13_:
# Original instruction: beqz v23,label_14_next
beqz $t3,label_14_next
label_15_body:
# if BinOp(BinOp(VarExpr(n),MOD,VarExpr(i)),EQ,IntLiteral(0)) then
# Original instruction: lw v27,4($fp)
lw $t4,4($fp)
# Original instruction: lw v29,0($fp)
lw $t3,0($fp)
# Original instruction: div v27,v29
div $t4,$t3
# Original instruction: mfhi v28
mfhi $t3
# Original instruction: li v31,0
li $t4,0
# Original instruction: xor v30,v28,v31
xor $t3,$t3,$t4
# Original instruction: sltiu v30,v30,1
sltiu $t3,$t3,1
# Original instruction: beq v30,$zero,label_16_else
beq $t3,$zero,label_16_else
# Original instruction: addi v32,$fp,-4
addi $t4,$fp,-4
# Original instruction: li v33,1
li $t3,1
# Original instruction: sw v33,0(v32)
sw $t3,0($t4)
# Original instruction: lw v32,0(v32)
lw $t4,0($t4)
# Original instruction: addi v34,$fp,-8
addi $t4,$fp,-8
# Original instruction: li v35,1
li $t3,1
# Original instruction: sw v35,0(v34)
sw $t3,0($t4)
# Original instruction: lw v34,0(v34)
lw $t4,0($t4)
# Original instruction: j label_17_end
j label_17_end
label_16_else:
label_17_end:
# Original instruction: addi v36,$fp,0
addi $t5,$fp,0
# Original instruction: lw v37,0($fp)
lw $t4,0($fp)
# Original instruction: li v39,1
li $t3,1
# Original instruction: add v38,v37,v39
add $t3,$t4,$t3
# Original instruction: sw v38,0(v36)
sw $t3,0($t5)
# Original instruction: lw v36,0(v36)
lw $t5,0($t5)
# Original instruction: lw v40,0($fp)
lw $t3,0($fp)
# Original instruction: lw v42,4($fp)
lw $t4,4($fp)
# Original instruction: li v44,2
li $t3,2
# Original instruction: div v42,v44
div $t4,$t3
# Original instruction: mflo v43
mflo $t4
# Original instruction: slt v41,v43,v40
slt $t3,$t4,$t3
# Original instruction: xori v41,v41,1
xori $t3,$t3,1
# Original instruction: li v45,0
li $t3,0
# Original instruction: beqz v41,label_18_
beqz $t3,label_18_
# Original instruction: lw v46,-8($fp)
lw $t4,-8($fp)
# Original instruction: li v48,0
li $t3,0
# Original instruction: xor v47,v46,v48
xor $t3,$t4,$t3
# Original instruction: sltiu v47,v47,1
sltiu $t3,$t3,1
# Original instruction: beqz v47,label_18_
beqz $t3,label_18_
# Original instruction: li v45,1
li $t3,1
label_18_:
# Original instruction: bnez v45,label_15_body
bnez $t3,label_15_body
label_14_next:
# Original instruction: li v49,10
li $t3,10
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v49,0($sp)
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
# Original instruction: lw v50,-4($fp)
lw $t3,-4($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v50,0($sp)
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
# Original instruction: addi $sp,$sp,20
addi $sp,$sp,20
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# ending program
# Original instruction: li $v0,10
li $v0,10
# Original instruction: syscall
syscall

