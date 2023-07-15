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
reset:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
pushRegisters
# body of reset:
la v0, label_0_a11
la v1, label_9_empty
lb v1,0(v1)
sb v1,0(v0)
lw v0,0(v0)
la v2, label_1_a12
la v3, label_9_empty
lb v3,0(v3)
sb v3,0(v2)
lw v2,0(v2)
la v4, label_2_a13
la v5, label_9_empty
lb v5,0(v5)
sb v5,0(v4)
lw v4,0(v4)
la v6, label_3_a21
la v7, label_9_empty
lb v7,0(v7)
sb v7,0(v6)
lw v6,0(v6)
la v8, label_4_a22
la v9, label_9_empty
lb v9,0(v9)
sb v9,0(v8)
lw v8,0(v8)
la v10, label_5_a23
la v11, label_9_empty
lb v11,0(v11)
sb v11,0(v10)
lw v10,0(v10)
la v12, label_6_a31
la v13, label_9_empty
lb v13,0(v13)
sb v13,0(v12)
lw v12,0(v12)
la v14, label_7_a32
la v15, label_9_empty
lb v15,0(v15)
sb v15,0(v14)
lw v14,0(v14)
la v16, label_8_a33
la v17, label_9_empty
lb v17,0(v17)
sb v17,0(v16)
lw v16,0(v16)
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,4
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
jr $ra

.text
full:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
addi $sp,$sp,-4
# save all registers needed for fn
pushRegisters
# body of full:
addi v18,$fp,4
li v19,0
sw v19,0(v18)
lw v18,0(v18)
# if BinOp(VarExpr(a11),NE,VarExpr(empty)) then
la v20, label_0_a11
lb v20,0(v20)
la v22, label_9_empty
lb v22,0(v22)
xor v21,v20,v22
sltu v21,$zero,v21
beq v21,$zero,label_46_else
addi v23,$fp,4
lw v24,4($fp)
li v26,1
add v25,v24,v26
sw v25,0(v23)
lw v23,0(v23)
j label_47_end
label_46_else:
label_47_end:
# if BinOp(VarExpr(a21),NE,VarExpr(empty)) then
la v27, label_3_a21
lb v27,0(v27)
la v29, label_9_empty
lb v29,0(v29)
xor v28,v27,v29
sltu v28,$zero,v28
beq v28,$zero,label_48_else
addi v30,$fp,4
lw v31,4($fp)
li v33,1
add v32,v31,v33
sw v32,0(v30)
lw v30,0(v30)
j label_49_end
label_48_else:
label_49_end:
# if BinOp(VarExpr(a31),NE,VarExpr(empty)) then
la v34, label_6_a31
lb v34,0(v34)
la v36, label_9_empty
lb v36,0(v36)
xor v35,v34,v36
sltu v35,$zero,v35
beq v35,$zero,label_50_else
addi v37,$fp,4
lw v38,4($fp)
li v40,1
add v39,v38,v40
sw v39,0(v37)
lw v37,0(v37)
j label_51_end
label_50_else:
label_51_end:
# if BinOp(VarExpr(a12),NE,VarExpr(empty)) then
la v41, label_1_a12
lb v41,0(v41)
la v43, label_9_empty
lb v43,0(v43)
xor v42,v41,v43
sltu v42,$zero,v42
beq v42,$zero,label_52_else
addi v44,$fp,4
lw v45,4($fp)
li v47,1
add v46,v45,v47
sw v46,0(v44)
lw v44,0(v44)
j label_53_end
label_52_else:
label_53_end:
# if BinOp(VarExpr(a22),NE,VarExpr(empty)) then
la v48, label_4_a22
lb v48,0(v48)
la v50, label_9_empty
lb v50,0(v50)
xor v49,v48,v50
sltu v49,$zero,v49
beq v49,$zero,label_54_else
addi v51,$fp,4
lw v52,4($fp)
li v54,1
add v53,v52,v54
sw v53,0(v51)
lw v51,0(v51)
j label_55_end
label_54_else:
label_55_end:
# if BinOp(VarExpr(a32),NE,VarExpr(empty)) then
la v55, label_7_a32
lb v55,0(v55)
la v57, label_9_empty
lb v57,0(v57)
xor v56,v55,v57
sltu v56,$zero,v56
beq v56,$zero,label_56_else
addi v58,$fp,4
lw v59,4($fp)
li v61,1
add v60,v59,v61
sw v60,0(v58)
lw v58,0(v58)
j label_57_end
label_56_else:
label_57_end:
# if BinOp(VarExpr(a13),NE,VarExpr(empty)) then
la v62, label_2_a13
lb v62,0(v62)
la v64, label_9_empty
lb v64,0(v64)
xor v63,v62,v64
sltu v63,$zero,v63
beq v63,$zero,label_58_else
addi v65,$fp,4
lw v66,4($fp)
li v68,1
add v67,v66,v68
sw v67,0(v65)
lw v65,0(v65)
j label_59_end
label_58_else:
label_59_end:
# if BinOp(VarExpr(a23),NE,VarExpr(empty)) then
la v69, label_5_a23
lb v69,0(v69)
la v71, label_9_empty
lb v71,0(v71)
xor v70,v69,v71
sltu v70,$zero,v70
beq v70,$zero,label_60_else
addi v72,$fp,4
lw v73,4($fp)
li v75,1
add v74,v73,v75
sw v74,0(v72)
lw v72,0(v72)
j label_61_end
label_60_else:
label_61_end:
# if BinOp(VarExpr(a33),NE,VarExpr(empty)) then
la v76, label_8_a33
lb v76,0(v76)
la v78, label_9_empty
lb v78,0(v78)
xor v77,v76,v78
sltu v77,$zero,v77
beq v77,$zero,label_62_else
addi v79,$fp,4
lw v80,4($fp)
li v82,1
add v81,v80,v82
sw v81,0(v79)
lw v79,0(v79)
j label_63_end
label_62_else:
label_63_end:
# if BinOp(VarExpr(n),EQ,IntLiteral(9)) then
lw v83,4($fp)
li v85,9
xor v84,v83,v85
sltiu v84,v84,1
beq v84,$zero,label_64_else
# return statement
li v86,1
sw v86,8($fp)
j label_65_end
label_64_else:
# else:
# return statement
li v87,0
sw v87,8($fp)
label_65_end:
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,8
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
jr $ra

.text
set:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
addi $sp,$sp,-4
# save all registers needed for fn
pushRegisters
# body of set:
addi v88,$fp,4
li v89,1
sw v89,0(v88)
lw v88,0(v88)
# if BinOp(VarExpr(row),EQ,ChrLiteral(a)) then
lb v90,20($fp)
li v92,97
xor v91,v90,v92
sltiu v91,v91,1
beq v91,$zero,label_67_else
# if BinOp(VarExpr(col),EQ,IntLiteral(1)) then
lw v93,16($fp)
li v95,1
xor v94,v93,v95
sltiu v94,v94,1
beq v94,$zero,label_69_else
# if BinOp(VarExpr(a11),EQ,VarExpr(empty)) then
la v96, label_0_a11
lb v96,0(v96)
la v98, label_9_empty
lb v98,0(v98)
xor v97,v96,v98
sltiu v97,v97,1
beq v97,$zero,label_71_else
la v99, label_0_a11
lb v100,12($fp)
sb v100,0(v99)
lw v99,0(v99)
j label_72_end
label_71_else:
# else:
addi v101,$fp,4
li v102,0
li v104,1
sub v103,v102,v104
sw v103,0(v101)
lw v101,0(v101)
label_72_end:
j label_70_end
label_69_else:
# else:
# if BinOp(VarExpr(col),EQ,IntLiteral(2)) then
lw v105,16($fp)
li v107,2
xor v106,v105,v107
sltiu v106,v106,1
beq v106,$zero,label_73_else
# if BinOp(VarExpr(a12),EQ,VarExpr(empty)) then
la v108, label_1_a12
lb v108,0(v108)
la v110, label_9_empty
lb v110,0(v110)
xor v109,v108,v110
sltiu v109,v109,1
beq v109,$zero,label_75_else
la v111, label_1_a12
lb v112,12($fp)
sb v112,0(v111)
lw v111,0(v111)
j label_76_end
label_75_else:
# else:
addi v113,$fp,4
li v114,0
li v116,1
sub v115,v114,v116
sw v115,0(v113)
lw v113,0(v113)
label_76_end:
j label_74_end
label_73_else:
# else:
# if BinOp(VarExpr(col),EQ,IntLiteral(3)) then
lw v117,16($fp)
li v119,3
xor v118,v117,v119
sltiu v118,v118,1
beq v118,$zero,label_77_else
# if BinOp(VarExpr(a13),EQ,VarExpr(empty)) then
la v120, label_2_a13
lb v120,0(v120)
la v122, label_9_empty
lb v122,0(v122)
xor v121,v120,v122
sltiu v121,v121,1
beq v121,$zero,label_79_else
la v123, label_2_a13
lb v124,12($fp)
sb v124,0(v123)
lw v123,0(v123)
j label_80_end
label_79_else:
# else:
addi v125,$fp,4
li v126,0
li v128,1
sub v127,v126,v128
sw v127,0(v125)
lw v125,0(v125)
label_80_end:
j label_78_end
label_77_else:
# else:
addi v129,$fp,4
li v130,0
sw v130,0(v129)
lw v129,0(v129)
label_78_end:
label_74_end:
label_70_end:
j label_68_end
label_67_else:
# else:
# if BinOp(VarExpr(row),EQ,ChrLiteral(b)) then
lb v131,20($fp)
li v133,98
xor v132,v131,v133
sltiu v132,v132,1
beq v132,$zero,label_81_else
# if BinOp(VarExpr(col),EQ,IntLiteral(1)) then
lw v134,16($fp)
li v136,1
xor v135,v134,v136
sltiu v135,v135,1
beq v135,$zero,label_83_else
# if BinOp(VarExpr(a21),EQ,VarExpr(empty)) then
la v137, label_3_a21
lb v137,0(v137)
la v139, label_9_empty
lb v139,0(v139)
xor v138,v137,v139
sltiu v138,v138,1
beq v138,$zero,label_85_else
la v140, label_3_a21
lb v141,12($fp)
sb v141,0(v140)
lw v140,0(v140)
j label_86_end
label_85_else:
# else:
addi v142,$fp,4
li v143,0
li v145,1
sub v144,v143,v145
sw v144,0(v142)
lw v142,0(v142)
label_86_end:
j label_84_end
label_83_else:
# else:
# if BinOp(VarExpr(col),EQ,IntLiteral(2)) then
lw v146,16($fp)
li v148,2
xor v147,v146,v148
sltiu v147,v147,1
beq v147,$zero,label_87_else
# if BinOp(VarExpr(a22),EQ,VarExpr(empty)) then
la v149, label_4_a22
lb v149,0(v149)
la v151, label_9_empty
lb v151,0(v151)
xor v150,v149,v151
sltiu v150,v150,1
beq v150,$zero,label_89_else
la v152, label_4_a22
lb v153,12($fp)
sb v153,0(v152)
lw v152,0(v152)
j label_90_end
label_89_else:
# else:
addi v154,$fp,4
li v155,0
li v157,1
sub v156,v155,v157
sw v156,0(v154)
lw v154,0(v154)
label_90_end:
j label_88_end
label_87_else:
# else:
# if BinOp(VarExpr(col),EQ,IntLiteral(3)) then
lw v158,16($fp)
li v160,3
xor v159,v158,v160
sltiu v159,v159,1
beq v159,$zero,label_91_else
# if BinOp(VarExpr(a23),EQ,VarExpr(empty)) then
la v161, label_5_a23
lb v161,0(v161)
la v163, label_9_empty
lb v163,0(v163)
xor v162,v161,v163
sltiu v162,v162,1
beq v162,$zero,label_93_else
la v164, label_5_a23
lb v165,12($fp)
sb v165,0(v164)
lw v164,0(v164)
j label_94_end
label_93_else:
# else:
addi v166,$fp,4
li v167,0
li v169,1
sub v168,v167,v169
sw v168,0(v166)
lw v166,0(v166)
label_94_end:
j label_92_end
label_91_else:
# else:
addi v170,$fp,4
li v171,0
sw v171,0(v170)
lw v170,0(v170)
label_92_end:
label_88_end:
label_84_end:
j label_82_end
label_81_else:
# else:
# if BinOp(VarExpr(row),EQ,ChrLiteral(c)) then
lb v172,20($fp)
li v174,99
xor v173,v172,v174
sltiu v173,v173,1
beq v173,$zero,label_95_else
# if BinOp(VarExpr(col),EQ,IntLiteral(1)) then
lw v175,16($fp)
li v177,1
xor v176,v175,v177
sltiu v176,v176,1
beq v176,$zero,label_97_else
# if BinOp(VarExpr(a31),EQ,VarExpr(empty)) then
la v178, label_6_a31
lb v178,0(v178)
la v180, label_9_empty
lb v180,0(v180)
xor v179,v178,v180
sltiu v179,v179,1
beq v179,$zero,label_99_else
la v181, label_6_a31
lb v182,12($fp)
sb v182,0(v181)
lw v181,0(v181)
j label_100_end
label_99_else:
# else:
addi v183,$fp,4
li v184,0
li v186,1
sub v185,v184,v186
sw v185,0(v183)
lw v183,0(v183)
label_100_end:
j label_98_end
label_97_else:
# else:
# if BinOp(VarExpr(col),EQ,IntLiteral(2)) then
lw v187,16($fp)
li v189,2
xor v188,v187,v189
sltiu v188,v188,1
beq v188,$zero,label_101_else
# if BinOp(VarExpr(a32),EQ,VarExpr(empty)) then
la v190, label_7_a32
lb v190,0(v190)
la v192, label_9_empty
lb v192,0(v192)
xor v191,v190,v192
sltiu v191,v191,1
beq v191,$zero,label_103_else
la v193, label_7_a32
lb v194,12($fp)
sb v194,0(v193)
lw v193,0(v193)
j label_104_end
label_103_else:
# else:
addi v195,$fp,4
li v196,0
li v198,1
sub v197,v196,v198
sw v197,0(v195)
lw v195,0(v195)
label_104_end:
j label_102_end
label_101_else:
# else:
# if BinOp(VarExpr(col),EQ,IntLiteral(3)) then
lw v199,16($fp)
li v201,3
xor v200,v199,v201
sltiu v200,v200,1
beq v200,$zero,label_105_else
# if BinOp(VarExpr(a33),EQ,VarExpr(empty)) then
la v202, label_8_a33
lb v202,0(v202)
la v204, label_9_empty
lb v204,0(v204)
xor v203,v202,v204
sltiu v203,v203,1
beq v203,$zero,label_107_else
la v205, label_8_a33
lb v206,12($fp)
sb v206,0(v205)
lw v205,0(v205)
j label_108_end
label_107_else:
# else:
addi v207,$fp,4
li v208,0
li v210,1
sub v209,v208,v210
sw v209,0(v207)
lw v207,0(v207)
label_108_end:
j label_106_end
label_105_else:
# else:
addi v211,$fp,4
li v212,0
sw v212,0(v211)
lw v211,0(v211)
label_106_end:
label_102_end:
label_98_end:
j label_96_end
label_95_else:
# else:
addi v213,$fp,4
li v214,0
sw v214,0(v213)
lw v213,0(v213)
label_96_end:
label_82_end:
label_68_end:
# return statement
lw v215,4($fp)
sw v215,8($fp)
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,8
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
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

.text
printGame:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
pushRegisters
# body of printGame:
la v216, label_10_printGame_str
addi $sp,$sp,-4
sw v216,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v217, label_11_printGame_str
addi $sp,$sp,-4
sw v217,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v218, label_12_printGame_str
addi $sp,$sp,-4
sw v218,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v219, label_13_printGame_str
addi $sp,$sp,-4
sw v219,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v220, label_0_a11
lb v220,0(v220)
addi $sp,$sp,-4
sw v220,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_c
lw $ra,0($sp)
addi $sp,$sp,8
la v221, label_14_printGame_str
addi $sp,$sp,-4
sw v221,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v222, label_1_a12
lb v222,0(v222)
addi $sp,$sp,-4
sw v222,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_c
lw $ra,0($sp)
addi $sp,$sp,8
la v223, label_15_printGame_str
addi $sp,$sp,-4
sw v223,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v224, label_2_a13
lb v224,0(v224)
addi $sp,$sp,-4
sw v224,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_c
lw $ra,0($sp)
addi $sp,$sp,8
la v225, label_16_printGame_str
addi $sp,$sp,-4
sw v225,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v226, label_17_printGame_str
addi $sp,$sp,-4
sw v226,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v227, label_18_printGame_str
addi $sp,$sp,-4
sw v227,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v228, label_3_a21
lb v228,0(v228)
addi $sp,$sp,-4
sw v228,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_c
lw $ra,0($sp)
addi $sp,$sp,8
la v229, label_19_printGame_str
addi $sp,$sp,-4
sw v229,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v230, label_4_a22
lb v230,0(v230)
addi $sp,$sp,-4
sw v230,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_c
lw $ra,0($sp)
addi $sp,$sp,8
la v231, label_20_printGame_str
addi $sp,$sp,-4
sw v231,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v232, label_5_a23
lb v232,0(v232)
addi $sp,$sp,-4
sw v232,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_c
lw $ra,0($sp)
addi $sp,$sp,8
la v233, label_21_printGame_str
addi $sp,$sp,-4
sw v233,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v234, label_22_printGame_str
addi $sp,$sp,-4
sw v234,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v235, label_23_printGame_str
addi $sp,$sp,-4
sw v235,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v236, label_6_a31
lb v236,0(v236)
addi $sp,$sp,-4
sw v236,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_c
lw $ra,0($sp)
addi $sp,$sp,8
la v237, label_24_printGame_str
addi $sp,$sp,-4
sw v237,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v238, label_7_a32
lb v238,0(v238)
addi $sp,$sp,-4
sw v238,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_c
lw $ra,0($sp)
addi $sp,$sp,8
la v239, label_25_printGame_str
addi $sp,$sp,-4
sw v239,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v240, label_8_a33
lb v240,0(v240)
addi $sp,$sp,-4
sw v240,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_c
lw $ra,0($sp)
addi $sp,$sp,8
la v241, label_26_printGame_str
addi $sp,$sp,-4
sw v241,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v242, label_27_printGame_str
addi $sp,$sp,-4
sw v242,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
la v243, label_28_printGame_str
addi $sp,$sp,-4
sw v243,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,4
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
jr $ra

.data
label_29_printWinner_str:
.asciiz "Player "
label_30_printWinner_str:
.asciiz " has won!\n"
label_119_label_30_printWinner_str_pad:
.space 1

.text
printWinner:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
pushRegisters
# body of printWinner:
la v244, label_29_printWinner_str
addi $sp,$sp,-4
sw v244,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
lw v245,8($fp)
addi $sp,$sp,-4
sw v245,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
la v246, label_30_printWinner_str
addi $sp,$sp,-4
sw v246,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,4
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
jr $ra

.text
switchPlayer:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
pushRegisters
# body of switchPlayer:
# if BinOp(VarExpr(currentPlayer),EQ,IntLiteral(1)) then
lw v247,12($fp)
li v249,1
xor v248,v247,v249
sltiu v248,v248,1
beq v248,$zero,label_122_else
# return statement
li v250,2
sw v250,8($fp)
j label_123_end
label_122_else:
# else:
# return statement
li v251,1
sw v251,8($fp)
label_123_end:
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,4
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
jr $ra

.text
get_mark:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
# save all registers needed for fn
pushRegisters
# body of get_mark:
# if BinOp(VarExpr(player),EQ,IntLiteral(1)) then
lw v252,12($fp)
li v254,1
xor v253,v252,v254
sltiu v253,v253,1
beq v253,$zero,label_125_else
# return statement
li v255,88
sb v255,8($fp)
j label_126_end
label_125_else:
# else:
# return statement
li v256,79
sb v256,8($fp)
label_126_end:
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,4
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
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

.text
selectmove:
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
# save all registers needed for fn
pushRegisters
# body of selectmove:
addi v257,$fp,-4
li v258,1
sw v258,0(v257)
lw v257,0(v257)
# loop while: VarExpr(selected)
lw v259,-4($fp)
beqz v259,label_129_next
label_130_body:
la v260, label_31_selectmove_str
addi $sp,$sp,-4
sw v260,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
lw v261,8($fp)
addi $sp,$sp,-4
sw v261,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_i
lw $ra,0($sp)
addi $sp,$sp,8
la v262, label_32_selectmove_str
addi $sp,$sp,-4
sw v262,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
addi v263,$fp,4
addi $sp,$sp,-4
addi $sp,$sp,-4
sw $ra,0($sp)
jal read_c
lw $ra,0($sp)
lb v264,4($sp)
addi $sp,$sp,8
sb v264,0(v263)
lw v263,0(v263)
addi v265,$fp,0
addi $sp,$sp,-4
addi $sp,$sp,-4
sw $ra,0($sp)
jal read_i
lw $ra,0($sp)
lw v266,4($sp)
addi $sp,$sp,8
sw v266,0(v265)
lw v265,0(v265)
addi v267,$fp,-12
lw v268,8($fp)
addi $sp,$sp,-4
sw v268,0($sp)
addi $sp,$sp,-4
addi $sp,$sp,-4
sw $ra,0($sp)
jal get_mark
lw $ra,0($sp)
lb v269,4($sp)
addi $sp,$sp,12
sb v269,0(v267)
lw v267,0(v267)
addi v270,$fp,-8
lb v271,4($fp)
addi $sp,$sp,-4
sw v271,0($sp)
lw v272,0($fp)
addi $sp,$sp,-4
sw v272,0($sp)
lb v273,-12($fp)
addi $sp,$sp,-4
sw v273,0($sp)
addi $sp,$sp,-4
addi $sp,$sp,-4
sw $ra,0($sp)
jal set
lw $ra,0($sp)
lw v274,4($sp)
addi $sp,$sp,20
sw v274,0(v270)
lw v270,0(v270)
# if BinOp(VarExpr(success),EQ,IntLiteral(0)) then
lw v275,-8($fp)
li v277,0
xor v276,v275,v277
sltiu v276,v276,1
beq v276,$zero,label_131_else
la v278, label_33_selectmove_str
addi $sp,$sp,-4
sw v278,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
j label_132_end
label_131_else:
# else:
# if BinOp(VarExpr(success),EQ,BinOp(IntLiteral(0),SUB,IntLiteral(1))) then
lw v279,-8($fp)
li v281,0
li v283,1
sub v282,v281,v283
xor v280,v279,v282
sltiu v280,v280,1
beq v280,$zero,label_133_else
la v284, label_34_selectmove_str
addi $sp,$sp,-4
sw v284,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
j label_134_end
label_133_else:
# else:
addi v285,$fp,-4
li v286,0
sw v286,0(v285)
lw v285,0(v285)
label_134_end:
label_132_end:
lw v287,-4($fp)
bnez v287,label_130_body
label_129_next:
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,24
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
jr $ra

.text
won:
# push frame pointer onto stack
addi $sp,$sp,-4
sw $fp,0($sp)
# initialize frame pointer
add $fp,$sp,$zero
# allocate local variables
addi $sp,$sp,-4
# save all registers needed for fn
pushRegisters
# body of won:
addi v288,$fp,4
li v289,0
sw v289,0(v288)
lw v288,0(v288)
# if BinOp(VarExpr(a11),EQ,VarExpr(mark)) then
la v290, label_0_a11
lb v290,0(v290)
lb v292,12($fp)
xor v291,v290,v292
sltiu v291,v291,1
beq v291,$zero,label_136_else
# if BinOp(VarExpr(a21),EQ,VarExpr(mark)) then
la v293, label_3_a21
lb v293,0(v293)
lb v295,12($fp)
xor v294,v293,v295
sltiu v294,v294,1
beq v294,$zero,label_138_else
# if BinOp(VarExpr(a31),EQ,VarExpr(mark)) then
la v296, label_6_a31
lb v296,0(v296)
lb v298,12($fp)
xor v297,v296,v298
sltiu v297,v297,1
beq v297,$zero,label_140_else
addi v299,$fp,4
li v300,1
sw v300,0(v299)
lw v299,0(v299)
j label_141_end
label_140_else:
label_141_end:
j label_139_end
label_138_else:
# else:
# if BinOp(VarExpr(a22),EQ,VarExpr(mark)) then
la v301, label_4_a22
lb v301,0(v301)
lb v303,12($fp)
xor v302,v301,v303
sltiu v302,v302,1
beq v302,$zero,label_142_else
# if BinOp(VarExpr(a33),EQ,VarExpr(mark)) then
la v304, label_8_a33
lb v304,0(v304)
lb v306,12($fp)
xor v305,v304,v306
sltiu v305,v305,1
beq v305,$zero,label_144_else
addi v307,$fp,4
li v308,1
sw v308,0(v307)
lw v307,0(v307)
j label_145_end
label_144_else:
label_145_end:
j label_143_end
label_142_else:
# else:
# if BinOp(VarExpr(a12),EQ,VarExpr(mark)) then
la v309, label_1_a12
lb v309,0(v309)
lb v311,12($fp)
xor v310,v309,v311
sltiu v310,v310,1
beq v310,$zero,label_146_else
# if BinOp(VarExpr(a13),EQ,VarExpr(mark)) then
la v312, label_2_a13
lb v312,0(v312)
lb v314,12($fp)
xor v313,v312,v314
sltiu v313,v313,1
beq v313,$zero,label_148_else
addi v315,$fp,4
li v316,1
sw v316,0(v315)
lw v315,0(v315)
j label_149_end
label_148_else:
label_149_end:
j label_147_end
label_146_else:
label_147_end:
label_143_end:
label_139_end:
j label_137_end
label_136_else:
label_137_end:
# if BinOp(VarExpr(a12),EQ,VarExpr(mark)) then
la v317, label_1_a12
lb v317,0(v317)
lb v319,12($fp)
xor v318,v317,v319
sltiu v318,v318,1
beq v318,$zero,label_150_else
# if BinOp(VarExpr(a22),EQ,VarExpr(mark)) then
la v320, label_4_a22
lb v320,0(v320)
lb v322,12($fp)
xor v321,v320,v322
sltiu v321,v321,1
beq v321,$zero,label_152_else
# if BinOp(VarExpr(a32),EQ,VarExpr(mark)) then
la v323, label_7_a32
lb v323,0(v323)
lb v325,12($fp)
xor v324,v323,v325
sltiu v324,v324,1
beq v324,$zero,label_154_else
addi v326,$fp,4
li v327,1
sw v327,0(v326)
lw v326,0(v326)
j label_155_end
label_154_else:
label_155_end:
j label_153_end
label_152_else:
label_153_end:
j label_151_end
label_150_else:
label_151_end:
# if BinOp(VarExpr(a13),EQ,VarExpr(mark)) then
la v328, label_2_a13
lb v328,0(v328)
lb v330,12($fp)
xor v329,v328,v330
sltiu v329,v329,1
beq v329,$zero,label_156_else
# if BinOp(VarExpr(a23),EQ,VarExpr(mark)) then
la v331, label_5_a23
lb v331,0(v331)
lb v333,12($fp)
xor v332,v331,v333
sltiu v332,v332,1
beq v332,$zero,label_158_else
# if BinOp(VarExpr(a33),EQ,VarExpr(mark)) then
la v334, label_8_a33
lb v334,0(v334)
lb v336,12($fp)
xor v335,v334,v336
sltiu v335,v335,1
beq v335,$zero,label_160_else
addi v337,$fp,4
li v338,1
sw v338,0(v337)
lw v337,0(v337)
j label_161_end
label_160_else:
label_161_end:
j label_159_end
label_158_else:
# else:
# if BinOp(VarExpr(a22),EQ,VarExpr(mark)) then
la v339, label_4_a22
lb v339,0(v339)
lb v341,12($fp)
xor v340,v339,v341
sltiu v340,v340,1
beq v340,$zero,label_162_else
# if BinOp(VarExpr(a31),EQ,VarExpr(mark)) then
la v342, label_6_a31
lb v342,0(v342)
lb v344,12($fp)
xor v343,v342,v344
sltiu v343,v343,1
beq v343,$zero,label_164_else
addi v345,$fp,4
li v346,1
sw v346,0(v345)
lw v345,0(v345)
j label_165_end
label_164_else:
label_165_end:
j label_163_end
label_162_else:
label_163_end:
label_159_end:
j label_157_end
label_156_else:
label_157_end:
# if BinOp(VarExpr(a21),EQ,VarExpr(mark)) then
la v347, label_3_a21
lb v347,0(v347)
lb v349,12($fp)
xor v348,v347,v349
sltiu v348,v348,1
beq v348,$zero,label_166_else
# if BinOp(VarExpr(a22),EQ,VarExpr(mark)) then
la v350, label_4_a22
lb v350,0(v350)
lb v352,12($fp)
xor v351,v350,v352
sltiu v351,v351,1
beq v351,$zero,label_168_else
# if BinOp(VarExpr(a23),EQ,VarExpr(mark)) then
la v353, label_5_a23
lb v353,0(v353)
lb v355,12($fp)
xor v354,v353,v355
sltiu v354,v354,1
beq v354,$zero,label_170_else
addi v356,$fp,4
li v357,1
sw v357,0(v356)
lw v356,0(v356)
j label_171_end
label_170_else:
label_171_end:
j label_169_end
label_168_else:
label_169_end:
j label_167_end
label_166_else:
label_167_end:
# if BinOp(VarExpr(a31),EQ,VarExpr(mark)) then
la v358, label_6_a31
lb v358,0(v358)
lb v360,12($fp)
xor v359,v358,v360
sltiu v359,v359,1
beq v359,$zero,label_172_else
# if BinOp(VarExpr(a32),EQ,VarExpr(mark)) then
la v361, label_7_a32
lb v361,0(v361)
lb v363,12($fp)
xor v362,v361,v363
sltiu v362,v362,1
beq v362,$zero,label_174_else
# if BinOp(VarExpr(a33),EQ,VarExpr(mark)) then
la v364, label_8_a33
lb v364,0(v364)
lb v366,12($fp)
xor v365,v364,v366
sltiu v365,v365,1
beq v365,$zero,label_176_else
addi v367,$fp,4
li v368,1
sw v368,0(v367)
lw v367,0(v367)
j label_177_end
label_176_else:
label_177_end:
j label_175_end
label_174_else:
label_175_end:
j label_173_end
label_172_else:
label_173_end:
# return statement
lw v369,4($fp)
sw v369,8($fp)
# restore saved registers from stack
popRegisters
# restore stack pointer
addi $sp,$sp,8
# restore frame pointer from stack
lw $fp,0($fp)
# jump to return address
jr $ra

.data
label_35_main_str:
.asciiz "It\'s a draw!\n"
label_178_label_35_main_str_pad:
.space 2
label_36_main_str:
.asciiz "Play again? (y/n)> "

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
# body of main:
la v370, label_9_empty
li v371,32
sb v371,0(v370)
lw v370,0(v370)
addi v372,$fp,4
li v373,1
sw v373,0(v372)
lw v372,0(v372)
addi $sp,$sp,-4
sw $ra,0($sp)
jal reset
lw $ra,0($sp)
addi $sp,$sp,4
addi $sp,$sp,-4
sw $ra,0($sp)
jal printGame
lw $ra,0($sp)
addi $sp,$sp,4
addi v374,$fp,0
li v375,1
sw v375,0(v374)
lw v374,0(v374)
# loop while: VarExpr(playing)
lw v376,4($fp)
beqz v376,label_179_next
label_180_body:
lw v377,0($fp)
addi $sp,$sp,-4
sw v377,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal selectmove
lw $ra,0($sp)
addi $sp,$sp,8
addi v378,$fp,-4
lw v379,0($fp)
addi $sp,$sp,-4
sw v379,0($sp)
addi $sp,$sp,-4
addi $sp,$sp,-4
sw $ra,0($sp)
jal get_mark
lw $ra,0($sp)
lb v380,4($sp)
addi $sp,$sp,12
sb v380,0(v378)
lw v378,0(v378)
addi $sp,$sp,-4
sw $ra,0($sp)
jal printGame
lw $ra,0($sp)
addi $sp,$sp,4
# if FunCallExpr(won,ArrayBuffer(VarExpr(mark))) then
lb v381,-4($fp)
addi $sp,$sp,-4
sw v381,0($sp)
addi $sp,$sp,-4
addi $sp,$sp,-4
sw $ra,0($sp)
jal won
lw $ra,0($sp)
lw v382,4($sp)
addi $sp,$sp,12
beq v382,$zero,label_181_else
lw v383,0($fp)
addi $sp,$sp,-4
sw v383,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal printWinner
lw $ra,0($sp)
addi $sp,$sp,8
addi v384,$fp,4
li v385,0
sw v385,0(v384)
lw v384,0(v384)
j label_182_end
label_181_else:
# else:
# if BinOp(FunCallExpr(full,ArrayBuffer()),EQ,IntLiteral(1)) then
addi $sp,$sp,-4
addi $sp,$sp,-4
sw $ra,0($sp)
jal full
lw $ra,0($sp)
lw v386,4($sp)
addi $sp,$sp,8
li v388,1
xor v387,v386,v388
sltiu v387,v387,1
beq v387,$zero,label_183_else
la v389, label_35_main_str
addi $sp,$sp,-4
sw v389,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
addi v390,$fp,4
li v391,0
sw v391,0(v390)
lw v390,0(v390)
j label_184_end
label_183_else:
# else:
addi v392,$fp,0
lw v393,0($fp)
addi $sp,$sp,-4
sw v393,0($sp)
addi $sp,$sp,-4
addi $sp,$sp,-4
sw $ra,0($sp)
jal switchPlayer
lw $ra,0($sp)
lw v394,4($sp)
addi $sp,$sp,12
sw v394,0(v392)
lw v392,0(v392)
label_184_end:
label_182_end:
# if BinOp(VarExpr(playing),EQ,IntLiteral(0)) then
lw v395,4($fp)
li v397,0
xor v396,v395,v397
sltiu v396,v396,1
beq v396,$zero,label_185_else
la v398, label_36_main_str
addi $sp,$sp,-4
sw v398,0($sp)
addi $sp,$sp,-4
sw $ra,0($sp)
jal print_s
lw $ra,0($sp)
addi $sp,$sp,8
addi v399,$fp,-8
addi $sp,$sp,-4
addi $sp,$sp,-4
sw $ra,0($sp)
jal read_c
lw $ra,0($sp)
lb v400,4($sp)
addi $sp,$sp,8
sb v400,0(v399)
lw v399,0(v399)
# if BinOp(VarExpr(yesno),EQ,ChrLiteral(y)) then
lb v401,-8($fp)
li v403,121
xor v402,v401,v403
sltiu v402,v402,1
beq v402,$zero,label_187_else
addi v404,$fp,4
li v405,1
sw v405,0(v404)
lw v404,0(v404)
addi $sp,$sp,-4
sw $ra,0($sp)
jal reset
lw $ra,0($sp)
addi $sp,$sp,4
j label_188_end
label_187_else:
# else:
# if BinOp(VarExpr(yesno),EQ,ChrLiteral(Y)) then
lb v406,-8($fp)
li v408,89
xor v407,v406,v408
sltiu v407,v407,1
beq v407,$zero,label_189_else
addi v409,$fp,4
li v410,1
sw v410,0(v409)
lw v409,0(v409)
addi $sp,$sp,-4
sw $ra,0($sp)
jal reset
lw $ra,0($sp)
addi $sp,$sp,4
j label_190_end
label_189_else:
label_190_end:
label_188_end:
j label_186_end
label_185_else:
label_186_end:
lw v411,4($fp)
bnez v411,label_180_body
label_179_next:
# restore stack pointer
addi $sp,$sp,20
# restore frame pointer from stack
lw $fp,0($fp)
# ending program
li $v0,10
syscall

