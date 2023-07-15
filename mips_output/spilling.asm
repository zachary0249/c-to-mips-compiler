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
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
addi $sp,$sp,-4
# body of main:
addi v0,$fp,4
li v1,1
sw v1,0(v0)
lw v0,0(v0)
addi v2,$fp,0
li v3,2
sw v3,0(v2)
lw v2,0(v2)
addi v4,$fp,-4
li v5,3
sw v5,0(v4)
lw v4,0(v4)
addi v6,$fp,-8
li v7,5
sw v7,0(v6)
lw v6,0(v6)
addi v8,$fp,-12
li v9,6
sw v9,0(v8)
lw v8,0(v8)
addi v10,$fp,-16
li v11,7
sw v11,0(v10)
lw v10,0(v10)
addi v12,$fp,-20
li v13,8
sw v13,0(v12)
lw v12,0(v12)
addi v14,$fp,-24
li v15,9
sw v15,0(v14)
lw v14,0(v14)
addi v16,$fp,-28
li v17,10
sw v17,0(v16)
lw v16,0(v16)
addi v18,$fp,-32
li v19,11
sw v19,0(v18)
lw v18,0(v18)
addi v20,$fp,-36
li v21,12
sw v21,0(v20)
lw v20,0(v20)
addi v22,$fp,-40
li v23,13
sw v23,0(v22)
lw v22,0(v22)
addi v24,$fp,-44
li v25,14
sw v25,0(v24)
lw v24,0(v24)
addi v26,$fp,-48
li v27,15
sw v27,0(v26)
lw v26,0(v26)
addi v28,$fp,-52
li v29,16
sw v29,0(v28)
lw v28,0(v28)
addi v30,$fp,-56
li v31,17
sw v31,0(v30)
lw v30,0(v30)
addi v32,$fp,-60
li v33,18
sw v33,0(v32)
lw v32,0(v32)
addi v34,$fp,-64
li v35,19
sw v35,0(v34)
lw v34,0(v34)
addi v36,$fp,-68
li v37,20
sw v37,0(v36)
lw v36,0(v36)
addi v38,$fp,-72
li v39,21
sw v39,0(v38)
lw v38,0(v38)
addi v40,$fp,-76
li v41,22
sw v41,0(v40)
lw v40,0(v40)
addi v42,$fp,-80
li v43,23
sw v43,0(v42)
lw v42,0(v42)
addi v44,$fp,-84
li v45,24
sw v45,0(v44)
lw v44,0(v44)
addi v46,$fp,-88
li v47,25
sw v47,0(v46)
lw v46,0(v46)
addi v48,$fp,-92
li v49,26
sw v49,0(v48)
lw v48,0(v48)
addi v50,$fp,-96
li v51,27
sw v51,0(v50)
lw v50,0(v50)
lw v52,4($fp)
addi $sp,$sp,-4
sw v52,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v53,0($fp)
addi $sp,$sp,-4
sw v53,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v54,-4($fp)
addi $sp,$sp,-4
sw v54,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v55,-8($fp)
addi $sp,$sp,-4
sw v55,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v56,-12($fp)
addi $sp,$sp,-4
sw v56,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v57,-16($fp)
addi $sp,$sp,-4
sw v57,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v58,-20($fp)
addi $sp,$sp,-4
sw v58,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v59,-24($fp)
addi $sp,$sp,-4
sw v59,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v60,-28($fp)
addi $sp,$sp,-4
sw v60,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v61,-32($fp)
addi $sp,$sp,-4
sw v61,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v62,-36($fp)
addi $sp,$sp,-4
sw v62,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v63,-40($fp)
addi $sp,$sp,-4
sw v63,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v64,-44($fp)
addi $sp,$sp,-4
sw v64,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v65,-48($fp)
addi $sp,$sp,-4
sw v65,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v66,-52($fp)
addi $sp,$sp,-4
sw v66,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v67,-56($fp)
addi $sp,$sp,-4
sw v67,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v68,-60($fp)
addi $sp,$sp,-4
sw v68,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v69,-64($fp)
addi $sp,$sp,-4
sw v69,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v70,-68($fp)
addi $sp,$sp,-4
sw v70,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v71,-72($fp)
addi $sp,$sp,-4
sw v71,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v72,-76($fp)
addi $sp,$sp,-4
sw v72,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v73,-80($fp)
addi $sp,$sp,-4
sw v73,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v74,-84($fp)
addi $sp,$sp,-4
sw v74,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v75,-88($fp)
addi $sp,$sp,-4
sw v75,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v76,-92($fp)
addi $sp,$sp,-4
sw v76,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
lw v77,-96($fp)
addi $sp,$sp,-4
sw v77,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
# restore stack pointer
addi $sp,$sp,108
# restore frame pointer from stack
lw $fp,0($fp)
# ending program
li $v0,10
syscall

