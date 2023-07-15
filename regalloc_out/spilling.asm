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
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# body of main:
# Original instruction: addi v0,$fp,4
addi $t4,$fp,4
# Original instruction: li v1,1
li $t3,1
# Original instruction: sw v1,0(v0)
sw $t3,0($t4)
# Original instruction: lw v0,0(v0)
lw $t4,0($t4)
# Original instruction: addi v2,$fp,0
addi $t4,$fp,0
# Original instruction: li v3,2
li $t3,2
# Original instruction: sw v3,0(v2)
sw $t3,0($t4)
# Original instruction: lw v2,0(v2)
lw $t4,0($t4)
# Original instruction: addi v4,$fp,-4
addi $t4,$fp,-4
# Original instruction: li v5,3
li $t3,3
# Original instruction: sw v5,0(v4)
sw $t3,0($t4)
# Original instruction: lw v4,0(v4)
lw $t4,0($t4)
# Original instruction: addi v6,$fp,-8
addi $t4,$fp,-8
# Original instruction: li v7,5
li $t3,5
# Original instruction: sw v7,0(v6)
sw $t3,0($t4)
# Original instruction: lw v6,0(v6)
lw $t4,0($t4)
# Original instruction: addi v8,$fp,-12
addi $t4,$fp,-12
# Original instruction: li v9,6
li $t3,6
# Original instruction: sw v9,0(v8)
sw $t3,0($t4)
# Original instruction: lw v8,0(v8)
lw $t4,0($t4)
# Original instruction: addi v10,$fp,-16
addi $t4,$fp,-16
# Original instruction: li v11,7
li $t3,7
# Original instruction: sw v11,0(v10)
sw $t3,0($t4)
# Original instruction: lw v10,0(v10)
lw $t4,0($t4)
# Original instruction: addi v12,$fp,-20
addi $t4,$fp,-20
# Original instruction: li v13,8
li $t3,8
# Original instruction: sw v13,0(v12)
sw $t3,0($t4)
# Original instruction: lw v12,0(v12)
lw $t4,0($t4)
# Original instruction: addi v14,$fp,-24
addi $t4,$fp,-24
# Original instruction: li v15,9
li $t3,9
# Original instruction: sw v15,0(v14)
sw $t3,0($t4)
# Original instruction: lw v14,0(v14)
lw $t4,0($t4)
# Original instruction: addi v16,$fp,-28
addi $t4,$fp,-28
# Original instruction: li v17,10
li $t3,10
# Original instruction: sw v17,0(v16)
sw $t3,0($t4)
# Original instruction: lw v16,0(v16)
lw $t4,0($t4)
# Original instruction: addi v18,$fp,-32
addi $t4,$fp,-32
# Original instruction: li v19,11
li $t3,11
# Original instruction: sw v19,0(v18)
sw $t3,0($t4)
# Original instruction: lw v18,0(v18)
lw $t4,0($t4)
# Original instruction: addi v20,$fp,-36
addi $t4,$fp,-36
# Original instruction: li v21,12
li $t3,12
# Original instruction: sw v21,0(v20)
sw $t3,0($t4)
# Original instruction: lw v20,0(v20)
lw $t4,0($t4)
# Original instruction: addi v22,$fp,-40
addi $t4,$fp,-40
# Original instruction: li v23,13
li $t3,13
# Original instruction: sw v23,0(v22)
sw $t3,0($t4)
# Original instruction: lw v22,0(v22)
lw $t4,0($t4)
# Original instruction: addi v24,$fp,-44
addi $t4,$fp,-44
# Original instruction: li v25,14
li $t3,14
# Original instruction: sw v25,0(v24)
sw $t3,0($t4)
# Original instruction: lw v24,0(v24)
lw $t4,0($t4)
# Original instruction: addi v26,$fp,-48
addi $t4,$fp,-48
# Original instruction: li v27,15
li $t3,15
# Original instruction: sw v27,0(v26)
sw $t3,0($t4)
# Original instruction: lw v26,0(v26)
lw $t4,0($t4)
# Original instruction: addi v28,$fp,-52
addi $t4,$fp,-52
# Original instruction: li v29,16
li $t3,16
# Original instruction: sw v29,0(v28)
sw $t3,0($t4)
# Original instruction: lw v28,0(v28)
lw $t4,0($t4)
# Original instruction: addi v30,$fp,-56
addi $t4,$fp,-56
# Original instruction: li v31,17
li $t3,17
# Original instruction: sw v31,0(v30)
sw $t3,0($t4)
# Original instruction: lw v30,0(v30)
lw $t4,0($t4)
# Original instruction: addi v32,$fp,-60
addi $t4,$fp,-60
# Original instruction: li v33,18
li $t3,18
# Original instruction: sw v33,0(v32)
sw $t3,0($t4)
# Original instruction: lw v32,0(v32)
lw $t4,0($t4)
# Original instruction: addi v34,$fp,-64
addi $t4,$fp,-64
# Original instruction: li v35,19
li $t3,19
# Original instruction: sw v35,0(v34)
sw $t3,0($t4)
# Original instruction: lw v34,0(v34)
lw $t4,0($t4)
# Original instruction: addi v36,$fp,-68
addi $t4,$fp,-68
# Original instruction: li v37,20
li $t3,20
# Original instruction: sw v37,0(v36)
sw $t3,0($t4)
# Original instruction: lw v36,0(v36)
lw $t4,0($t4)
# Original instruction: addi v38,$fp,-72
addi $t4,$fp,-72
# Original instruction: li v39,21
li $t3,21
# Original instruction: sw v39,0(v38)
sw $t3,0($t4)
# Original instruction: lw v38,0(v38)
lw $t4,0($t4)
# Original instruction: addi v40,$fp,-76
addi $t4,$fp,-76
# Original instruction: li v41,22
li $t3,22
# Original instruction: sw v41,0(v40)
sw $t3,0($t4)
# Original instruction: lw v40,0(v40)
lw $t4,0($t4)
# Original instruction: addi v42,$fp,-80
addi $t4,$fp,-80
# Original instruction: li v43,23
li $t3,23
# Original instruction: sw v43,0(v42)
sw $t3,0($t4)
# Original instruction: lw v42,0(v42)
lw $t4,0($t4)
# Original instruction: addi v44,$fp,-84
addi $t4,$fp,-84
# Original instruction: li v45,24
li $t3,24
# Original instruction: sw v45,0(v44)
sw $t3,0($t4)
# Original instruction: lw v44,0(v44)
lw $t4,0($t4)
# Original instruction: addi v46,$fp,-88
addi $t4,$fp,-88
# Original instruction: li v47,25
li $t3,25
# Original instruction: sw v47,0(v46)
sw $t3,0($t4)
# Original instruction: lw v46,0(v46)
lw $t4,0($t4)
# Original instruction: addi v48,$fp,-92
addi $t4,$fp,-92
# Original instruction: li v49,26
li $t3,26
# Original instruction: sw v49,0(v48)
sw $t3,0($t4)
# Original instruction: lw v48,0(v48)
lw $t4,0($t4)
# Original instruction: addi v50,$fp,-96
addi $t4,$fp,-96
# Original instruction: li v51,27
li $t3,27
# Original instruction: sw v51,0(v50)
sw $t3,0($t4)
# Original instruction: lw v50,0(v50)
lw $t4,0($t4)
# Original instruction: lw v52,4($fp)
lw $t3,4($fp)
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
# Original instruction: lw v53,0($fp)
lw $t3,0($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v53,0($sp)
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
# Original instruction: lw v54,-4($fp)
lw $t3,-4($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v54,0($sp)
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
# Original instruction: lw v55,-8($fp)
lw $t3,-8($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v55,0($sp)
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
# Original instruction: lw v56,-12($fp)
lw $t3,-12($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v56,0($sp)
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
# Original instruction: lw v57,-16($fp)
lw $t3,-16($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v57,0($sp)
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
# Original instruction: lw v58,-20($fp)
lw $t3,-20($fp)
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
# Original instruction: lw v59,-24($fp)
lw $t3,-24($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v59,0($sp)
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
# Original instruction: lw v60,-28($fp)
lw $t3,-28($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v60,0($sp)
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
# Original instruction: lw v61,-32($fp)
lw $t3,-32($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v61,0($sp)
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
# Original instruction: lw v62,-36($fp)
lw $t3,-36($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v62,0($sp)
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
# Original instruction: lw v63,-40($fp)
lw $t3,-40($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v63,0($sp)
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
# Original instruction: lw v64,-44($fp)
lw $t3,-44($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v64,0($sp)
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
# Original instruction: lw v65,-48($fp)
lw $t3,-48($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v65,0($sp)
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
# Original instruction: lw v66,-52($fp)
lw $t3,-52($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v66,0($sp)
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
# Original instruction: lw v67,-56($fp)
lw $t3,-56($fp)
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
# Original instruction: lw v68,-60($fp)
lw $t3,-60($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v68,0($sp)
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
# Original instruction: lw v69,-64($fp)
lw $t3,-64($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v69,0($sp)
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
# Original instruction: lw v70,-68($fp)
lw $t3,-68($fp)
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
# Original instruction: lw v71,-72($fp)
lw $t3,-72($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v71,0($sp)
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
# Original instruction: lw v72,-76($fp)
lw $t3,-76($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v72,0($sp)
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
# Original instruction: lw v73,-80($fp)
lw $t3,-80($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v73,0($sp)
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
# Original instruction: lw v74,-84($fp)
lw $t3,-84($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v74,0($sp)
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
# Original instruction: lw v75,-88($fp)
lw $t3,-88($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v75,0($sp)
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
# Original instruction: lw v76,-92($fp)
lw $t3,-92($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v76,0($sp)
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
# Original instruction: lw v77,-96($fp)
lw $t3,-96($fp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v77,0($sp)
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
# Original instruction: addi $sp,$sp,108
addi $sp,$sp,108
# restore frame pointer from stack
# Original instruction: lw $fp,0($fp)
lw $fp,0($fp)
# ending program
# Original instruction: li $v0,10
li $v0,10
# Original instruction: syscall
syscall

