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
label_19_v1:
.space 4
label_22_v0:
.space 4

.text
setAge:
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
la $t0, label_19_v1
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0, label_22_v0
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# body of setAge:
# Original instruction: addi v0,$fp,16
addi $t5,$fp,16
la $t4, label_22_v0
sw $t5,0($t4)
# Original instruction: addi v0,v0,4
la $t4, label_22_v0
lw $t4,0($t4)
addi $t4,$t4,4
la $t3, label_22_v0
sw $t4,0($t3)
# Original instruction: lw v1,20($fp)
lw $t5,20($fp)
la $t4, label_19_v1
sw $t5,0($t4)
# Original instruction: sw v1,0(v0)
la $t5, label_19_v1
lw $t5,0($t5)
la $t4, label_22_v0
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: lw v0,0(v0)
la $t4, label_22_v0
lw $t4,0($t4)
lw $t4,0($t4)
la $t3, label_22_v0
sw $t4,0($t3)
# restore saved registers from stack
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_22_v0
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1, label_19_v1
sw $t0,0($t1)
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
label_31_v2:
.space 4
label_57_v9:
.space 4
label_52_v8:
.space 4
label_50_v7:
.space 4
label_28_v3:
.space 4
label_55_v10:
.space 4
label_39_v4:
.space 4
label_53_v6:
.space 4
label_36_v5:
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
# Original instruction: addi $sp,$sp,-12
addi $sp,$sp,-12
# body of main:
# Original instruction: addi v2,$fp,4
addi $t5,$fp,4
la $t4, label_31_v2
sw $t5,0($t4)
# Original instruction: addi v2,v2,4
la $t4, label_31_v2
lw $t4,0($t4)
addi $t4,$t4,4
la $t3, label_31_v2
sw $t4,0($t3)
# Original instruction: li v3,20
li $t5,20
la $t4, label_28_v3
sw $t5,0($t4)
# Original instruction: sw v3,0(v2)
la $t5, label_28_v3
lw $t5,0($t5)
la $t4, label_31_v2
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: lw v2,0(v2)
la $t4, label_31_v2
lw $t4,0($t4)
lw $t4,0($t4)
la $t3, label_31_v2
sw $t4,0($t3)
# Original instruction: addi v4,$fp,-8
addi $t5,$fp,-8
la $t4, label_39_v4
sw $t5,0($t4)
# Original instruction: addi v4,v4,4
la $t4, label_39_v4
lw $t4,0($t4)
addi $t4,$t4,4
la $t3, label_39_v4
sw $t4,0($t3)
# Original instruction: li v5,25
li $t5,25
la $t4, label_36_v5
sw $t5,0($t4)
# Original instruction: sw v5,0(v4)
la $t5, label_36_v5
lw $t5,0($t5)
la $t4, label_39_v4
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: lw v4,0(v4)
la $t4, label_39_v4
lw $t4,0($t4)
lw $t4,0($t4)
la $t3, label_39_v4
sw $t4,0($t3)
# Original instruction: addi v6,$fp,4
addi $t5,$fp,4
la $t4, label_53_v6
sw $t5,0($t4)
# Original instruction: addi v7,$fp,-8
addi $t5,$fp,-8
la $t4, label_50_v7
sw $t5,0($t4)
# Original instruction: lw v8,0(v7)
la $t5, label_50_v7
lw $t5,0($t5)
lw $t4,0($t5)
la $t3, label_52_v8
sw $t4,0($t3)
# Original instruction: sw v8,0(v6)
la $t5, label_52_v8
lw $t5,0($t5)
la $t4, label_53_v6
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: lw v8,4(v7)
la $t5, label_50_v7
lw $t5,0($t5)
lw $t4,4($t5)
la $t3, label_52_v8
sw $t4,0($t3)
# Original instruction: sw v8,4(v6)
la $t5, label_52_v8
lw $t5,0($t5)
la $t4, label_53_v6
lw $t4,0($t4)
sw $t5,4($t4)
# Original instruction: lw v8,8(v7)
la $t5, label_50_v7
lw $t5,0($t5)
lw $t4,8($t5)
la $t3, label_52_v8
sw $t4,0($t3)
# Original instruction: sw v8,8(v6)
la $t5, label_52_v8
lw $t5,0($t5)
la $t4, label_53_v6
lw $t4,0($t4)
sw $t5,8($t4)
# Original instruction: addi v10,$fp,4
addi $t5,$fp,4
la $t4, label_55_v10
sw $t5,0($t4)
# Original instruction: lw v9,4(v10)
la $t5, label_55_v10
lw $t5,0($t5)
lw $t4,4($t5)
la $t3, label_57_v9
sw $t4,0($t3)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw v9,0($sp)
la $t5, label_57_v9
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

