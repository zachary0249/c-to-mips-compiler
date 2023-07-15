.data

.text
j main

.text
mcmalloc:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
pushRegisters
lb $a0,12($fp)
li $v0,9
syscall
sw $v0,8($fp)
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,4
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
jr $ra

.text
read_i:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
pushRegisters
li $v0,5
syscall
sw $v0,8($fp)
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,4
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
jr $ra

.text
read_c:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
pushRegisters
li $v0,12
syscall
sb $v0,8($fp)
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,4
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
jr $ra

.text
print_c:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
pushRegisters
lw $a0,8($fp)
li $v0,11
syscall
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,4
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
jr $ra

.text
print_i:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
pushRegisters
lw $a0,8($fp)
li $v0,1
syscall
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,4
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
jr $ra

.text
print_s:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
pushRegisters
lw $a0,8($fp)
li $v0,4
syscall
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,4
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
jr $ra

.data
label_0_main_str:
.asciiz "Enter a positive integer: "
label_8_label_0_main_str_pad:
.space 1

.text
main:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
# body of main:
addi v0,$fp,-4
li v1,0
sw v1,0(v0)
lw v0,0(v0)
la v2, label_0_main_str
addi $sp,$sp,-4
sw v2,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
addi v3,$fp,4
addi $sp,$sp,-4
addi $sp,$sp,-4
sw $ra,0($sp)
jal read_i
lw $ra,0($sp)
lw v4,4($sp)
addi $sp,$sp,8
sw v4,0(v3)
lw v3,0(v3)
# if BinOp(BinOp(VarExpr(n),EQ,IntLiteral(0)),OR,BinOp(VarExpr(n),EQ,IntLiteral(1))) then
lw v5,4($fp)
li v7,0
xor v6,v5,v7
sltiu v6,v6,1
bnez v6,label_9_
lw v9,4($fp)
li v11,1
xor v10,v9,v11
sltiu v10,v10,1
bnez v10,label_9_
li v8,0
j label_10_
label_9_:
li v8,1
label_10_:
beq v8,$zero,label_11_else
addi v12,$fp,-4
li v13,1
sw v13,0(v12)
lw v12,0(v12)
j label_12_end
label_11_else:
label_12_end:
addi v14,$fp,0
li v15,2
sw v15,0(v14)
lw v14,0(v14)
addi v16,$fp,-8
li v17,0
sw v17,0(v16)
lw v16,0(v16)
# loop while: BinOp(BinOp(VarExpr(i),LE,BinOp(VarExpr(n),DIV,IntLiteral(2))),AND,BinOp(VarExpr(b),EQ,IntLiteral(0)))
lw v18,0($fp)
lw v20,4($fp)
li v22,2
div v20,v22
mflo v21
slt v19,v21,v18
xori v19,v19,1
li v23,0
beqz v19,label_13_
lw v24,-8($fp)
li v26,0
xor v25,v24,v26
sltiu v25,v25,1
beqz v25,label_13_
li v23,1
label_13_:
beqz v23,label_14_next
label_15_body:
# if BinOp(BinOp(VarExpr(n),MOD,VarExpr(i)),EQ,IntLiteral(0)) then
lw v27,4($fp)
lw v29,0($fp)
div v27,v29
mfhi v28
li v31,0
xor v30,v28,v31
sltiu v30,v30,1
beq v30,$zero,label_16_else
addi v32,$fp,-4
li v33,1
sw v33,0(v32)
lw v32,0(v32)
addi v34,$fp,-8
li v35,1
sw v35,0(v34)
lw v34,0(v34)
j label_17_end
label_16_else:
label_17_end:
addi v36,$fp,0
lw v37,0($fp)
li v39,1
add v38,v37,v39
sw v38,0(v36)
lw v36,0(v36)
lw v40,0($fp)
lw v42,4($fp)
li v44,2
div v42,v44
mflo v43
slt v41,v43,v40
xori v41,v41,1
li v45,0
beqz v41,label_18_
lw v46,-8($fp)
li v48,0
xor v47,v46,v48
sltiu v47,v47,1
beqz v47,label_18_
li v45,1
label_18_:
bnez v45,label_15_body
label_14_next:
li v49,10
addi $sp,$sp,-4
sw v49,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_c
lw $ra,0($sp)
addi $sp,$sp,8
lw v50,-4($fp)
addi $sp,$sp,-4
sw v50,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
# restore stack pointer
addi $sp,$sp,20
# restore frame pointer from stack
lw $fp,0($fp)
# ending program
li $v0,10
syscall

