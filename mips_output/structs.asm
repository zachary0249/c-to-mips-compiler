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
label_72_v12:
.space 4
label_38_v2:
.space 4
label_55_v9:
.space 4
label_66_v11:
.space 4
label_57_v8:
.space 4
label_78_v15:
.space 4
label_50_v7:
.space 4
label_35_v3:
.space 4
label_70_v13:
.space 4
label_76_v16:
.space 4
label_65_v10:
.space 4
label_43_v4:
.space 4
label_51_v6:
.space 4
label_75_v14:
.space 4
label_31_v0:
.space 4
label_30_v1:
.space 4
label_39_v5:
.space 4

.text
fun:
# push frame pointer onto stack
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# initialize frame pointer
# Original instruction: add $fp,$sp,$zero
add $fp,$sp,$zero
# allocate local variables
# Original instruction: addi $sp,$sp,-24
addi $sp,$sp,-24
# save all registers needed for fn
# Original instruction: pushRegisters
la $t0, label_72_v12
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_38_v2
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_55_v9
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_66_v11
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_57_v8
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_78_v15
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_50_v7
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_35_v3
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_70_v13
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_76_v16
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_65_v10
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_43_v4
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_51_v6
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_75_v14
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_31_v0
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_30_v1
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_39_v5
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# body of fun:
# Original instruction: addi v0,$fp,4
addi $t5,$fp,4
la $t4, label_31_v0
sw $t5,0($t4)
# Original instruction: addi v0,v0,0
la $t4, label_31_v0
lw $t4,0($t4)
addi $t4,$t4,0
la $t3, label_31_v0
sw $t4,0($t3)
# Original instruction: addi v0,v0,0
la $t4, label_31_v0
lw $t4,0($t4)
addi $t4,$t4,0
la $t3, label_31_v0
sw $t4,0($t3)
# Original instruction: li v1,5
li $t5,5
la $t4, label_30_v1
sw $t5,0($t4)
# Original instruction: sw v1,0(v0)
la $t5, label_30_v1
lw $t5,0($t5)
la $t4, label_31_v0
lw $t4,0($t4)
sw $t5,0($t4)
# if BinOp(FieldAccessExpr(FieldAccessExpr(VarExpr(f),a),s_2),EQ,IntLiteral(10)) then
# Original instruction: addi v3,$fp,4
addi $t5,$fp,4
la $t4, label_35_v3
sw $t5,0($t4)
# Original instruction: addi v3,v3,0
la $t4, label_35_v3
lw $t4,0($t4)
addi $t4,$t4,0
la $t3, label_35_v3
sw $t4,0($t3)
# Original instruction: lw v2,0(v3)
la $t5, label_35_v3
lw $t5,0($t5)
lw $t4,0($t5)
la $t3, label_38_v2
sw $t4,0($t3)
# Original instruction: li v5,10
li $t5,10
la $t4, label_39_v5
sw $t5,0($t4)
# Original instruction: xor v4,v2,v5
la $t5, label_38_v2
lw $t5,0($t5)
la $t4, label_39_v5
lw $t4,0($t4)
xor $t3,$t5,$t4
la $t2, label_43_v4
sw $t3,0($t2)
# Original instruction: sltiu v4,v4,1
la $t4, label_43_v4
lw $t4,0($t4)
sltiu $t4,$t4,1
la $t3, label_43_v4
sw $t4,0($t3)
# Original instruction: beq v4,$zero,label_14_else
la $t5, label_43_v4
lw $t5,0($t5)
beq $t5,$zero,label_14_else
# Original instruction: addi v6,$fp,4
addi $t5,$fp,4
la $t4, label_51_v6
sw $t5,0($t4)
# Original instruction: addi v6,v6,20
la $t4, label_51_v6
lw $t4,0($t4)
addi $t4,$t4,20
la $t3, label_51_v6
sw $t4,0($t3)
# Original instruction: addi v6,v6,20
la $t4, label_51_v6
lw $t4,0($t4)
addi $t4,$t4,20
la $t3, label_51_v6
sw $t4,0($t3)
# Original instruction: li v7,10
li $t5,10
la $t4, label_50_v7
sw $t5,0($t4)
# Original instruction: sw v7,0(v6)
la $t5, label_50_v7
lw $t5,0($t5)
la $t4, label_51_v6
lw $t4,0($t4)
sw $t5,0($t4)
# return statement
# Original instruction: addi v9,$fp,4
addi $t5,$fp,4
la $t4, label_55_v9
sw $t5,0($t4)
# Original instruction: addi v9,v9,20
la $t4, label_55_v9
lw $t4,0($t4)
addi $t4,$t4,20
la $t3, label_55_v9
sw $t4,0($t3)
# Original instruction: lw v8,40(v9)
la $t5, label_55_v9
lw $t5,0($t5)
lw $t4,40($t5)
la $t3, label_57_v8
sw $t4,0($t3)
# Original instruction: sw v8,8($fp)
la $t5, label_57_v8
lw $t5,0($t5)
sw $t5,8($fp)
# Original instruction: j label_15_end
j label_15_end
label_14_else:
# else:
# if Assign(FieldAccessExpr(FieldAccessExpr(VarExpr(f),a),s_2),IntLiteral(5)) then
# Original instruction: addi v10,$fp,4
addi $t5,$fp,4
la $t4, label_65_v10
sw $t5,0($t4)
# Original instruction: addi v10,v10,0
la $t4, label_65_v10
lw $t4,0($t4)
addi $t4,$t4,0
la $t3, label_65_v10
sw $t4,0($t3)
# Original instruction: addi v10,v10,0
la $t4, label_65_v10
lw $t4,0($t4)
addi $t4,$t4,0
la $t3, label_65_v10
sw $t4,0($t3)
# Original instruction: li v11,5
li $t5,5
la $t4, label_66_v11
sw $t5,0($t4)
# Original instruction: sw v11,0(v10)
la $t5, label_66_v11
lw $t5,0($t5)
la $t4, label_65_v10
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: beq v11,$zero,label_16_else
la $t5, label_66_v11
lw $t5,0($t5)
beq $t5,$zero,label_16_else
# return statement
# Original instruction: addi v13,$fp,4
addi $t5,$fp,4
la $t4, label_70_v13
sw $t5,0($t4)
# Original instruction: addi v13,v13,0
la $t4, label_70_v13
lw $t4,0($t4)
addi $t4,$t4,0
la $t3, label_70_v13
sw $t4,0($t3)
# Original instruction: lw v12,0(v13)
la $t5, label_70_v13
lw $t5,0($t5)
lw $t4,0($t5)
la $t3, label_72_v12
sw $t4,0($t3)
# Original instruction: sw v12,8($fp)
la $t5, label_72_v12
lw $t5,0($t5)
sw $t5,8($fp)
# Original instruction: j label_17_end
j label_17_end
label_16_else:
# else:
# return statement
# Original instruction: li v14,0
li $t5,0
la $t4, label_75_v14
sw $t5,0($t4)
# Original instruction: li v16,1
li $t5,1
la $t4, label_76_v16
sw $t5,0($t4)
# Original instruction: sub v15,v14,v16
la $t5, label_75_v14
lw $t5,0($t5)
la $t4, label_76_v16
lw $t4,0($t4)
sub $t3,$t5,$t4
la $t2, label_78_v15
sw $t3,0($t2)
# Original instruction: sw v15,8($fp)
la $t5, label_78_v15
lw $t5,0($t5)
sw $t5,8($fp)
label_17_end:
label_15_end:
# restore saved registers from stack
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_39_v5
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_30_v1
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_31_v0
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_75_v14
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_51_v6
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_43_v4
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_65_v10
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_76_v16
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_70_v13
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_35_v3
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_50_v7
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_78_v15
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_57_v8
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_66_v11
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_55_v9
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_38_v2
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_72_v12
sw $t0,0($t1)
# restore stack pointer
# Original instruction: addi $sp,$sp,28
addi $sp,$sp,28
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# jump to return address
# Original instruction: jr $ra
jr $ra

.data
# Allocated labels for virtual registers
label_124_v26:
.space 4
label_100_v22:
.space 4
label_153_v28:
.space 4
label_95_v19:
.space 4
label_152_v32:
.space 4
label_88_v18:
.space 4
label_89_v17:
.space 4
label_127_v23:
.space 4
label_94_v20:
.space 4
label_109_v25:
.space 4
label_171_v40:
.space 4
label_101_v21:
.space 4
label_179_v38:
.space 4
label_165_v33:
.space 4
label_177_v39:
.space 4
label_161_v36:
.space 4
label_167_v37:
.space 4
label_150_v31:
.space 4
label_126_v27:
.space 4
label_163_v34:
.space 4
label_157_v35:
.space 4
label_175_v41:
.space 4
label_105_v24:
.space 4
label_131_v29:
.space 4
label_135_v30:
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
# Original instruction: addi $sp,$sp,-12
addi $sp,$sp,-12
# Original instruction: addi $sp,$sp,-120
addi $sp,$sp,-120
# Original instruction: addi $sp,$sp,-120
addi $sp,$sp,-120
# Original instruction: addi $sp,$sp,-240
addi $sp,$sp,-240
# body of main:
# Original instruction: addi v17,$fp,4
addi $t5,$fp,4
la $t4, label_89_v17
sw $t5,0($t4)
# Original instruction: addi v17,v17,0
la $t4, label_89_v17
lw $t4,0($t4)
addi $t4,$t4,0
la $t3, label_89_v17
sw $t4,0($t3)
# Original instruction: li v18,10
li $t5,10
la $t4, label_88_v18
sw $t5,0($t4)
# Original instruction: sw v18,0(v17)
la $t5, label_88_v18
lw $t5,0($t5)
la $t4, label_89_v17
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: addi v19,$fp,-8
addi $t5,$fp,-8
la $t4, label_95_v19
sw $t5,0($t4)
# Original instruction: addi v19,v19,116
la $t4, label_95_v19
lw $t4,0($t4)
addi $t4,$t4,116
la $t3, label_95_v19
sw $t4,0($t3)
# Original instruction: li v20,2000
li $t5,2000
la $t4, label_94_v20
sw $t5,0($t4)
# Original instruction: sw v20,0(v19)
la $t5, label_94_v20
lw $t5,0($t5)
la $t4, label_95_v19
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: addi v21,$fp,-128
addi $t5,$fp,-128
la $t4, label_101_v21
sw $t5,0($t4)
# Original instruction: addi v21,v21,116
la $t4, label_101_v21
lw $t4,0($t4)
addi $t4,$t4,116
la $t3, label_101_v21
sw $t4,0($t3)
# Original instruction: li v22,1934
li $t5,1934
la $t4, label_100_v22
sw $t5,0($t4)
# Original instruction: sw v22,0(v21)
la $t5, label_100_v22
lw $t5,0($t5)
la $t4, label_101_v21
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: addi v23,$fp,-248
addi $t5,$fp,-248
la $t4, label_127_v23
sw $t5,0($t4)
# Original instruction: li v25,0
li $t5,0
la $t4, label_109_v25
sw $t5,0($t4)
# Original instruction: li v24,120
li $t5,120
la $t4, label_105_v24
sw $t5,0($t4)
# Original instruction: mul v25,v24,v25
la $t5, label_105_v24
lw $t5,0($t5)
la $t3, label_109_v25
lw $t3,0($t3)
mul $t3,$t5,$t3
la $t2, label_109_v25
sw $t3,0($t2)
# Original instruction: add v23,v23,v25
la $t3, label_127_v23
lw $t3,0($t3)
la $t4, label_109_v25
lw $t4,0($t4)
add $t3,$t3,$t4
la $t2, label_127_v23
sw $t3,0($t2)
# Original instruction: addi v26,$fp,-8
addi $t5,$fp,-8
la $t4, label_124_v26
sw $t5,0($t4)
# Original instruction: lw v27,0(v26)
la $t5, label_124_v26
lw $t5,0($t5)
lw $t4,0($t5)
la $t3, label_126_v27
sw $t4,0($t3)
# Original instruction: sw v27,0(v23)
la $t5, label_126_v27
lw $t5,0($t5)
la $t4, label_127_v23
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: lw v27,52(v26)
la $t5, label_124_v26
lw $t5,0($t5)
lw $t4,52($t5)
la $t3, label_126_v27
sw $t4,0($t3)
# Original instruction: sw v27,52(v23)
la $t5, label_126_v27
lw $t5,0($t5)
la $t4, label_127_v23
lw $t4,0($t4)
sw $t5,52($t4)
# Original instruction: lw v27,104(v26)
la $t5, label_124_v26
lw $t5,0($t5)
lw $t4,104($t5)
la $t3, label_126_v27
sw $t4,0($t3)
# Original instruction: sw v27,104(v23)
la $t5, label_126_v27
lw $t5,0($t5)
la $t4, label_127_v23
lw $t4,0($t4)
sw $t5,104($t4)
# Original instruction: lw v27,116(v26)
la $t5, label_124_v26
lw $t5,0($t5)
lw $t4,116($t5)
la $t3, label_126_v27
sw $t4,0($t3)
# Original instruction: sw v27,116(v23)
la $t5, label_126_v27
lw $t5,0($t5)
la $t4, label_127_v23
lw $t4,0($t4)
sw $t5,116($t4)
# Original instruction: addi v28,$fp,-248
addi $t5,$fp,-248
la $t4, label_153_v28
sw $t5,0($t4)
# Original instruction: li v30,1
li $t5,1
la $t4, label_135_v30
sw $t5,0($t4)
# Original instruction: li v29,120
li $t5,120
la $t4, label_131_v29
sw $t5,0($t4)
# Original instruction: mul v30,v29,v30
la $t5, label_131_v29
lw $t5,0($t5)
la $t3, label_135_v30
lw $t3,0($t3)
mul $t3,$t5,$t3
la $t2, label_135_v30
sw $t3,0($t2)
# Original instruction: add v28,v28,v30
la $t3, label_153_v28
lw $t3,0($t3)
la $t4, label_135_v30
lw $t4,0($t4)
add $t3,$t3,$t4
la $t2, label_153_v28
sw $t3,0($t2)
# Original instruction: addi v31,$fp,-128
addi $t5,$fp,-128
la $t4, label_150_v31
sw $t5,0($t4)
# Original instruction: lw v32,0(v31)
la $t5, label_150_v31
lw $t5,0($t5)
lw $t4,0($t5)
la $t3, label_152_v32
sw $t4,0($t3)
# Original instruction: sw v32,0(v28)
la $t5, label_152_v32
lw $t5,0($t5)
la $t4, label_153_v28
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: lw v32,52(v31)
la $t5, label_150_v31
lw $t5,0($t5)
lw $t4,52($t5)
la $t3, label_152_v32
sw $t4,0($t3)
# Original instruction: sw v32,52(v28)
la $t5, label_152_v32
lw $t5,0($t5)
la $t4, label_153_v28
lw $t4,0($t4)
sw $t5,52($t4)
# Original instruction: lw v32,104(v31)
la $t5, label_150_v31
lw $t5,0($t5)
lw $t4,104($t5)
la $t3, label_152_v32
sw $t4,0($t3)
# Original instruction: sw v32,104(v28)
la $t5, label_152_v32
lw $t5,0($t5)
la $t4, label_153_v28
lw $t4,0($t4)
sw $t5,104($t4)
# Original instruction: lw v32,116(v31)
la $t5, label_150_v31
lw $t5,0($t5)
lw $t4,116($t5)
la $t3, label_152_v32
sw $t4,0($t3)
# Original instruction: sw v32,116(v28)
la $t5, label_152_v32
lw $t5,0($t5)
la $t4, label_153_v28
lw $t4,0($t4)
sw $t5,116($t4)
# Original instruction: addi v34,$fp,-248
addi $t5,$fp,-248
la $t4, label_163_v34
sw $t5,0($t4)
# Original instruction: li v36,0
li $t5,0
la $t4, label_161_v36
sw $t5,0($t4)
# Original instruction: li v35,120
li $t5,120
la $t4, label_157_v35
sw $t5,0($t4)
# Original instruction: mul v36,v35,v36
la $t5, label_157_v35
lw $t5,0($t5)
la $t3, label_161_v36
lw $t3,0($t3)
mul $t3,$t5,$t3
la $t2, label_161_v36
sw $t3,0($t2)
# Original instruction: add v34,v34,v36
la $t3, label_163_v34
lw $t3,0($t3)
la $t4, label_161_v36
lw $t4,0($t4)
add $t3,$t3,$t4
la $t2, label_163_v34
sw $t3,0($t2)
# Original instruction: lw v33,116(v34)
la $t5, label_163_v34
lw $t5,0($t5)
lw $t4,116($t5)
la $t3, label_165_v33
sw $t4,0($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v33,0($sp)
la $t5, label_165_v33
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
# Original instruction: li v37,10
li $t5,10
la $t4, label_167_v37
sw $t5,0($t4)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v37,0($sp)
la $t5, label_167_v37
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
# Original instruction: addi v39,$fp,-248
addi $t5,$fp,-248
la $t4, label_177_v39
sw $t5,0($t4)
# Original instruction: li v41,1
li $t5,1
la $t4, label_175_v41
sw $t5,0($t4)
# Original instruction: li v40,120
li $t5,120
la $t4, label_171_v40
sw $t5,0($t4)
# Original instruction: mul v41,v40,v41
la $t5, label_171_v40
lw $t5,0($t5)
la $t3, label_175_v41
lw $t3,0($t3)
mul $t3,$t5,$t3
la $t2, label_175_v41
sw $t3,0($t2)
# Original instruction: add v39,v39,v41
la $t3, label_177_v39
lw $t3,0($t3)
la $t4, label_175_v41
lw $t4,0($t4)
add $t3,$t3,$t4
la $t2, label_177_v39
sw $t3,0($t2)
# Original instruction: lw v38,116(v39)
la $t5, label_177_v39
lw $t5,0($t5)
lw $t4,116($t5)
la $t3, label_179_v38
sw $t4,0($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v38,0($sp)
la $t5, label_179_v38
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
# restore stack pointer
# Original instruction: addi $sp,$sp,496
addi $sp,$sp,496
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# ending program
# Original instruction: li $v0,10
li $v0,10
# Original instruction: syscall
syscall

