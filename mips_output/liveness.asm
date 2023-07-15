.data

.text
li v0, 0
li v1, 1
label:
add v2, v0, v1
add v3, v3, v2
li v4, 2
mul v0, v2, v4
li v5, 9
slt v6, v0, v5
bnez v6, label