.data
label_0_Course:
.space 20
label_7_VirtualCourse:
.space 0
label_8_VirtualLabCourse:
.space 4

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
# Original instruction: la v4, label_1_editCredit
la $s7, label_1_editCredit
# Original instruction: la v5, label_0_Course
la $t3, label_0_Course
# Original instruction: sw v4,0(v5)
sw $s7,0($t3)
# Original instruction: la v7, label_2_getCredits
la $s7, label_2_getCredits
# Original instruction: la v8, label_0_Course
la $t3, label_0_Course
# Original instruction: sw v7,4(v8)
sw $s7,4($t3)
# Original instruction: la v10, label_3_whereToAttend
la $t3, label_3_whereToAttend
# Original instruction: la v11, label_0_Course
la $s7, label_0_Course
# Original instruction: sw v10,8(v11)
sw $t3,8($s7)
# Original instruction: la v17, label_5_hasExam
la $t3, label_5_hasExam
# Original instruction: la v18, label_0_Course
la $s7, label_0_Course
# Original instruction: sw v17,12(v18)
sw $t3,12($s7)
# Original instruction: la v21, label_6_setExam
la $s7, label_6_setExam
# Original instruction: la v22, label_0_Course
la $t3, label_0_Course
# Original instruction: sw v21,16(v22)
sw $s7,16($t3)
# Original instruction: la v23, label_0_Course
la $t3, label_0_Course
# Original instruction: la v24, label_1_editCredit
la $s7, label_1_editCredit
# Original instruction: sw v24,0(v23)
sw $s7,0($t3)

.data

.text
label_1_editCredit:
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
sw $t3,0($sp)
addi $sp,$sp,-4
sw $s7,0($sp)
addi $sp,$sp,-4
sw $t3,0($sp)
# body of editCredit:
# Original instruction: addi v0,$fp,4
addi $s7,$fp,4
# Original instruction: la v1, label_0_Course
la $t3, label_0_Course
# Original instruction: lw v1,0(v1)
lw $t3,0($t3)
# Original instruction: sw v1,0(v0)
sw $t3,0($s7)
# Original instruction: lw v0,0(v0)
lw $s7,0($s7)
# Original instruction: la v2, label_0_Course
la $s7, label_0_Course
# Original instruction: lw v3,8($fp)
lw $t3,8($fp)
# Original instruction: sw v3,0(v2)
sw $t3,0($s7)
# Original instruction: lw v2,0(v2)
lw $s7,0($s7)
# restore saved registers from stack
# Original instruction: popRegisters
lw $t3,0($sp)
addi $sp,$sp,4
lw $s7,0($sp)
addi $sp,$sp,4
lw $t3,0($sp)
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
label_2_getCredits:
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
# body of getCredits:
# return statement
# Original instruction: la v6, label_0_Course
la $t3, label_0_Course
# Original instruction: lw v6,0(v6)
lw $t3,0($t3)
# Original instruction: sw v6,8($fp)
sw $t3,8($fp)
# restore saved registers from stack
# Original instruction: popRegisters
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
label_4_whereToAttend_str:
.asciiz "Not determined! The course will be held virtually or in person!\n"
label_24_label_4_whereToAttend_str_pad:
.space 3

.data

.text
label_3_whereToAttend:
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
# body of whereToAttend:
# Original instruction: la v9, label_4_whereToAttend_str
la $t3, label_4_whereToAttend_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v9,0($sp)
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
label_5_hasExam:
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
# body of hasExam:
# if BinOp(VarExpr(courseWorkScore),EQ,IntLiteral(100)) then
# Original instruction: la v12, label_0_Course
la $t3, label_0_Course
# Original instruction: lw v12,0(v12)
lw $t3,0($t3)
# Original instruction: li v14,100
li $s7,100
# Original instruction: xor v13,v12,v14
xor $t3,$t3,$s7
# Original instruction: sltiu v13,v13,1
sltiu $t3,$t3,1
# Original instruction: beq v13,$zero,label_25_else
beq $t3,$zero,label_25_else
# return statement
# Original instruction: li v15,0
li $t3,0
# Original instruction: sw v15,8($fp)
sw $t3,8($fp)
# Original instruction: j label_26_end
j label_26_end
label_25_else:
# else:
# return statement
# Original instruction: li v16,1
li $t3,1
# Original instruction: sw v16,8($fp)
sw $t3,8($fp)
label_26_end:
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
label_6_setExam:
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
sw $s7,0($sp)
# body of setExam:
# Original instruction: la v19, label_0_Course
la $t3, label_0_Course
# Original instruction: li v20,100
li $s7,100
# Original instruction: sw v20,0(v19)
sw $s7,0($t3)
# Original instruction: lw v19,0(v19)
lw $t3,0($t3)
# restore saved registers from stack
# Original instruction: popRegisters
lw $s7,0($sp)
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

.data

.text
# Original instruction: la v26, label_9_whereToAttend
la $t3, label_9_whereToAttend
# Original instruction: la v27, label_8_VirtualLabCourse
la $s7, label_8_VirtualLabCourse
# Original instruction: sw v26,8(v27)
sw $t3,8($s7)
# Original instruction: la v28, label_8_VirtualLabCourse
la $t3, label_8_VirtualLabCourse
# Original instruction: la v29, label_1_editCredit
la $s7, label_1_editCredit
# Original instruction: sw v29,0(v28)
sw $s7,0($t3)

.data
label_10_whereToAttend_str:
.asciiz "Class labs are held online\n"

.data

.text
label_9_whereToAttend:
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
# body of whereToAttend:
# Original instruction: la v25, label_10_whereToAttend_str
la $t3, label_10_whereToAttend_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v25,0($sp)
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
label_11_changeCourseCredit_str:
.asciiz "Class: course credit has been changed to "
label_27_label_11_changeCourseCredit_str_pad:
.space 2

.data

.text
changeCourseCredit:
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
sw $s7,0($sp)
# body of changeCourseCredit:
# Original instruction: addi v30,$fp,40
addi $s7,$fp,40
# Original instruction: addi v30,v30,24
addi $s7,$s7,24
# Original instruction: lw v31,8($fp)
lw $t3,8($fp)
# Original instruction: sw v31,0(v30)
sw $t3,0($s7)
# Original instruction: lw v30,0(v30)
lw $s7,0($s7)
# Original instruction: la v32, label_11_changeCourseCredit_str
la $t3, label_11_changeCourseCredit_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v32,0($sp)
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
# Original instruction: addi v34,$fp,40
addi $t3,$fp,40
# Original instruction: lw v33,24(v34)
lw $t3,24($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v33,0($sp)
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
# Original instruction: li v35,10
li $t3,10
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v35,0($sp)
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
label_12_main_str:
.asciiz "http://link.com"
label_13_main_str:
.asciiz "Comp520 has exam\n"
label_29_label_13_main_str_pad:
.space 2
label_14_main_str:
.asciiz "Comp520 does not have\n"
label_30_label_14_main_str_pad:
.space 1
label_15_main_str:
.asciiz "Correct"
label_16_main_str:
.asciiz "Correct"

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
# Original instruction: addi $sp,$sp,-32
addi $sp,$sp,-32
# Original instruction: addi $sp,$sp,-8
addi $sp,$sp,-8
# Original instruction: addi $sp,$sp,-8
addi $sp,$sp,-8
# Original instruction: addi $sp,$sp,-32
addi $sp,$sp,-32
# Original instruction: addi $sp,$sp,-32
addi $sp,$sp,-32
# Original instruction: addi $sp,$sp,-32
addi $sp,$sp,-32
# body of main:
# Original instruction: addi v36,$fp,4
addi $t3,$fp,4
# Original instruction: lw v36,0(v36)
lw $t3,0($t3)
# Original instruction: addi v37,$fp,-28
addi $t3,$fp,-28
# Original instruction: lw v37,0(v37)
lw $t3,0($t3)
# Original instruction: addi v38,$fp,-36
addi $t3,$fp,-36
# Original instruction: lw v38,0(v38)
lw $t3,0($t3)
# Original instruction: addi v39,$fp,4
addi $s7,$fp,4
# Original instruction: addi v39,v39,24
addi $s7,$s7,24
# Original instruction: li v40,4
li $t3,4
# Original instruction: sw v40,0(v39)
sw $t3,0($s7)
# Original instruction: lw v39,0(v39)
lw $s7,0($s7)
# Original instruction: addi v41,$fp,-28
addi $s7,$fp,-28
# Original instruction: addi v41,v41,24
addi $s7,$s7,24
# Original instruction: li v42,3
li $t3,3
# Original instruction: sw v42,0(v41)
sw $t3,0($s7)
# Original instruction: lw v41,0(v41)
lw $s7,0($s7)
# Original instruction: addi v43,$fp,-28
addi $s7,$fp,-28
# Original instruction: addi v43,v43,32
addi $s7,$s7,32
# Original instruction: la v44, label_12_main_str
la $t3, label_12_main_str
# Original instruction: sw v44,0(v43)
sw $t3,0($s7)
# Original instruction: lw v43,0(v43)
lw $s7,0($s7)
# Original instruction: addi v45,$fp,-36
addi $s7,$fp,-36
# Original instruction: addi v45,v45,36
addi $s7,$s7,36
# Original instruction: li v46,2
li $t3,2
# Original instruction: sw v46,0(v45)
sw $t3,0($s7)
# Original instruction: lw v45,0(v45)
lw $s7,0($s7)
# Original instruction: addi v47,$fp,-36
addi $t3,$fp,-36
# Original instruction: addi v47,v47,24
addi $t3,$t3,24
# Original instruction: li v48,5
li $s7,5
# Original instruction: sw v48,0(v47)
sw $s7,0($t3)
# Original instruction: lw v47,0(v47)
lw $t3,0($t3)
# Original instruction: addi v50,$fp,4
addi $t3,$fp,4
# Original instruction: lw v49,24(v50)
lw $t3,24($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v49,0($sp)
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
# Original instruction: li v51,10
li $t3,10
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v51,0($sp)
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
# Original instruction: addi v53,$fp,-28
addi $t3,$fp,-28
# Original instruction: lw v52,24(v53)
lw $t3,24($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v52,0($sp)
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
# Original instruction: li v54,10
li $t3,10
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v54,0($sp)
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
# Original instruction: addi v56,$fp,-28
addi $t3,$fp,-28
# Original instruction: lw v55,32(v56)
lw $t3,32($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v55,0($sp)
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
# Original instruction: li v57,10
li $t3,10
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v57,0($sp)
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
# Original instruction: addi v59,$fp,-36
addi $t3,$fp,-36
# Original instruction: lw v58,24(v59)
lw $t3,24($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v58,0($sp)
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
# Original instruction: li v60,10
li $t3,10
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v60,0($sp)
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
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: la v61, label_9_whereToAttend
la $t3, label_9_whereToAttend
# Original instruction: jalr v61
jalr $t3
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: la v62, label_9_whereToAttend
la $t3, label_9_whereToAttend
# Original instruction: jalr v62
jalr $t3
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# Original instruction: li v63,10
li $t3,10
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v63,0($sp)
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
# Original instruction: li v64,1
li $t3,1
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v64,0($sp)
sw $t3,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: la v65, label_1_editCredit
la $t3, label_1_editCredit
# Original instruction: jalr v65
jalr $t3
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: li v66,10
li $t3,10
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v66,0($sp)
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
# Original instruction: addi v68,$fp,4
addi $t3,$fp,4
# Original instruction: lw v67,24(v68)
lw $t3,24($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v67,0($sp)
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
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: la v69, label_2_getCredits
la $t3, label_2_getCredits
# Original instruction: jalr v69
jalr $t3
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lw v70,4($sp)
lw $t3,4($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v70,0($sp)
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
# Original instruction: li v71,10
li $t3,10
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v71,0($sp)
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
# Original instruction: addi v72,$fp,4
addi $s7,$fp,4
# Original instruction: addi v72,v72,28
addi $s7,$s7,28
# Original instruction: li v73,100
li $t3,100
# Original instruction: sw v73,0(v72)
sw $t3,0($s7)
# Original instruction: lw v72,0(v72)
lw $s7,0($s7)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: la v74, label_6_setExam
la $t3, label_6_setExam
# Original instruction: jalr v74
jalr $t3
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# if ClassFunCallExpr(VarExpr(comp520),FunCallExpr(hasExam,ArrayBuffer())) then
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: la v75, label_5_hasExam
la $t3, label_5_hasExam
# Original instruction: jalr v75
jalr $t3
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: lw v76,4($sp)
lw $t3,4($sp)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Original instruction: beq v76,$zero,label_31_else
beq $t3,$zero,label_31_else
# Original instruction: la v77, label_13_main_str
la $t3, label_13_main_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v77,0($sp)
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
# Original instruction: j label_32_end
j label_32_end
label_31_else:
# else:
# Original instruction: la v78, label_14_main_str
la $t3, label_14_main_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v78,0($sp)
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
label_32_end:
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: la v79, label_9_whereToAttend
la $t3, label_9_whereToAttend
# Original instruction: jalr v79
jalr $t3
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# Original instruction: lw v80,4($fp)
lw $t3,4($fp)
# Original instruction: addi $sp,$sp,-32
addi $sp,$sp,-32
# Original instruction: sw v80,0($sp)
sw $t3,0($sp)
# Original instruction: li v81,10
li $t3,10
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v81,0($sp)
sw $t3,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: jal changeCourseCredit
jal changeCourseCredit
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,40
addi $sp,$sp,40
# Original instruction: addi v83,$fp,4
addi $t3,$fp,4
# Original instruction: lw v82,24(v83)
lw $t3,24($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v82,0($sp)
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
# Original instruction: li v84,10
li $t3,10
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v84,0($sp)
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
# Original instruction: addi v85,$fp,-44
addi $t3,$fp,-44
# Original instruction: addi v86,$fp,-36
addi $s7,$fp,-36
# Original instruction: la v87, label_0_Course
la $s3, label_0_Course
# Original instruction: sw v87,0(v85)
sw $s3,0($t3)
# Original instruction: lw v87,4(v86)
lw $s3,4($s7)
# Original instruction: sw v87,4(v85)
sw $s3,4($t3)
# Original instruction: lw v87,24(v86)
lw $s3,24($s7)
# Original instruction: sw v87,24(v85)
sw $s3,24($t3)
# Original instruction: lw v87,28(v86)
lw $s3,28($s7)
# Original instruction: sw v87,28(v85)
sw $s3,28($t3)
# Original instruction: lw v85,0(v85)
lw $t3,0($t3)
# Original instruction: addi v89,$fp,-44
addi $t3,$fp,-44
# Original instruction: lw v88,24(v89)
lw $t3,24($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v88,0($sp)
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
# Original instruction: li v90,10
li $t3,10
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v90,0($sp)
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
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $ra,0($sp)
sw $ra,0($sp)
# Original instruction: la v91, label_9_whereToAttend
la $t3, label_9_whereToAttend
# Original instruction: jalr v91
jalr $t3
# Original instruction: lw $ra,0($sp)
lw $ra,0($sp)
# Original instruction: addi $sp,$sp,4
addi $sp,$sp,4
# Original instruction: addi v92,$fp,-76
addi $s7,$fp,-76
# Original instruction: addi v92,v92,24
addi $s7,$s7,24
# Original instruction: li v93,9
li $t3,9
# Original instruction: sw v93,0(v92)
sw $t3,0($s7)
# Original instruction: lw v92,0(v92)
lw $s7,0($s7)
# Original instruction: addi v94,$fp,-76
addi $t3,$fp,-76
# Original instruction: addi v94,v94,28
addi $t3,$t3,28
# Original instruction: li v95,5
li $s7,5
# Original instruction: sw v95,0(v94)
sw $s7,0($t3)
# Original instruction: lw v94,0(v94)
lw $t3,0($t3)
# Original instruction: addi v96,$fp,-108
addi $t3,$fp,-108
# Original instruction: addi v96,v96,24
addi $t3,$t3,24
# Original instruction: li v97,9
li $s7,9
# Original instruction: sw v97,0(v96)
sw $s7,0($t3)
# Original instruction: lw v96,0(v96)
lw $t3,0($t3)
# Original instruction: addi v98,$fp,-108
addi $t3,$fp,-108
# Original instruction: addi v98,v98,28
addi $t3,$t3,28
# Original instruction: li v99,5
li $s7,5
# Original instruction: sw v99,0(v98)
sw $s7,0($t3)
# Original instruction: lw v98,0(v98)
lw $t3,0($t3)
# if BinOp(VarExpr(c1),EQ,VarExpr(c2)) then
# Original instruction: lw v100,-76($fp)
lw $s7,-76($fp)
# Original instruction: lw v102,-108($fp)
lw $t3,-108($fp)
# Original instruction: xor v101,v100,v102
xor $t3,$s7,$t3
# Original instruction: sltiu v101,v101,1
sltiu $t3,$t3,1
# Original instruction: beq v101,$zero,label_33_else
beq $t3,$zero,label_33_else
# Original instruction: la v103, label_15_main_str
la $t3, label_15_main_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v103,0($sp)
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
# Original instruction: j label_34_end
j label_34_end
label_33_else:
label_34_end:
# if BinOp(VarExpr(c1),NE,VarExpr(comp520)) then
# Original instruction: lw v104,-76($fp)
lw $t3,-76($fp)
# Original instruction: lw v106,4($fp)
lw $s7,4($fp)
# Original instruction: xor v105,v104,v106
xor $t3,$t3,$s7
# Original instruction: sltu v105,$zero,v105
sltu $t3,$zero,$t3
# Original instruction: beq v105,$zero,label_35_else
beq $t3,$zero,label_35_else
# Original instruction: la v107, label_16_main_str
la $t3, label_16_main_str
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v107,0($sp)
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
# Original instruction: j label_36_end
j label_36_end
label_35_else:
label_36_end:
# Original instruction: li v108,10
li $t3,10
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v108,0($sp)
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
# Original instruction: li v109,4
li $t3,4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v109,0($sp)
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
# Original instruction: addi $sp,$sp,148
addi $sp,$sp,148
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# ending program
# Original instruction: li $v0,10
li $v0,10
# Original instruction: syscall
syscall

