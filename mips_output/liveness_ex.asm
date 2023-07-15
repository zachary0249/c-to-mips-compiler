.data
c_val:
.word 4

.text
jal main

.text
main:
li a, 0
branch:
addi b, a, 1
la c, c_val
lw c, 0(c)
add c, c, b
li d, 2
mul a, b, d
slti e, a, 9
bnez e, branch
