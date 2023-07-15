.data

.data

.text
# Original instruction: jal main
jal main

.data
# Allocated labels for spilled registers
label_1_v5:
.space 4
label_2_v0:
.space 4
label_3_v18:
.space 4
label_4_v4:
.space 4

.text
main:
# comment
# Original instruction: li v0,0
li $t0,0
la $t1, label_2_v0
sw $t0,0($t1)
# Original instruction: li v1,1
li $s4,1
# Original instruction: li v2,2
li $t7,2
# Original instruction: li v3,3
li $s2,3
# Original instruction: li v4,4
li $t0,4
la $t1, label_4_v4
sw $t0,0($t1)
# Original instruction: li v5,5
li $t0,5
la $t1, label_1_v5
sw $t0,0($t1)
# Original instruction: li v6,6
li $t5,6
# Original instruction: li v7,7
li $s0,7
# Original instruction: li v8,8
li $s7,8
# Original instruction: li v9,9
li $t2,9
# Original instruction: li v10,10
li $t4,10
# Original instruction: li v11,11
li $t8,11
# Original instruction: li v12,12
li $t3,12
# Original instruction: li v13,13
li $s5,13
# Original instruction: li v14,14
li $s6,14
# Original instruction: li v15,15
li $t6,15
# Original instruction: li v16,16
li $s3,16
# Original instruction: li v17,17
li $t9,17
# Original instruction: li v18,18
li $t0,18
la $t1, label_3_v18
sw $t0,0($t1)
# Original instruction: li v19,19
li $s1,19
# Original instruction: li v20,20
li $t3,20
# Original instruction: li v21,21
li $t3,21
# Original instruction: li v22,22
li $t3,22
# Original instruction: li v23,23
li $t3,23
# Original instruction: li v24,24
li $t3,24
# Original instruction: li v25,25
li $t3,25
# Original instruction: li v26,26
li $t3,26
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v0,$zero
la $t0, label_2_v0
lw $t0,0($t0)
add $a0,$t0,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v1,$zero
add $a0,$s4,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v2,$zero
add $a0,$t7,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v3,$zero
add $a0,$s2,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v4,$zero
la $t0, label_4_v4
lw $t0,0($t0)
add $a0,$t0,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v5,$zero
la $t0, label_1_v5
lw $t0,0($t0)
add $a0,$t0,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v6,$zero
add $a0,$t5,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v7,$zero
add $a0,$s0,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v8,$zero
add $a0,$s7,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v9,$zero
add $a0,$t2,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v10,$zero
add $a0,$t4,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v11,$zero
add $a0,$t8,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v12,$zero
add $a0,$t3,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v13,$zero
add $a0,$s5,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v14,$zero
add $a0,$s6,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v15,$zero
add $a0,$t6,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v16,$zero
add $a0,$s3,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v16,$zero
add $a0,$s3,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v17,$zero
add $a0,$t9,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v18,$zero
la $t0, label_3_v18
lw $t0,0($t0)
add $a0,$t0,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,1
li $v0,1
# Original instruction: add $a0,v19,$zero
add $a0,$s1,$zero
# Original instruction: syscall
syscall
# Original instruction: li $v0,10
li $v0,10
# Original instruction: syscall
syscall

