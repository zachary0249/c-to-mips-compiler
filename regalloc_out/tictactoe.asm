.data
label_0_a11:
.space 4
label_1_a12:
.space 4
label_2_a13:
.space 4
label_3_a21:
.space 4
label_4_a22:
.space 4
label_5_a23:
.space 4
label_6_a31:
.space 4
label_7_a32:
.space 4
label_8_a33:
.space 4
label_9_empty:
.space 4

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

.text
reset:
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
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
# body of reset:
# Original instruction: la v0, label_0_a11
la $s7, label_0_a11
# Original instruction: la v1, label_9_empty
la $t3, label_9_empty
# Original instruction: lb v1,0(v1)
lb $t3,0($t3)
# Original instruction: sb v1,0(v0)
sb $t3,0($s7)
# Original instruction: lw v0,0(v0)
lw $s7,0($s7)
# Original instruction: la v2, label_1_a12
la $s7, label_1_a12
# Original instruction: la v3, label_9_empty
la $t3, label_9_empty
# Original instruction: lb v3,0(v3)
lb $t3,0($t3)
# Original instruction: sb v3,0(v2)
sb $t3,0($s7)
# Original instruction: lw v2,0(v2)
lw $s7,0($s7)
# Original instruction: la v4, label_2_a13
la $s7, label_2_a13
# Original instruction: la v5, label_9_empty
la $t3, label_9_empty
# Original instruction: lb v5,0(v5)
lb $t3,0($t3)
# Original instruction: sb v5,0(v4)
sb $t3,0($s7)
# Original instruction: lw v4,0(v4)
lw $s7,0($s7)
# Original instruction: la v6, label_3_a21
la $t3, label_3_a21
# Original instruction: la v7, label_9_empty
la $s7, label_9_empty
# Original instruction: lb v7,0(v7)
lb $s7,0($s7)
# Original instruction: sb v7,0(v6)
sb $s7,0($t3)
# Original instruction: lw v6,0(v6)
lw $t3,0($t3)
# Original instruction: la v8, label_4_a22
la $t3, label_4_a22
# Original instruction: la v9, label_9_empty
la $s7, label_9_empty
# Original instruction: lb v9,0(v9)
lb $s7,0($s7)
# Original instruction: sb v9,0(v8)
sb $s7,0($t3)
# Original instruction: lw v8,0(v8)
lw $t3,0($t3)
# Original instruction: la v10, label_5_a23
la $s7, label_5_a23
# Original instruction: la v11, label_9_empty
la $t3, label_9_empty
# Original instruction: lb v11,0(v11)
lb $t3,0($t3)
# Original instruction: sb v11,0(v10)
sb $t3,0($s7)
# Original instruction: lw v10,0(v10)
lw $s7,0($s7)
# Original instruction: la v12, label_6_a31
la $t3, label_6_a31
# Original instruction: la v13, label_9_empty
la $s7, label_9_empty
# Original instruction: lb v13,0(v13)
lb $s7,0($s7)
# Original instruction: sb v13,0(v12)
sb $s7,0($t3)
# Original instruction: lw v12,0(v12)
lw $t3,0($t3)
# Original instruction: la v14, label_7_a32
la $s7, label_7_a32
# Original instruction: la v15, label_9_empty
la $t3, label_9_empty
# Original instruction: lb v15,0(v15)
lb $t3,0($t3)
# Original instruction: sb v15,0(v14)
sb $t3,0($s7)
# Original instruction: lw v14,0(v14)
lw $s7,0($s7)
# Original instruction: la v16, label_8_a33
la $t3, label_8_a33
# Original instruction: la v17, label_9_empty
la $s7, label_9_empty
# Original instruction: lb v17,0(v17)
lb $s7,0($s7)
# Original instruction: sb v17,0(v16)
sb $s7,0($t3)
# Original instruction: lw v16,0(v16)
lw $t3,0($t3)
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
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
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

.text
full:
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
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s3,0($sp)
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
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
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
sw $s3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
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
sw $s3,0($sp)
addi $sp,$sp,-4
sw $s3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
# body of full:
# Original instruction: addi v18,$fp,4
addi $s7,$fp,4
# Original instruction: li v19,0
li $t3,0
# Original instruction: sw v19,0(v18)
sw $t3,0($s7)
# Original instruction: lw v18,0(v18)
lw $s7,0($s7)
# if BinOp(VarExpr(a11),NE,VarExpr(empty)) then
# Original instruction: la v20, label_0_a11
la $s7, label_0_a11
# Original instruction: lb v20,0(v20)
lb $s7,0($s7)
# Original instruction: la v22, label_9_empty
la $t3, label_9_empty
# Original instruction: lb v22,0(v22)
lb $t3,0($t3)
# Original instruction: xor v21,v20,v22
xor $t3,$s7,$t3
# Original instruction: sltu v21,$zero,v21
sltu $t3,$zero,$t3
# Original instruction: beq v21,$zero,label_46_else
beq $t3,$zero,label_46_else
# Original instruction: addi v23,$fp,4
addi $s7,$fp,4
# Original instruction: lw v24,4($fp)
lw $t3,4($fp)
# Original instruction: li v26,1
li $s3,1
# Original instruction: add v25,v24,v26
add $t3,$t3,$s3
# Original instruction: sw v25,0(v23)
sw $t3,0($s7)
# Original instruction: lw v23,0(v23)
lw $s7,0($s7)
# Original instruction: j label_47_end
j label_47_end
label_46_else:
label_47_end:
# if BinOp(VarExpr(a21),NE,VarExpr(empty)) then
# Original instruction: la v27, label_3_a21
la $s7, label_3_a21
# Original instruction: lb v27,0(v27)
lb $s7,0($s7)
# Original instruction: la v29, label_9_empty
la $t3, label_9_empty
# Original instruction: lb v29,0(v29)
lb $t3,0($t3)
# Original instruction: xor v28,v27,v29
xor $t3,$s7,$t3
# Original instruction: sltu v28,$zero,v28
sltu $t3,$zero,$t3
# Original instruction: beq v28,$zero,label_48_else
beq $t3,$zero,label_48_else
# Original instruction: addi v30,$fp,4
addi $s3,$fp,4
# Original instruction: lw v31,4($fp)
lw $s7,4($fp)
# Original instruction: li v33,1
li $t3,1
# Original instruction: add v32,v31,v33
add $t3,$s7,$t3
# Original instruction: sw v32,0(v30)
sw $t3,0($s3)
# Original instruction: lw v30,0(v30)
lw $s3,0($s3)
# Original instruction: j label_49_end
j label_49_end
label_48_else:
label_49_end:
# if BinOp(VarExpr(a31),NE,VarExpr(empty)) then
# Original instruction: la v34, label_6_a31
la $t3, label_6_a31
# Original instruction: lb v34,0(v34)
lb $t3,0($t3)
# Original instruction: la v36, label_9_empty
la $s7, label_9_empty
# Original instruction: lb v36,0(v36)
lb $s7,0($s7)
# Original instruction: xor v35,v34,v36
xor $t3,$t3,$s7
# Original instruction: sltu v35,$zero,v35
sltu $t3,$zero,$t3
# Original instruction: beq v35,$zero,label_50_else
beq $t3,$zero,label_50_else
# Original instruction: addi v37,$fp,4
addi $s3,$fp,4
# Original instruction: lw v38,4($fp)
lw $t3,4($fp)
# Original instruction: li v40,1
li $s7,1
# Original instruction: add v39,v38,v40
add $t3,$t3,$s7
# Original instruction: sw v39,0(v37)
sw $t3,0($s3)
# Original instruction: lw v37,0(v37)
lw $s3,0($s3)
# Original instruction: j label_51_end
j label_51_end
label_50_else:
label_51_end:
# if BinOp(VarExpr(a12),NE,VarExpr(empty)) then
# Original instruction: la v41, label_1_a12
la $t3, label_1_a12
# Original instruction: lb v41,0(v41)
lb $t3,0($t3)
# Original instruction: la v43, label_9_empty
la $s7, label_9_empty
# Original instruction: lb v43,0(v43)
lb $s7,0($s7)
# Original instruction: xor v42,v41,v43
xor $t3,$t3,$s7
# Original instruction: sltu v42,$zero,v42
sltu $t3,$zero,$t3
# Original instruction: beq v42,$zero,label_52_else
beq $t3,$zero,label_52_else
# Original instruction: addi v44,$fp,4
addi $t3,$fp,4
# Original instruction: lw v45,4($fp)
lw $s3,4($fp)
# Original instruction: li v47,1
li $s7,1
# Original instruction: add v46,v45,v47
add $s7,$s3,$s7
# Original instruction: sw v46,0(v44)
sw $s7,0($t3)
# Original instruction: lw v44,0(v44)
lw $t3,0($t3)
# Original instruction: j label_53_end
j label_53_end
label_52_else:
label_53_end:
# if BinOp(VarExpr(a22),NE,VarExpr(empty)) then
# Original instruction: la v48, label_4_a22
la $s7, label_4_a22
# Original instruction: lb v48,0(v48)
lb $s7,0($s7)
# Original instruction: la v50, label_9_empty
la $t3, label_9_empty
# Original instruction: lb v50,0(v50)
lb $t3,0($t3)
# Original instruction: xor v49,v48,v50
xor $t3,$s7,$t3
# Original instruction: sltu v49,$zero,v49
sltu $t3,$zero,$t3
# Original instruction: beq v49,$zero,label_54_else
beq $t3,$zero,label_54_else
# Original instruction: addi v51,$fp,4
addi $s7,$fp,4
# Original instruction: lw v52,4($fp)
lw $s3,4($fp)
# Original instruction: li v54,1
li $t3,1
# Original instruction: add v53,v52,v54
add $t3,$s3,$t3
# Original instruction: sw v53,0(v51)
sw $t3,0($s7)
# Original instruction: lw v51,0(v51)
lw $s7,0($s7)
# Original instruction: j label_55_end
j label_55_end
label_54_else:
label_55_end:
# if BinOp(VarExpr(a32),NE,VarExpr(empty)) then
# Original instruction: la v55, label_7_a32
la $t3, label_7_a32
# Original instruction: lb v55,0(v55)
lb $t3,0($t3)
# Original instruction: la v57, label_9_empty
la $s7, label_9_empty
# Original instruction: lb v57,0(v57)
lb $s7,0($s7)
# Original instruction: xor v56,v55,v57
xor $t3,$t3,$s7
# Original instruction: sltu v56,$zero,v56
sltu $t3,$zero,$t3
# Original instruction: beq v56,$zero,label_56_else
beq $t3,$zero,label_56_else
# Original instruction: addi v58,$fp,4
addi $t3,$fp,4
# Original instruction: lw v59,4($fp)
lw $s7,4($fp)
# Original instruction: li v61,1
li $s3,1
# Original instruction: add v60,v59,v61
add $s7,$s7,$s3
# Original instruction: sw v60,0(v58)
sw $s7,0($t3)
# Original instruction: lw v58,0(v58)
lw $t3,0($t3)
# Original instruction: j label_57_end
j label_57_end
label_56_else:
label_57_end:
# if BinOp(VarExpr(a13),NE,VarExpr(empty)) then
# Original instruction: la v62, label_2_a13
la $t3, label_2_a13
# Original instruction: lb v62,0(v62)
lb $t3,0($t3)
# Original instruction: la v64, label_9_empty
la $s7, label_9_empty
# Original instruction: lb v64,0(v64)
lb $s7,0($s7)
# Original instruction: xor v63,v62,v64
xor $t3,$t3,$s7
# Original instruction: sltu v63,$zero,v63
sltu $t3,$zero,$t3
# Original instruction: beq v63,$zero,label_58_else
beq $t3,$zero,label_58_else
# Original instruction: addi v65,$fp,4
addi $s7,$fp,4
# Original instruction: lw v66,4($fp)
lw $t3,4($fp)
# Original instruction: li v68,1
li $s3,1
# Original instruction: add v67,v66,v68
add $t3,$t3,$s3
# Original instruction: sw v67,0(v65)
sw $t3,0($s7)
# Original instruction: lw v65,0(v65)
lw $s7,0($s7)
# Original instruction: j label_59_end
j label_59_end
label_58_else:
label_59_end:
# if BinOp(VarExpr(a23),NE,VarExpr(empty)) then
# Original instruction: la v69, label_5_a23
la $s7, label_5_a23
# Original instruction: lb v69,0(v69)
lb $s7,0($s7)
# Original instruction: la v71, label_9_empty
la $t3, label_9_empty
# Original instruction: lb v71,0(v71)
lb $t3,0($t3)
# Original instruction: xor v70,v69,v71
xor $t3,$s7,$t3
# Original instruction: sltu v70,$zero,v70
sltu $t3,$zero,$t3
# Original instruction: beq v70,$zero,label_60_else
beq $t3,$zero,label_60_else
# Original instruction: addi v72,$fp,4
addi $s3,$fp,4
# Original instruction: lw v73,4($fp)
lw $t3,4($fp)
# Original instruction: li v75,1
li $s7,1
# Original instruction: add v74,v73,v75
add $t3,$t3,$s7
# Original instruction: sw v74,0(v72)
sw $t3,0($s3)
# Original instruction: lw v72,0(v72)
lw $s3,0($s3)
# Original instruction: j label_61_end
j label_61_end
label_60_else:
label_61_end:
# if BinOp(VarExpr(a33),NE,VarExpr(empty)) then
# Original instruction: la v76, label_8_a33
la $t3, label_8_a33
# Original instruction: lb v76,0(v76)
lb $t3,0($t3)
# Original instruction: la v78, label_9_empty
la $s7, label_9_empty
# Original instruction: lb v78,0(v78)
lb $s7,0($s7)
# Original instruction: xor v77,v76,v78
xor $t3,$t3,$s7
# Original instruction: sltu v77,$zero,v77
sltu $t3,$zero,$t3
# Original instruction: beq v77,$zero,label_62_else
beq $t3,$zero,label_62_else
# Original instruction: addi v79,$fp,4
addi $s7,$fp,4
# Original instruction: lw v80,4($fp)
lw $s3,4($fp)
# Original instruction: li v82,1
li $t3,1
# Original instruction: add v81,v80,v82
add $t3,$s3,$t3
# Original instruction: sw v81,0(v79)
sw $t3,0($s7)
# Original instruction: lw v79,0(v79)
lw $s7,0($s7)
# Original instruction: j label_63_end
j label_63_end
label_62_else:
label_63_end:
# if BinOp(VarExpr(n),EQ,IntLiteral(9)) then
# Original instruction: lw v83,4($fp)
lw $t3,4($fp)
# Original instruction: li v85,9
li $s7,9
# Original instruction: xor v84,v83,v85
xor $t3,$t3,$s7
# Original instruction: sltiu v84,v84,1
sltiu $t3,$t3,1
# Original instruction: beq v84,$zero,label_64_else
beq $t3,$zero,label_64_else
# return statement
# Original instruction: li v86,1
li $t3,1
# Original instruction: sw v86,8($fp)
sw $t3,8($fp)
# Original instruction: j label_65_end
j label_65_end
label_64_else:
# else:
# return statement
# Original instruction: li v87,0
li $t3,0
# Original instruction: sw v87,8($fp)
sw $t3,8($fp)
label_65_end:
# restore saved registers from stack
# Original instruction: popRegisters
lw $t3,0($sp)
addi $sp,$sp,4
lw $s3,0($sp)
addi $sp,$sp,4
lw $s3,0($sp)
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
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s3,0($sp)
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
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
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
lw $s3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
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
set:
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
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
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
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s3,0($sp)
addi $sp,$sp,-4
sw $s3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
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
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
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
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
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
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
# body of set:
# Original instruction: addi v88,$fp,4
addi $s7,$fp,4
# Original instruction: li v89,1
li $t3,1
# Original instruction: sw v89,0(v88)
sw $t3,0($s7)
# Original instruction: lw v88,0(v88)
lw $s7,0($s7)
# if BinOp(VarExpr(row),EQ,ChrLiteral(a)) then
# Original instruction: lb v90,20($fp)
lb $s7,20($fp)
# Original instruction: li v92,97
li $t3,97
# Original instruction: xor v91,v90,v92
xor $t3,$s7,$t3
# Original instruction: sltiu v91,v91,1
sltiu $t3,$t3,1
# Original instruction: beq v91,$zero,label_67_else
beq $t3,$zero,label_67_else
# if BinOp(VarExpr(col),EQ,IntLiteral(1)) then
# Original instruction: lw v93,16($fp)
lw $t3,16($fp)
# Original instruction: li v95,1
li $s7,1
# Original instruction: xor v94,v93,v95
xor $t3,$t3,$s7
# Original instruction: sltiu v94,v94,1
sltiu $t3,$t3,1
# Original instruction: beq v94,$zero,label_69_else
beq $t3,$zero,label_69_else
# if BinOp(VarExpr(a11),EQ,VarExpr(empty)) then
# Original instruction: la v96, label_0_a11
la $t3, label_0_a11
# Original instruction: lb v96,0(v96)
lb $t3,0($t3)
# Original instruction: la v98, label_9_empty
la $s7, label_9_empty
# Original instruction: lb v98,0(v98)
lb $s7,0($s7)
# Original instruction: xor v97,v96,v98
xor $t3,$t3,$s7
# Original instruction: sltiu v97,v97,1
sltiu $t3,$t3,1
# Original instruction: beq v97,$zero,label_71_else
beq $t3,$zero,label_71_else
# Original instruction: la v99, label_0_a11
la $t3, label_0_a11
# Original instruction: lb v100,12($fp)
lb $s7,12($fp)
# Original instruction: sb v100,0(v99)
sb $s7,0($t3)
# Original instruction: lw v99,0(v99)
lw $t3,0($t3)
# Original instruction: j label_72_end
j label_72_end
label_71_else:
# else:
# Original instruction: addi v101,$fp,4
addi $s7,$fp,4
# Original instruction: li v102,0
li $t3,0
# Original instruction: li v104,1
li $s3,1
# Original instruction: sub v103,v102,v104
sub $t3,$t3,$s3
# Original instruction: sw v103,0(v101)
sw $t3,0($s7)
# Original instruction: lw v101,0(v101)
lw $s7,0($s7)
label_72_end:
# Original instruction: j label_70_end
j label_70_end
label_69_else:
# else:
# if BinOp(VarExpr(col),EQ,IntLiteral(2)) then
# Original instruction: lw v105,16($fp)
lw $t3,16($fp)
# Original instruction: li v107,2
li $s7,2
# Original instruction: xor v106,v105,v107
xor $t3,$t3,$s7
# Original instruction: sltiu v106,v106,1
sltiu $t3,$t3,1
# Original instruction: beq v106,$zero,label_73_else
beq $t3,$zero,label_73_else
# if BinOp(VarExpr(a12),EQ,VarExpr(empty)) then
# Original instruction: la v108, label_1_a12
la $t3, label_1_a12
# Original instruction: lb v108,0(v108)
lb $t3,0($t3)
# Original instruction: la v110, label_9_empty
la $s7, label_9_empty
# Original instruction: lb v110,0(v110)
lb $s7,0($s7)
# Original instruction: xor v109,v108,v110
xor $t3,$t3,$s7
# Original instruction: sltiu v109,v109,1
sltiu $t3,$t3,1
# Original instruction: beq v109,$zero,label_75_else
beq $t3,$zero,label_75_else
# Original instruction: la v111, label_1_a12
la $t3, label_1_a12
# Original instruction: lb v112,12($fp)
lb $s7,12($fp)
# Original instruction: sb v112,0(v111)
sb $s7,0($t3)
# Original instruction: lw v111,0(v111)
lw $t3,0($t3)
# Original instruction: j label_76_end
j label_76_end
label_75_else:
# else:
# Original instruction: addi v113,$fp,4
addi $s3,$fp,4
# Original instruction: li v114,0
li $t3,0
# Original instruction: li v116,1
li $s7,1
# Original instruction: sub v115,v114,v116
sub $t3,$t3,$s7
# Original instruction: sw v115,0(v113)
sw $t3,0($s3)
# Original instruction: lw v113,0(v113)
lw $s3,0($s3)
label_76_end:
# Original instruction: j label_74_end
j label_74_end
label_73_else:
# else:
# if BinOp(VarExpr(col),EQ,IntLiteral(3)) then
# Original instruction: lw v117,16($fp)
lw $t3,16($fp)
# Original instruction: li v119,3
li $s7,3
# Original instruction: xor v118,v117,v119
xor $t3,$t3,$s7
# Original instruction: sltiu v118,v118,1
sltiu $t3,$t3,1
# Original instruction: beq v118,$zero,label_77_else
beq $t3,$zero,label_77_else
# if BinOp(VarExpr(a13),EQ,VarExpr(empty)) then
# Original instruction: la v120, label_2_a13
la $t3, label_2_a13
# Original instruction: lb v120,0(v120)
lb $t3,0($t3)
# Original instruction: la v122, label_9_empty
la $s7, label_9_empty
# Original instruction: lb v122,0(v122)
lb $s7,0($s7)
# Original instruction: xor v121,v120,v122
xor $t3,$t3,$s7
# Original instruction: sltiu v121,v121,1
sltiu $t3,$t3,1
# Original instruction: beq v121,$zero,label_79_else
beq $t3,$zero,label_79_else
# Original instruction: la v123, label_2_a13
la $s7, label_2_a13
# Original instruction: lb v124,12($fp)
lb $t3,12($fp)
# Original instruction: sb v124,0(v123)
sb $t3,0($s7)
# Original instruction: lw v123,0(v123)
lw $s7,0($s7)
# Original instruction: j label_80_end
j label_80_end
label_79_else:
# else:
# Original instruction: addi v125,$fp,4
addi $s7,$fp,4
# Original instruction: li v126,0
li $t3,0
# Original instruction: li v128,1
li $s3,1
# Original instruction: sub v127,v126,v128
sub $t3,$t3,$s3
# Original instruction: sw v127,0(v125)
sw $t3,0($s7)
# Original instruction: lw v125,0(v125)
lw $s7,0($s7)
label_80_end:
# Original instruction: j label_78_end
j label_78_end
label_77_else:
# else:
# Original instruction: addi v129,$fp,4
addi $t3,$fp,4
# Original instruction: li v130,0
li $s7,0
# Original instruction: sw v130,0(v129)
sw $s7,0($t3)
# Original instruction: lw v129,0(v129)
lw $t3,0($t3)
label_78_end:
label_74_end:
label_70_end:
# Original instruction: j label_68_end
j label_68_end
label_67_else:
# else:
# if BinOp(VarExpr(row),EQ,ChrLiteral(b)) then
# Original instruction: lb v131,20($fp)
lb $s7,20($fp)
# Original instruction: li v133,98
li $t3,98
# Original instruction: xor v132,v131,v133
xor $t3,$s7,$t3
# Original instruction: sltiu v132,v132,1
sltiu $t3,$t3,1
# Original instruction: beq v132,$zero,label_81_else
beq $t3,$zero,label_81_else
# if BinOp(VarExpr(col),EQ,IntLiteral(1)) then
# Original instruction: lw v134,16($fp)
lw $t3,16($fp)
# Original instruction: li v136,1
li $s7,1
# Original instruction: xor v135,v134,v136
xor $t3,$t3,$s7
# Original instruction: sltiu v135,v135,1
sltiu $t3,$t3,1
# Original instruction: beq v135,$zero,label_83_else
beq $t3,$zero,label_83_else
# if BinOp(VarExpr(a21),EQ,VarExpr(empty)) then
# Original instruction: la v137, label_3_a21
la $s7, label_3_a21
# Original instruction: lb v137,0(v137)
lb $s7,0($s7)
# Original instruction: la v139, label_9_empty
la $t3, label_9_empty
# Original instruction: lb v139,0(v139)
lb $t3,0($t3)
# Original instruction: xor v138,v137,v139
xor $t3,$s7,$t3
# Original instruction: sltiu v138,v138,1
sltiu $t3,$t3,1
# Original instruction: beq v138,$zero,label_85_else
beq $t3,$zero,label_85_else
# Original instruction: la v140, label_3_a21
la $t3, label_3_a21
# Original instruction: lb v141,12($fp)
lb $s7,12($fp)
# Original instruction: sb v141,0(v140)
sb $s7,0($t3)
# Original instruction: lw v140,0(v140)
lw $t3,0($t3)
# Original instruction: j label_86_end
j label_86_end
label_85_else:
# else:
# Original instruction: addi v142,$fp,4
addi $s7,$fp,4
# Original instruction: li v143,0
li $t3,0
# Original instruction: li v145,1
li $s3,1
# Original instruction: sub v144,v143,v145
sub $t3,$t3,$s3
# Original instruction: sw v144,0(v142)
sw $t3,0($s7)
# Original instruction: lw v142,0(v142)
lw $s7,0($s7)
label_86_end:
# Original instruction: j label_84_end
j label_84_end
label_83_else:
# else:
# if BinOp(VarExpr(col),EQ,IntLiteral(2)) then
# Original instruction: lw v146,16($fp)
lw $t3,16($fp)
# Original instruction: li v148,2
li $s7,2
# Original instruction: xor v147,v146,v148
xor $t3,$t3,$s7
# Original instruction: sltiu v147,v147,1
sltiu $t3,$t3,1
# Original instruction: beq v147,$zero,label_87_else
beq $t3,$zero,label_87_else
# if BinOp(VarExpr(a22),EQ,VarExpr(empty)) then
# Original instruction: la v149, label_4_a22
la $s7, label_4_a22
# Original instruction: lb v149,0(v149)
lb $s7,0($s7)
# Original instruction: la v151, label_9_empty
la $t3, label_9_empty
# Original instruction: lb v151,0(v151)
lb $t3,0($t3)
# Original instruction: xor v150,v149,v151
xor $t3,$s7,$t3
# Original instruction: sltiu v150,v150,1
sltiu $t3,$t3,1
# Original instruction: beq v150,$zero,label_89_else
beq $t3,$zero,label_89_else
# Original instruction: la v152, label_4_a22
la $s7, label_4_a22
# Original instruction: lb v153,12($fp)
lb $t3,12($fp)
# Original instruction: sb v153,0(v152)
sb $t3,0($s7)
# Original instruction: lw v152,0(v152)
lw $s7,0($s7)
# Original instruction: j label_90_end
j label_90_end
label_89_else:
# else:
# Original instruction: addi v154,$fp,4
addi $t3,$fp,4
# Original instruction: li v155,0
li $s7,0
# Original instruction: li v157,1
li $s3,1
# Original instruction: sub v156,v155,v157
sub $s7,$s7,$s3
# Original instruction: sw v156,0(v154)
sw $s7,0($t3)
# Original instruction: lw v154,0(v154)
lw $t3,0($t3)
label_90_end:
# Original instruction: j label_88_end
j label_88_end
label_87_else:
# else:
# if BinOp(VarExpr(col),EQ,IntLiteral(3)) then
# Original instruction: lw v158,16($fp)
lw $s7,16($fp)
# Original instruction: li v160,3
li $t3,3
# Original instruction: xor v159,v158,v160
xor $t3,$s7,$t3
# Original instruction: sltiu v159,v159,1
sltiu $t3,$t3,1
# Original instruction: beq v159,$zero,label_91_else
beq $t3,$zero,label_91_else
# if BinOp(VarExpr(a23),EQ,VarExpr(empty)) then
# Original instruction: la v161, label_5_a23
la $t3, label_5_a23
# Original instruction: lb v161,0(v161)
lb $t3,0($t3)
# Original instruction: la v163, label_9_empty
la $s7, label_9_empty
# Original instruction: lb v163,0(v163)
lb $s7,0($s7)
# Original instruction: xor v162,v161,v163
xor $t3,$t3,$s7
# Original instruction: sltiu v162,v162,1
sltiu $t3,$t3,1
# Original instruction: beq v162,$zero,label_93_else
beq $t3,$zero,label_93_else
# Original instruction: la v164, label_5_a23
la $s7, label_5_a23
# Original instruction: lb v165,12($fp)
lb $t3,12($fp)
# Original instruction: sb v165,0(v164)
sb $t3,0($s7)
# Original instruction: lw v164,0(v164)
lw $s7,0($s7)
# Original instruction: j label_94_end
j label_94_end
label_93_else:
# else:
# Original instruction: addi v166,$fp,4
addi $s7,$fp,4
# Original instruction: li v167,0
li $s3,0
# Original instruction: li v169,1
li $t3,1
# Original instruction: sub v168,v167,v169
sub $t3,$s3,$t3
# Original instruction: sw v168,0(v166)
sw $t3,0($s7)
# Original instruction: lw v166,0(v166)
lw $s7,0($s7)
label_94_end:
# Original instruction: j label_92_end
j label_92_end
label_91_else:
# else:
# Original instruction: addi v170,$fp,4
addi $t3,$fp,4
# Original instruction: li v171,0
li $s7,0
# Original instruction: sw v171,0(v170)
sw $s7,0($t3)
# Original instruction: lw v170,0(v170)
lw $t3,0($t3)
label_92_end:
label_88_end:
label_84_end:
# Original instruction: j label_82_end
j label_82_end
label_81_else:
# else:
# if BinOp(VarExpr(row),EQ,ChrLiteral(c)) then
# Original instruction: lb v172,20($fp)
lb $s7,20($fp)
# Original instruction: li v174,99
li $t3,99
# Original instruction: xor v173,v172,v174
xor $t3,$s7,$t3
# Original instruction: sltiu v173,v173,1
sltiu $t3,$t3,1
# Original instruction: beq v173,$zero,label_95_else
beq $t3,$zero,label_95_else
# if BinOp(VarExpr(col),EQ,IntLiteral(1)) then
# Original instruction: lw v175,16($fp)
lw $s7,16($fp)
# Original instruction: li v177,1
li $t3,1
# Original instruction: xor v176,v175,v177
xor $t3,$s7,$t3
# Original instruction: sltiu v176,v176,1
sltiu $t3,$t3,1
# Original instruction: beq v176,$zero,label_97_else
beq $t3,$zero,label_97_else
# if BinOp(VarExpr(a31),EQ,VarExpr(empty)) then
# Original instruction: la v178, label_6_a31
la $s7, label_6_a31
# Original instruction: lb v178,0(v178)
lb $s7,0($s7)
# Original instruction: la v180, label_9_empty
la $t3, label_9_empty
# Original instruction: lb v180,0(v180)
lb $t3,0($t3)
# Original instruction: xor v179,v178,v180
xor $t3,$s7,$t3
# Original instruction: sltiu v179,v179,1
sltiu $t3,$t3,1
# Original instruction: beq v179,$zero,label_99_else
beq $t3,$zero,label_99_else
# Original instruction: la v181, label_6_a31
la $s7, label_6_a31
# Original instruction: lb v182,12($fp)
lb $t3,12($fp)
# Original instruction: sb v182,0(v181)
sb $t3,0($s7)
# Original instruction: lw v181,0(v181)
lw $s7,0($s7)
# Original instruction: j label_100_end
j label_100_end
label_99_else:
# else:
# Original instruction: addi v183,$fp,4
addi $s3,$fp,4
# Original instruction: li v184,0
li $s7,0
# Original instruction: li v186,1
li $t3,1
# Original instruction: sub v185,v184,v186
sub $t3,$s7,$t3
# Original instruction: sw v185,0(v183)
sw $t3,0($s3)
# Original instruction: lw v183,0(v183)
lw $s3,0($s3)
label_100_end:
# Original instruction: j label_98_end
j label_98_end
label_97_else:
# else:
# if BinOp(VarExpr(col),EQ,IntLiteral(2)) then
# Original instruction: lw v187,16($fp)
lw $t3,16($fp)
# Original instruction: li v189,2
li $s7,2
# Original instruction: xor v188,v187,v189
xor $t3,$t3,$s7
# Original instruction: sltiu v188,v188,1
sltiu $t3,$t3,1
# Original instruction: beq v188,$zero,label_101_else
beq $t3,$zero,label_101_else
# if BinOp(VarExpr(a32),EQ,VarExpr(empty)) then
# Original instruction: la v190, label_7_a32
la $t3, label_7_a32
# Original instruction: lb v190,0(v190)
lb $t3,0($t3)
# Original instruction: la v192, label_9_empty
la $s7, label_9_empty
# Original instruction: lb v192,0(v192)
lb $s7,0($s7)
# Original instruction: xor v191,v190,v192
xor $t3,$t3,$s7
# Original instruction: sltiu v191,v191,1
sltiu $t3,$t3,1
# Original instruction: beq v191,$zero,label_103_else
beq $t3,$zero,label_103_else
# Original instruction: la v193, label_7_a32
la $s7, label_7_a32
# Original instruction: lb v194,12($fp)
lb $t3,12($fp)
# Original instruction: sb v194,0(v193)
sb $t3,0($s7)
# Original instruction: lw v193,0(v193)
lw $s7,0($s7)
# Original instruction: j label_104_end
j label_104_end
label_103_else:
# else:
# Original instruction: addi v195,$fp,4
addi $s3,$fp,4
# Original instruction: li v196,0
li $s7,0
# Original instruction: li v198,1
li $t3,1
# Original instruction: sub v197,v196,v198
sub $t3,$s7,$t3
# Original instruction: sw v197,0(v195)
sw $t3,0($s3)
# Original instruction: lw v195,0(v195)
lw $s3,0($s3)
label_104_end:
# Original instruction: j label_102_end
j label_102_end
label_101_else:
# else:
# if BinOp(VarExpr(col),EQ,IntLiteral(3)) then
# Original instruction: lw v199,16($fp)
lw $t3,16($fp)
# Original instruction: li v201,3
li $s7,3
# Original instruction: xor v200,v199,v201
xor $t3,$t3,$s7
# Original instruction: sltiu v200,v200,1
sltiu $t3,$t3,1
# Original instruction: beq v200,$zero,label_105_else
beq $t3,$zero,label_105_else
# if BinOp(VarExpr(a33),EQ,VarExpr(empty)) then
# Original instruction: la v202, label_8_a33
la $s7, label_8_a33
# Original instruction: lb v202,0(v202)
lb $s7,0($s7)
# Original instruction: la v204, label_9_empty
la $t3, label_9_empty
# Original instruction: lb v204,0(v204)
lb $t3,0($t3)
# Original instruction: xor v203,v202,v204
xor $t3,$s7,$t3
# Original instruction: sltiu v203,v203,1
sltiu $t3,$t3,1
# Original instruction: beq v203,$zero,label_107_else
beq $t3,$zero,label_107_else
# Original instruction: la v205, label_8_a33
la $s7, label_8_a33
# Original instruction: lb v206,12($fp)
lb $t3,12($fp)
# Original instruction: sb v206,0(v205)
sb $t3,0($s7)
# Original instruction: lw v205,0(v205)
lw $s7,0($s7)
# Original instruction: j label_108_end
j label_108_end
label_107_else:
# else:
# Original instruction: addi v207,$fp,4
addi $s7,$fp,4
# Original instruction: li v208,0
li $t3,0
# Original instruction: li v210,1
li $s3,1
# Original instruction: sub v209,v208,v210
sub $t3,$t3,$s3
# Original instruction: sw v209,0(v207)
sw $t3,0($s7)
# Original instruction: lw v207,0(v207)
lw $s7,0($s7)
label_108_end:
# Original instruction: j label_106_end
j label_106_end
label_105_else:
# else:
# Original instruction: addi v211,$fp,4
addi $s7,$fp,4
# Original instruction: li v212,0
li $t3,0
# Original instruction: sw v212,0(v211)
sw $t3,0($s7)
# Original instruction: lw v211,0(v211)
lw $s7,0($s7)
label_106_end:
label_102_end:
label_98_end:
# Original instruction: j label_96_end
j label_96_end
label_95_else:
# else:
# Original instruction: addi v213,$fp,4
addi $s7,$fp,4
# Original instruction: li v214,0
li $t3,0
# Original instruction: sw v214,0(v213)
sw $t3,0($s7)
# Original instruction: lw v213,0(v213)
lw $s7,0($s7)
label_96_end:
label_82_end:
label_68_end:
# return statement
# Original instruction: lw v215,4($fp)
lw $t3,4($fp)
# Original instruction: sw v215,8($fp)
sw $t3,8($fp)
# restore saved registers from stack
# Original instruction: popRegisters
lw $t3,0($sp)
addi $sp,$sp,4
lw $s3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
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
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
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
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
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
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s3,0($sp)
addi $sp,$sp,4
lw $s3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
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
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
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
label_10_printGame_str:
.asciiz "\n"
label_109_label_10_printGame_str_pad:
.space 1
label_11_printGame_str:
.asciiz "     1   2   3\n"
label_12_printGame_str:
.asciiz "   +---+---+---+\n"
label_110_label_12_printGame_str_pad:
.space 2
label_13_printGame_str:
.asciiz "a  | "
label_111_label_13_printGame_str_pad:
.space 2
label_14_printGame_str:
.asciiz " | "
label_15_printGame_str:
.asciiz " | "
label_16_printGame_str:
.asciiz " |\n"
label_17_printGame_str:
.asciiz "   +---+---+---+\n"
label_112_label_17_printGame_str_pad:
.space 2
label_18_printGame_str:
.asciiz "b  | "
label_113_label_18_printGame_str_pad:
.space 2
label_19_printGame_str:
.asciiz " | "
label_20_printGame_str:
.asciiz " | "
label_21_printGame_str:
.asciiz " |\n"
label_22_printGame_str:
.asciiz "   +---+---+---+\n"
label_114_label_22_printGame_str_pad:
.space 2
label_23_printGame_str:
.asciiz "c  | "
label_115_label_23_printGame_str_pad:
.space 2
label_24_printGame_str:
.asciiz " | "
label_25_printGame_str:
.asciiz " | "
label_26_printGame_str:
.asciiz " |\n"
label_27_printGame_str:
.asciiz "   +---+---+---+\n"
label_116_label_27_printGame_str_pad:
.space 2
label_28_printGame_str:
.asciiz "\n"
label_117_label_28_printGame_str_pad:
.space 1

.data

.text
printGame:
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
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
# body of printGame:
# Original instruction: la v216, label_10_printGame_str
la $t3, label_10_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v216,0($sp)
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
# Original instruction: la v217, label_11_printGame_str
la $t3, label_11_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v217,0($sp)
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
# Original instruction: la v218, label_12_printGame_str
la $t3, label_12_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v218,0($sp)
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
# Original instruction: la v219, label_13_printGame_str
la $t3, label_13_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v219,0($sp)
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
# Original instruction: la v220, label_0_a11
la $t3, label_0_a11
# Original instruction: lb v220,0(v220)
lb $t3,0($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v220,0($sp)
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
# Original instruction: la v221, label_14_printGame_str
la $t3, label_14_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v221,0($sp)
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
# Original instruction: la v222, label_1_a12
la $t3, label_1_a12
# Original instruction: lb v222,0(v222)
lb $t3,0($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v222,0($sp)
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
# Original instruction: la v223, label_15_printGame_str
la $t3, label_15_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v223,0($sp)
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
# Original instruction: la v224, label_2_a13
la $t3, label_2_a13
# Original instruction: lb v224,0(v224)
lb $t3,0($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v224,0($sp)
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
# Original instruction: la v225, label_16_printGame_str
la $t3, label_16_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v225,0($sp)
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
# Original instruction: la v226, label_17_printGame_str
la $t3, label_17_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v226,0($sp)
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
# Original instruction: la v227, label_18_printGame_str
la $t3, label_18_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v227,0($sp)
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
# Original instruction: la v228, label_3_a21
la $t3, label_3_a21
# Original instruction: lb v228,0(v228)
lb $t3,0($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v228,0($sp)
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
# Original instruction: la v229, label_19_printGame_str
la $t3, label_19_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v229,0($sp)
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
# Original instruction: la v230, label_4_a22
la $t3, label_4_a22
# Original instruction: lb v230,0(v230)
lb $t3,0($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v230,0($sp)
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
# Original instruction: la v231, label_20_printGame_str
la $t3, label_20_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v231,0($sp)
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
# Original instruction: la v232, label_5_a23
la $t3, label_5_a23
# Original instruction: lb v232,0(v232)
lb $t3,0($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v232,0($sp)
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
# Original instruction: la v233, label_21_printGame_str
la $t3, label_21_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v233,0($sp)
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
# Original instruction: la v234, label_22_printGame_str
la $t3, label_22_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v234,0($sp)
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
# Original instruction: la v235, label_23_printGame_str
la $t3, label_23_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v235,0($sp)
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
# Original instruction: la v236, label_6_a31
la $t3, label_6_a31
# Original instruction: lb v236,0(v236)
lb $t3,0($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v236,0($sp)
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
# Original instruction: la v237, label_24_printGame_str
la $t3, label_24_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v237,0($sp)
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
# Original instruction: la v238, label_7_a32
la $t3, label_7_a32
# Original instruction: lb v238,0(v238)
lb $t3,0($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v238,0($sp)
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
# Original instruction: la v239, label_25_printGame_str
la $t3, label_25_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v239,0($sp)
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
# Original instruction: la v240, label_8_a33
la $t3, label_8_a33
# Original instruction: lb v240,0(v240)
lb $t3,0($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v240,0($sp)
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
# Original instruction: la v241, label_26_printGame_str
la $t3, label_26_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v241,0($sp)
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
# Original instruction: la v242, label_27_printGame_str
la $t3, label_27_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v242,0($sp)
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
# Original instruction: la v243, label_28_printGame_str
la $t3, label_28_printGame_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v243,0($sp)
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
# restore saved registers from stack
# Original instruction: popRegisters
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
label_29_printWinner_str:
.asciiz "Player "
label_30_printWinner_str:
.asciiz " has won!\n"
label_119_label_30_printWinner_str_pad:
.space 1

.data

.text
printWinner:
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
# body of printWinner:
# Original instruction: la v244, label_29_printWinner_str
la $t3, label_29_printWinner_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v244,0($sp)
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
# Original instruction: lw v245,8($fp)
lw $t3,8($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v245,0($sp)
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
# Original instruction: la v246, label_30_printWinner_str
la $t3, label_30_printWinner_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v246,0($sp)
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
# restore saved registers from stack
# Original instruction: popRegisters
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

.text
switchPlayer:
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
sw $s7,0($sp)
# body of switchPlayer:
# if BinOp(VarExpr(currentPlayer),EQ,IntLiteral(1)) then
# Original instruction: lw v247,12($fp)
lw $t3,12($fp)
# Original instruction: li v249,1
li $s7,1
# Original instruction: xor v248,v247,v249
xor $t3,$t3,$s7
# Original instruction: sltiu v248,v248,1
sltiu $t3,$t3,1
# Original instruction: beq v248,$zero,label_122_else
beq $t3,$zero,label_122_else
# return statement
# Original instruction: li v250,2
li $t3,2
# Original instruction: sw v250,8($fp)
sw $t3,8($fp)
# Original instruction: j label_123_end
j label_123_end
label_122_else:
# else:
# return statement
# Original instruction: li v251,1
li $t3,1
# Original instruction: sw v251,8($fp)
sw $t3,8($fp)
label_123_end:
# restore saved registers from stack
# Original instruction: popRegisters
lw $s7,0($sp)
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

.text
get_mark:
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
sw $s7,0($sp)
# body of get_mark:
# if BinOp(VarExpr(player),EQ,IntLiteral(1)) then
# Original instruction: lw v252,12($fp)
lw $s7,12($fp)
# Original instruction: li v254,1
li $t3,1
# Original instruction: xor v253,v252,v254
xor $t3,$s7,$t3
# Original instruction: sltiu v253,v253,1
sltiu $t3,$t3,1
# Original instruction: beq v253,$zero,label_125_else
beq $t3,$zero,label_125_else
# return statement
# Original instruction: li v255,88
li $t3,88
# Original instruction: sb v255,8($fp)
sb $t3,8($fp)
# Original instruction: j label_126_end
j label_126_end
label_125_else:
# else:
# return statement
# Original instruction: li v256,79
li $t3,79
# Original instruction: sb v256,8($fp)
sb $t3,8($fp)
label_126_end:
# restore saved registers from stack
# Original instruction: popRegisters
lw $s7,0($sp)
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
label_31_selectmove_str:
.asciiz "Player "
label_32_selectmove_str:
.asciiz " select move (e.g. a2)>"
label_33_selectmove_str:
.asciiz "That is not a valid move!\n"
label_127_label_33_selectmove_str_pad:
.space 1
label_34_selectmove_str:
.asciiz "That move is not possible!\n"

.data

.text
selectmove:
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
# save all registers needed for fn
# Original instruction: pushRegisters
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
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
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s3,0($sp)
# body of selectmove:
# Original instruction: addi v257,$fp,-4
addi $s7,$fp,-4
# Original instruction: li v258,1
li $t3,1
# Original instruction: sw v258,0(v257)
sw $t3,0($s7)
# Original instruction: lw v257,0(v257)
lw $s7,0($s7)
# loop while: VarExpr(selected)
# Original instruction: lw v259,-4($fp)
lw $t3,-4($fp)
# Original instruction: beqz v259,label_129_next
beqz $t3,label_129_next
label_130_body:
# Original instruction: la v260, label_31_selectmove_str
la $t3, label_31_selectmove_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v260,0($sp)
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
# Original instruction: lw v261,8($fp)
lw $t3,8($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v261,0($sp)
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
# Original instruction: la v262, label_32_selectmove_str
la $t3, label_32_selectmove_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v262,0($sp)
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
# Original instruction: addi v263,$fp,4
addi $t3,$fp,4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal read_c
jal read_c
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lb v264,4($sp)
lb $s7,4($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: sb v264,0(v263)
sb $s7,0($t3)
# Original instruction: lw v263,0(v263)
lw $t3,0($t3)
# Original instruction: addi v265,$fp,0
addi $t3,$fp,0
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
# Original instruction: lw v266,4($sp)
lw $s7,4($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: sw v266,0(v265)
sw $s7,0($t3)
# Original instruction: lw v265,0(v265)
lw $t3,0($t3)
# Original instruction: addi v267,$fp,-12
addi $t3,$fp,-12
# Original instruction: lw v268,8($fp)
lw $s7,8($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v268,0($sp)
sw $s7,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal get_mark
jal get_mark
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lb v269,4($sp)
lb $s7,4($sp)
# Original instruction: addi $sp,$sp,12
addi $sp,$sp,12
# Original instruction: sb v269,0(v267)
sb $s7,0($t3)
# Original instruction: lw v267,0(v267)
lw $t3,0($t3)
# Original instruction: addi v270,$fp,-8
addi $s7,$fp,-8
# Original instruction: lb v271,4($fp)
lb $t3,4($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v271,0($sp)
sw $t3,0($sp)
# Original instruction: lw v272,0($fp)
lw $t3,0($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v272,0($sp)
sw $t3,0($sp)
# Original instruction: lb v273,-12($fp)
lb $t3,-12($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v273,0($sp)
sw $t3,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal set
jal set
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lw v274,4($sp)
lw $t3,4($sp)
# Original instruction: addi $sp,$sp,20
addi $sp,$sp,20
# Original instruction: sw v274,0(v270)
sw $t3,0($s7)
# Original instruction: lw v270,0(v270)
lw $s7,0($s7)
# if BinOp(VarExpr(success),EQ,IntLiteral(0)) then
# Original instruction: lw v275,-8($fp)
lw $t3,-8($fp)
# Original instruction: li v277,0
li $s7,0
# Original instruction: xor v276,v275,v277
xor $t3,$t3,$s7
# Original instruction: sltiu v276,v276,1
sltiu $t3,$t3,1
# Original instruction: beq v276,$zero,label_131_else
beq $t3,$zero,label_131_else
# Original instruction: la v278, label_33_selectmove_str
la $t3, label_33_selectmove_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v278,0($sp)
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
# Original instruction: j label_132_end
j label_132_end
label_131_else:
# else:
# if BinOp(VarExpr(success),EQ,BinOp(IntLiteral(0),SUB,IntLiteral(1))) then
# Original instruction: lw v279,-8($fp)
lw $s3,-8($fp)
# Original instruction: li v281,0
li $t3,0
# Original instruction: li v283,1
li $s7,1
# Original instruction: sub v282,v281,v283
sub $t3,$t3,$s7
# Original instruction: xor v280,v279,v282
xor $t3,$s3,$t3
# Original instruction: sltiu v280,v280,1
sltiu $t3,$t3,1
# Original instruction: beq v280,$zero,label_133_else
beq $t3,$zero,label_133_else
# Original instruction: la v284, label_34_selectmove_str
la $t3, label_34_selectmove_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v284,0($sp)
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
# Original instruction: j label_134_end
j label_134_end
label_133_else:
# else:
# Original instruction: addi v285,$fp,-4
addi $t3,$fp,-4
# Original instruction: li v286,0
li $s7,0
# Original instruction: sw v286,0(v285)
sw $s7,0($t3)
# Original instruction: lw v285,0(v285)
lw $t3,0($t3)
label_134_end:
label_132_end:
# Original instruction: lw v287,-4($fp)
lw $t3,-4($fp)
# Original instruction: bnez v287,label_130_body
bnez $t3,label_130_body
label_129_next:
# restore saved registers from stack
# Original instruction: popRegisters
lw $s3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
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
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
# restore stack pointer
# Original instruction: addi $sp,$sp,24
addi $sp,$sp,24
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# jump to return address
# Original instruction: jr $ra
jr $ra

.data

.text
won:
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
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
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
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
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
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
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
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
# body of won:
# Original instruction: addi v288,$fp,4
addi $t3,$fp,4
# Original instruction: li v289,0
li $s7,0
# Original instruction: sw v289,0(v288)
sw $s7,0($t3)
# Original instruction: lw v288,0(v288)
lw $t3,0($t3)
# if BinOp(VarExpr(a11),EQ,VarExpr(mark)) then
# Original instruction: la v290, label_0_a11
la $t3, label_0_a11
# Original instruction: lb v290,0(v290)
lb $t3,0($t3)
# Original instruction: lb v292,12($fp)
lb $s7,12($fp)
# Original instruction: xor v291,v290,v292
xor $t3,$t3,$s7
# Original instruction: sltiu v291,v291,1
sltiu $t3,$t3,1
# Original instruction: beq v291,$zero,label_136_else
beq $t3,$zero,label_136_else
# if BinOp(VarExpr(a21),EQ,VarExpr(mark)) then
# Original instruction: la v293, label_3_a21
la $t3, label_3_a21
# Original instruction: lb v293,0(v293)
lb $t3,0($t3)
# Original instruction: lb v295,12($fp)
lb $s7,12($fp)
# Original instruction: xor v294,v293,v295
xor $t3,$t3,$s7
# Original instruction: sltiu v294,v294,1
sltiu $t3,$t3,1
# Original instruction: beq v294,$zero,label_138_else
beq $t3,$zero,label_138_else
# if BinOp(VarExpr(a31),EQ,VarExpr(mark)) then
# Original instruction: la v296, label_6_a31
la $t3, label_6_a31
# Original instruction: lb v296,0(v296)
lb $t3,0($t3)
# Original instruction: lb v298,12($fp)
lb $s7,12($fp)
# Original instruction: xor v297,v296,v298
xor $t3,$t3,$s7
# Original instruction: sltiu v297,v297,1
sltiu $t3,$t3,1
# Original instruction: beq v297,$zero,label_140_else
beq $t3,$zero,label_140_else
# Original instruction: addi v299,$fp,4
addi $s7,$fp,4
# Original instruction: li v300,1
li $t3,1
# Original instruction: sw v300,0(v299)
sw $t3,0($s7)
# Original instruction: lw v299,0(v299)
lw $s7,0($s7)
# Original instruction: j label_141_end
j label_141_end
label_140_else:
label_141_end:
# Original instruction: j label_139_end
j label_139_end
label_138_else:
# else:
# if BinOp(VarExpr(a22),EQ,VarExpr(mark)) then
# Original instruction: la v301, label_4_a22
la $t3, label_4_a22
# Original instruction: lb v301,0(v301)
lb $t3,0($t3)
# Original instruction: lb v303,12($fp)
lb $s7,12($fp)
# Original instruction: xor v302,v301,v303
xor $t3,$t3,$s7
# Original instruction: sltiu v302,v302,1
sltiu $t3,$t3,1
# Original instruction: beq v302,$zero,label_142_else
beq $t3,$zero,label_142_else
# if BinOp(VarExpr(a33),EQ,VarExpr(mark)) then
# Original instruction: la v304, label_8_a33
la $t3, label_8_a33
# Original instruction: lb v304,0(v304)
lb $t3,0($t3)
# Original instruction: lb v306,12($fp)
lb $s7,12($fp)
# Original instruction: xor v305,v304,v306
xor $t3,$t3,$s7
# Original instruction: sltiu v305,v305,1
sltiu $t3,$t3,1
# Original instruction: beq v305,$zero,label_144_else
beq $t3,$zero,label_144_else
# Original instruction: addi v307,$fp,4
addi $s7,$fp,4
# Original instruction: li v308,1
li $t3,1
# Original instruction: sw v308,0(v307)
sw $t3,0($s7)
# Original instruction: lw v307,0(v307)
lw $s7,0($s7)
# Original instruction: j label_145_end
j label_145_end
label_144_else:
label_145_end:
# Original instruction: j label_143_end
j label_143_end
label_142_else:
# else:
# if BinOp(VarExpr(a12),EQ,VarExpr(mark)) then
# Original instruction: la v309, label_1_a12
la $s7, label_1_a12
# Original instruction: lb v309,0(v309)
lb $s7,0($s7)
# Original instruction: lb v311,12($fp)
lb $t3,12($fp)
# Original instruction: xor v310,v309,v311
xor $t3,$s7,$t3
# Original instruction: sltiu v310,v310,1
sltiu $t3,$t3,1
# Original instruction: beq v310,$zero,label_146_else
beq $t3,$zero,label_146_else
# if BinOp(VarExpr(a13),EQ,VarExpr(mark)) then
# Original instruction: la v312, label_2_a13
la $t3, label_2_a13
# Original instruction: lb v312,0(v312)
lb $t3,0($t3)
# Original instruction: lb v314,12($fp)
lb $s7,12($fp)
# Original instruction: xor v313,v312,v314
xor $t3,$t3,$s7
# Original instruction: sltiu v313,v313,1
sltiu $t3,$t3,1
# Original instruction: beq v313,$zero,label_148_else
beq $t3,$zero,label_148_else
# Original instruction: addi v315,$fp,4
addi $t3,$fp,4
# Original instruction: li v316,1
li $s7,1
# Original instruction: sw v316,0(v315)
sw $s7,0($t3)
# Original instruction: lw v315,0(v315)
lw $t3,0($t3)
# Original instruction: j label_149_end
j label_149_end
label_148_else:
label_149_end:
# Original instruction: j label_147_end
j label_147_end
label_146_else:
label_147_end:
label_143_end:
label_139_end:
# Original instruction: j label_137_end
j label_137_end
label_136_else:
label_137_end:
# if BinOp(VarExpr(a12),EQ,VarExpr(mark)) then
# Original instruction: la v317, label_1_a12
la $s7, label_1_a12
# Original instruction: lb v317,0(v317)
lb $s7,0($s7)
# Original instruction: lb v319,12($fp)
lb $t3,12($fp)
# Original instruction: xor v318,v317,v319
xor $t3,$s7,$t3
# Original instruction: sltiu v318,v318,1
sltiu $t3,$t3,1
# Original instruction: beq v318,$zero,label_150_else
beq $t3,$zero,label_150_else
# if BinOp(VarExpr(a22),EQ,VarExpr(mark)) then
# Original instruction: la v320, label_4_a22
la $s7, label_4_a22
# Original instruction: lb v320,0(v320)
lb $s7,0($s7)
# Original instruction: lb v322,12($fp)
lb $t3,12($fp)
# Original instruction: xor v321,v320,v322
xor $t3,$s7,$t3
# Original instruction: sltiu v321,v321,1
sltiu $t3,$t3,1
# Original instruction: beq v321,$zero,label_152_else
beq $t3,$zero,label_152_else
# if BinOp(VarExpr(a32),EQ,VarExpr(mark)) then
# Original instruction: la v323, label_7_a32
la $s7, label_7_a32
# Original instruction: lb v323,0(v323)
lb $s7,0($s7)
# Original instruction: lb v325,12($fp)
lb $t3,12($fp)
# Original instruction: xor v324,v323,v325
xor $t3,$s7,$t3
# Original instruction: sltiu v324,v324,1
sltiu $t3,$t3,1
# Original instruction: beq v324,$zero,label_154_else
beq $t3,$zero,label_154_else
# Original instruction: addi v326,$fp,4
addi $t3,$fp,4
# Original instruction: li v327,1
li $s7,1
# Original instruction: sw v327,0(v326)
sw $s7,0($t3)
# Original instruction: lw v326,0(v326)
lw $t3,0($t3)
# Original instruction: j label_155_end
j label_155_end
label_154_else:
label_155_end:
# Original instruction: j label_153_end
j label_153_end
label_152_else:
label_153_end:
# Original instruction: j label_151_end
j label_151_end
label_150_else:
label_151_end:
# if BinOp(VarExpr(a13),EQ,VarExpr(mark)) then
# Original instruction: la v328, label_2_a13
la $t3, label_2_a13
# Original instruction: lb v328,0(v328)
lb $t3,0($t3)
# Original instruction: lb v330,12($fp)
lb $s7,12($fp)
# Original instruction: xor v329,v328,v330
xor $t3,$t3,$s7
# Original instruction: sltiu v329,v329,1
sltiu $t3,$t3,1
# Original instruction: beq v329,$zero,label_156_else
beq $t3,$zero,label_156_else
# if BinOp(VarExpr(a23),EQ,VarExpr(mark)) then
# Original instruction: la v331, label_5_a23
la $s7, label_5_a23
# Original instruction: lb v331,0(v331)
lb $s7,0($s7)
# Original instruction: lb v333,12($fp)
lb $t3,12($fp)
# Original instruction: xor v332,v331,v333
xor $t3,$s7,$t3
# Original instruction: sltiu v332,v332,1
sltiu $t3,$t3,1
# Original instruction: beq v332,$zero,label_158_else
beq $t3,$zero,label_158_else
# if BinOp(VarExpr(a33),EQ,VarExpr(mark)) then
# Original instruction: la v334, label_8_a33
la $t3, label_8_a33
# Original instruction: lb v334,0(v334)
lb $t3,0($t3)
# Original instruction: lb v336,12($fp)
lb $s7,12($fp)
# Original instruction: xor v335,v334,v336
xor $t3,$t3,$s7
# Original instruction: sltiu v335,v335,1
sltiu $t3,$t3,1
# Original instruction: beq v335,$zero,label_160_else
beq $t3,$zero,label_160_else
# Original instruction: addi v337,$fp,4
addi $s7,$fp,4
# Original instruction: li v338,1
li $t3,1
# Original instruction: sw v338,0(v337)
sw $t3,0($s7)
# Original instruction: lw v337,0(v337)
lw $s7,0($s7)
# Original instruction: j label_161_end
j label_161_end
label_160_else:
label_161_end:
# Original instruction: j label_159_end
j label_159_end
label_158_else:
# else:
# if BinOp(VarExpr(a22),EQ,VarExpr(mark)) then
# Original instruction: la v339, label_4_a22
la $s7, label_4_a22
# Original instruction: lb v339,0(v339)
lb $s7,0($s7)
# Original instruction: lb v341,12($fp)
lb $t3,12($fp)
# Original instruction: xor v340,v339,v341
xor $t3,$s7,$t3
# Original instruction: sltiu v340,v340,1
sltiu $t3,$t3,1
# Original instruction: beq v340,$zero,label_162_else
beq $t3,$zero,label_162_else
# if BinOp(VarExpr(a31),EQ,VarExpr(mark)) then
# Original instruction: la v342, label_6_a31
la $t3, label_6_a31
# Original instruction: lb v342,0(v342)
lb $t3,0($t3)
# Original instruction: lb v344,12($fp)
lb $s7,12($fp)
# Original instruction: xor v343,v342,v344
xor $t3,$t3,$s7
# Original instruction: sltiu v343,v343,1
sltiu $t3,$t3,1
# Original instruction: beq v343,$zero,label_164_else
beq $t3,$zero,label_164_else
# Original instruction: addi v345,$fp,4
addi $s7,$fp,4
# Original instruction: li v346,1
li $t3,1
# Original instruction: sw v346,0(v345)
sw $t3,0($s7)
# Original instruction: lw v345,0(v345)
lw $s7,0($s7)
# Original instruction: j label_165_end
j label_165_end
label_164_else:
label_165_end:
# Original instruction: j label_163_end
j label_163_end
label_162_else:
label_163_end:
label_159_end:
# Original instruction: j label_157_end
j label_157_end
label_156_else:
label_157_end:
# if BinOp(VarExpr(a21),EQ,VarExpr(mark)) then
# Original instruction: la v347, label_3_a21
la $t3, label_3_a21
# Original instruction: lb v347,0(v347)
lb $t3,0($t3)
# Original instruction: lb v349,12($fp)
lb $s7,12($fp)
# Original instruction: xor v348,v347,v349
xor $t3,$t3,$s7
# Original instruction: sltiu v348,v348,1
sltiu $t3,$t3,1
# Original instruction: beq v348,$zero,label_166_else
beq $t3,$zero,label_166_else
# if BinOp(VarExpr(a22),EQ,VarExpr(mark)) then
# Original instruction: la v350, label_4_a22
la $t3, label_4_a22
# Original instruction: lb v350,0(v350)
lb $t3,0($t3)
# Original instruction: lb v352,12($fp)
lb $s7,12($fp)
# Original instruction: xor v351,v350,v352
xor $t3,$t3,$s7
# Original instruction: sltiu v351,v351,1
sltiu $t3,$t3,1
# Original instruction: beq v351,$zero,label_168_else
beq $t3,$zero,label_168_else
# if BinOp(VarExpr(a23),EQ,VarExpr(mark)) then
# Original instruction: la v353, label_5_a23
la $s7, label_5_a23
# Original instruction: lb v353,0(v353)
lb $s7,0($s7)
# Original instruction: lb v355,12($fp)
lb $t3,12($fp)
# Original instruction: xor v354,v353,v355
xor $t3,$s7,$t3
# Original instruction: sltiu v354,v354,1
sltiu $t3,$t3,1
# Original instruction: beq v354,$zero,label_170_else
beq $t3,$zero,label_170_else
# Original instruction: addi v356,$fp,4
addi $t3,$fp,4
# Original instruction: li v357,1
li $s7,1
# Original instruction: sw v357,0(v356)
sw $s7,0($t3)
# Original instruction: lw v356,0(v356)
lw $t3,0($t3)
# Original instruction: j label_171_end
j label_171_end
label_170_else:
label_171_end:
# Original instruction: j label_169_end
j label_169_end
label_168_else:
label_169_end:
# Original instruction: j label_167_end
j label_167_end
label_166_else:
label_167_end:
# if BinOp(VarExpr(a31),EQ,VarExpr(mark)) then
# Original instruction: la v358, label_6_a31
la $s7, label_6_a31
# Original instruction: lb v358,0(v358)
lb $s7,0($s7)
# Original instruction: lb v360,12($fp)
lb $t3,12($fp)
# Original instruction: xor v359,v358,v360
xor $t3,$s7,$t3
# Original instruction: sltiu v359,v359,1
sltiu $t3,$t3,1
# Original instruction: beq v359,$zero,label_172_else
beq $t3,$zero,label_172_else
# if BinOp(VarExpr(a32),EQ,VarExpr(mark)) then
# Original instruction: la v361, label_7_a32
la $t3, label_7_a32
# Original instruction: lb v361,0(v361)
lb $t3,0($t3)
# Original instruction: lb v363,12($fp)
lb $s7,12($fp)
# Original instruction: xor v362,v361,v363
xor $t3,$t3,$s7
# Original instruction: sltiu v362,v362,1
sltiu $t3,$t3,1
# Original instruction: beq v362,$zero,label_174_else
beq $t3,$zero,label_174_else
# if BinOp(VarExpr(a33),EQ,VarExpr(mark)) then
# Original instruction: la v364, label_8_a33
la $s7, label_8_a33
# Original instruction: lb v364,0(v364)
lb $s7,0($s7)
# Original instruction: lb v366,12($fp)
lb $t3,12($fp)
# Original instruction: xor v365,v364,v366
xor $t3,$s7,$t3
# Original instruction: sltiu v365,v365,1
sltiu $t3,$t3,1
# Original instruction: beq v365,$zero,label_176_else
beq $t3,$zero,label_176_else
# Original instruction: addi v367,$fp,4
addi $t3,$fp,4
# Original instruction: li v368,1
li $s7,1
# Original instruction: sw v368,0(v367)
sw $s7,0($t3)
# Original instruction: lw v367,0(v367)
lw $t3,0($t3)
# Original instruction: j label_177_end
j label_177_end
label_176_else:
label_177_end:
# Original instruction: j label_175_end
j label_175_end
label_174_else:
label_175_end:
# Original instruction: j label_173_end
j label_173_end
label_172_else:
label_173_end:
# return statement
# Original instruction: lw v369,4($fp)
lw $t3,4($fp)
# Original instruction: sw v369,8($fp)
sw $t3,8($fp)
# restore saved registers from stack
# Original instruction: popRegisters
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
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
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
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
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
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
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
addi $sp,$sp,4
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
label_35_main_str:
.asciiz "It\'s a draw!\n"
label_178_label_35_main_str_pad:
.space 2
label_36_main_str:
.asciiz "Play again? (y/n)> "

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
# Original instruction: la v370, label_9_empty
la $s7, label_9_empty
# Original instruction: li v371,32
li $t3,32
# Original instruction: sb v371,0(v370)
sb $t3,0($s7)
# Original instruction: lw v370,0(v370)
lw $s7,0($s7)
# Original instruction: addi v372,$fp,4
addi $t3,$fp,4
# Original instruction: li v373,1
li $s7,1
# Original instruction: sw v373,0(v372)
sw $s7,0($t3)
# Original instruction: lw v372,0(v372)
lw $t3,0($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal reset
jal reset
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal printGame
jal printGame
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# Original instruction: addi v374,$fp,0
addi $s7,$fp,0
# Original instruction: li v375,1
li $t3,1
# Original instruction: sw v375,0(v374)
sw $t3,0($s7)
# Original instruction: lw v374,0(v374)
lw $s7,0($s7)
# loop while: VarExpr(playing)
# Original instruction: lw v376,4($fp)
lw $t3,4($fp)
# Original instruction: beqz v376,label_179_next
beqz $t3,label_179_next
label_180_body:
# Original instruction: lw v377,0($fp)
lw $t3,0($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v377,0($sp)
sw $t3,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal selectmove
jal selectmove
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: addi v378,$fp,-4
addi $s7,$fp,-4
# Original instruction: lw v379,0($fp)
lw $t3,0($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v379,0($sp)
sw $t3,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal get_mark
jal get_mark
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lb v380,4($sp)
lb $t3,4($sp)
# Original instruction: addi $sp,$sp,12
addi $sp,$sp,12
# Original instruction: sb v380,0(v378)
sb $t3,0($s7)
# Original instruction: lw v378,0(v378)
lw $s7,0($s7)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal printGame
jal printGame
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# if FunCallExpr(won,ArrayBuffer(VarExpr(mark))) then
# Original instruction: lb v381,-4($fp)
lb $t3,-4($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v381,0($sp)
sw $t3,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal won
jal won
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lw v382,4($sp)
lw $t3,4($sp)
# Original instruction: addi $sp,$sp,12
addi $sp,$sp,12
# Original instruction: beq v382,$zero,label_181_else
beq $t3,$zero,label_181_else
# Original instruction: lw v383,0($fp)
lw $t3,0($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v383,0($sp)
sw $t3,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal printWinner
jal printWinner
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: addi v384,$fp,4
addi $s7,$fp,4
# Original instruction: li v385,0
li $t3,0
# Original instruction: sw v385,0(v384)
sw $t3,0($s7)
# Original instruction: lw v384,0(v384)
lw $s7,0($s7)
# Original instruction: j label_182_end
j label_182_end
label_181_else:
# else:
# if BinOp(FunCallExpr(full,ArrayBuffer()),EQ,IntLiteral(1)) then
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal full
jal full
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lw v386,4($sp)
lw $t3,4($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: li v388,1
li $s7,1
# Original instruction: xor v387,v386,v388
xor $t3,$t3,$s7
# Original instruction: sltiu v387,v387,1
sltiu $t3,$t3,1
# Original instruction: beq v387,$zero,label_183_else
beq $t3,$zero,label_183_else
# Original instruction: la v389, label_35_main_str
la $t3, label_35_main_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v389,0($sp)
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
# Original instruction: addi v390,$fp,4
addi $s7,$fp,4
# Original instruction: li v391,0
li $t3,0
# Original instruction: sw v391,0(v390)
sw $t3,0($s7)
# Original instruction: lw v390,0(v390)
lw $s7,0($s7)
# Original instruction: j label_184_end
j label_184_end
label_183_else:
# else:
# Original instruction: addi v392,$fp,0
addi $s7,$fp,0
# Original instruction: lw v393,0($fp)
lw $t3,0($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v393,0($sp)
sw $t3,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal switchPlayer
jal switchPlayer
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lw v394,4($sp)
lw $t3,4($sp)
# Original instruction: addi $sp,$sp,12
addi $sp,$sp,12
# Original instruction: sw v394,0(v392)
sw $t3,0($s7)
# Original instruction: lw v392,0(v392)
lw $s7,0($s7)
label_184_end:
label_182_end:
# if BinOp(VarExpr(playing),EQ,IntLiteral(0)) then
# Original instruction: lw v395,4($fp)
lw $t3,4($fp)
# Original instruction: li v397,0
li $s7,0
# Original instruction: xor v396,v395,v397
xor $t3,$t3,$s7
# Original instruction: sltiu v396,v396,1
sltiu $t3,$t3,1
# Original instruction: beq v396,$zero,label_185_else
beq $t3,$zero,label_185_else
# Original instruction: la v398, label_36_main_str
la $t3, label_36_main_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v398,0($sp)
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
# Original instruction: addi v399,$fp,-8
addi $t3,$fp,-8
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal read_c
jal read_c
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lb v400,4($sp)
lb $s7,4($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: sb v400,0(v399)
sb $s7,0($t3)
# Original instruction: lw v399,0(v399)
lw $t3,0($t3)
# if BinOp(VarExpr(yesno),EQ,ChrLiteral(y)) then
# Original instruction: lb v401,-8($fp)
lb $t3,-8($fp)
# Original instruction: li v403,121
li $s7,121
# Original instruction: xor v402,v401,v403
xor $t3,$t3,$s7
# Original instruction: sltiu v402,v402,1
sltiu $t3,$t3,1
# Original instruction: beq v402,$zero,label_187_else
beq $t3,$zero,label_187_else
# Original instruction: addi v404,$fp,4
addi $s7,$fp,4
# Original instruction: li v405,1
li $t3,1
# Original instruction: sw v405,0(v404)
sw $t3,0($s7)
# Original instruction: lw v404,0(v404)
lw $s7,0($s7)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal reset
jal reset
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# Original instruction: j label_188_end
j label_188_end
label_187_else:
# else:
# if BinOp(VarExpr(yesno),EQ,ChrLiteral(Y)) then
# Original instruction: lb v406,-8($fp)
lb $s7,-8($fp)
# Original instruction: li v408,89
li $t3,89
# Original instruction: xor v407,v406,v408
xor $t3,$s7,$t3
# Original instruction: sltiu v407,v407,1
sltiu $t3,$t3,1
# Original instruction: beq v407,$zero,label_189_else
beq $t3,$zero,label_189_else
# Original instruction: addi v409,$fp,4
addi $t3,$fp,4
# Original instruction: li v410,1
li $s7,1
# Original instruction: sw v410,0(v409)
sw $s7,0($t3)
# Original instruction: lw v409,0(v409)
lw $t3,0($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal reset
jal reset
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# Original instruction: j label_190_end
j label_190_end
label_189_else:
label_190_end:
label_188_end:
# Original instruction: j label_186_end
j label_186_end
label_185_else:
label_186_end:
# Original instruction: lw v411,4($fp)
lw $t3,4($fp)
# Original instruction: bnez v411,label_180_body
bnez $t3,label_180_body
label_179_next:
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

