.data
c_val:
.word 4

.data

.text
# Original instruction: jal main
jal main

.data

.text
main:
# Original instruction: li a,0
li $t3,0
branch:
# Original instruction: addi b,a,1
addi $t4,$t3,1
# Original instruction: la c, c_val
la $t3, c_val
# Original instruction: lw c,0(c)
lw $t3,0($t3)
# Original instruction: add c,c,b
add $t3,$t3,$t4
# Original instruction: li d,2
li $t3,2
# Original instruction: mul a,b,d
mul $t3,$t4,$t3
# Original instruction: slti e,a,9
slti $t3,$t3,9
# Original instruction: bnez e,branch
bnez $t3,branch

