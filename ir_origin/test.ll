; module
@array = global i32, i32 440
@n = global i32, i32 4
define i32 @main(){
B17:
  %r1 = alloca i32, i32 4
  %r2 = alloca i32, i32 4
  %r3 = alloca i32, i32 4
  %r4 = alloca i32, i32 4
  %r5 = add i32 0, 1 ; loadint
  store t#11 i32 %r5, ptr %r1
  br label %B18

B18:
  %r6 = load t#11 i32, ptr %r1
  br i1 %r6, label %B19, label %B20

B19:
  %r7 = load t#11 i32, ptr %r1
  %r8 = add i32 0, 1 ; loadint
  %r9 = sub i32 %r7, %r8
  store t#11 i32 %r9, ptr %r1
  %r10 = add i32 0, 4 ; loadint
  %r11 = loadaddr @n#0
  store n#0 i32 %r10, ptr %r11
  %r12 = add i32 0, 10 ; loadint
  store m#11 i32 %r12, ptr %r2
  %r13 = alloca i32, i32 4
  %r14 = add i32 0, 0 ; loadint
  store i#13 i32 %r14, ptr %r13
  %r15 = alloca i32, i32 4
  %r16 = add i32 0, 0 ; loadint
  store flag#13 i32 %r16, ptr %r15
  %r18 = loadaddr @n#0
  %r19 = load n#0 i32, ptr %r18
  %r17 = call i32 @init(i32 %r19)
  %r20 = alloca i32, i32 4
  %r21 = loadaddr @n#0
  %r22 = load n#0 i32, ptr %r21
  %r23 = loadaddr @n#0
  %r24 = load n#0 i32, ptr %r23
  %r25 = mul i32 %r22, %r24
  %r26 = add i32 0, 1 ; loadint
  %r27 = add i32 %r25, %r26
  store k#13 i32 %r27, ptr %r20
  br label %B21

B20:
  %r229 = add i32 0, 0 ; loadint
  ret i32 %r229

B21:
  %r28 = load i#13 i32, ptr %r13
  %r29 = load m#11 i32, ptr %r2
  %r30 = icmp slt i32 %r28, %r29
  br i1 %r30, label %B22, label %B23

B22:
  %r31 = call i32 @getint()
  store a#11 i32 %r31, ptr %r3
  %r32 = call i32 @getint()
  store b#11 i32 %r32, ptr %r4
  br label %B24

B23:
  br label %B66

B24:
  %r33 = load flag#13 i32, ptr %r15
  %r35 = add i32 0, 0 ; loadint
  %r34 = icmp eq i32 %r35, %r33
  br i1 %r34, label %B25, label %B26

B25:
  %r36 = alloca i32, i32 4
  %r37 = loadaddr @n#0
  %r38 = load n#0 i32, ptr %r37
  %r39 = load a#11 i32, ptr %r3
  %r40 = add i32 0, 1 ; loadint
  %r41 = sub i32 %r39, %r40
  %r42 = mul i32 %r38, %r41
  %r43 = load b#11 i32, ptr %r4
  %r44 = add i32 %r42, %r43
  store loc#16 i32 %r44, ptr %r36
  %r45 = load loc#16 i32, ptr %r36
  %r46 = loadaddr @array#0
  %r47 = loadaddr @array#0
  %r48 = add i32 0, 4 ; loadint
  %r49 = load loc#16 i32, ptr %r36
  %r50 = mul i32 %r49, %r48
  %r51 = add i32 %r47, %r50
  store array#0 i32 %r45, ptr %r51
  br label %B27

B26:
  %r217 = load i#13 i32, ptr %r13
  %r218 = add i32 0, 1 ; loadint
  %r219 = add i32 %r217, %r218
  store i#13 i32 %r219, ptr %r13
  br label %B21

B27:
  %r52 = load a#11 i32, ptr %r3
  %r53 = add i32 0, 1 ; loadint
  %r54 = icmp eq i32 %r52, %r53
  br i1 %r54, label %B28, label %B29

B28:
  %r55 = add i32 0, 0 ; loadint
  %r56 = loadaddr @array#0
  %r57 = loadaddr @array#0
  %r58 = add i32 0, 4 ; loadint
  %r59 = add i32 0, 0 ; loadint
  %r60 = mul i32 %r59, %r58
  %r61 = add i32 %r57, %r60
  store array#0 i32 %r55, ptr %r61
  %r63 = load loc#16 i32, ptr %r36
  %r64 = add i32 0, 0 ; loadint
  %r62 = call i32 @mmerge(i32 %r63, i32 %r64)
  br label %B29

B29:
  br label %B30

B30:
  %r65 = load a#11 i32, ptr %r3
  %r66 = loadaddr @n#0
  %r67 = load n#0 i32, ptr %r66
  %r68 = icmp eq i32 %r65, %r67
  br i1 %r68, label %B31, label %B32

B31:
  %r69 = load k#13 i32, ptr %r20
  %r70 = loadaddr @array#0
  %r71 = loadaddr @array#0
  %r72 = add i32 0, 4 ; loadint
  %r73 = load k#13 i32, ptr %r20
  %r74 = mul i32 %r73, %r72
  %r75 = add i32 %r71, %r74
  store array#0 i32 %r69, ptr %r75
  %r77 = load loc#16 i32, ptr %r36
  %r78 = load k#13 i32, ptr %r20
  %r76 = call i32 @mmerge(i32 %r77, i32 %r78)
  br label %B32

B32:
  br label %B33

B33:
  %r79 = alloca i32, i32 4
  %r80 = load b#11 i32, ptr %r4
  %r81 = loadaddr @n#0
  %r82 = load n#0 i32, ptr %r81
  %r83 = icmp slt i32 %r80, %r82
  br i1 %r83, label %B34, label %B35

B34:
  %r84 = loadaddr @array#0
  %r85 = add i32 0, 4 ; loadint
  %r86 = load loc#16 i32, ptr %r36
  %r87 = add i32 0, 1 ; loadint
  %r88 = add i32 %r86, %r87
  %r89 = mul i32 %r88, %r85
  %r90 = add i32 %r84, %r89
  %r91 = load array#0 i32, ptr %r90
  %r92 = add i32 0, 1 ; loadint
  %r94 = add i32 0, 0 ; loadint
  %r93 = sub i32 %r94, %r92
  %r95 = icmp ne i32 %r91, %r93
  store logic_expr@#79 i32 %r95, ptr %r79
  br label %B36

B35:
  %r96 = add i32 0, 0 ; loadint
  store logic_expr@#79 i32 %r96, ptr %r79
  br label %B36

B36:
  %r97 = load logic_expr@#79 i32, ptr %r79
  br i1 %r97, label %B37, label %B38

B37:
  %r99 = load loc#16 i32, ptr %r36
  %r100 = load loc#16 i32, ptr %r36
  %r101 = add i32 0, 1 ; loadint
  %r102 = add i32 %r100, %r101
  %r98 = call i32 @mmerge(i32 %r99, i32 %r102)
  br label %B38

B38:
  br label %B39

B39:
  %r103 = alloca i32, i32 4
  %r104 = load b#11 i32, ptr %r4
  %r105 = add i32 0, 1 ; loadint
  %r106 = icmp sgt i32 %r104, %r105
  br i1 %r106, label %B40, label %B41

B40:
  %r107 = loadaddr @array#0
  %r108 = add i32 0, 4 ; loadint
  %r109 = load loc#16 i32, ptr %r36
  %r110 = add i32 0, 1 ; loadint
  %r111 = sub i32 %r109, %r110
  %r112 = mul i32 %r111, %r108
  %r113 = add i32 %r107, %r112
  %r114 = load array#0 i32, ptr %r113
  %r115 = add i32 0, 1 ; loadint
  %r117 = add i32 0, 0 ; loadint
  %r116 = sub i32 %r117, %r115
  %r118 = icmp ne i32 %r114, %r116
  store logic_expr@#103 i32 %r118, ptr %r103
  br label %B42

B41:
  %r119 = add i32 0, 0 ; loadint
  store logic_expr@#103 i32 %r119, ptr %r103
  br label %B42

B42:
  %r120 = load logic_expr@#103 i32, ptr %r103
  br i1 %r120, label %B43, label %B44

B43:
  %r122 = load loc#16 i32, ptr %r36
  %r123 = load loc#16 i32, ptr %r36
  %r124 = add i32 0, 1 ; loadint
  %r125 = sub i32 %r123, %r124
  %r121 = call i32 @mmerge(i32 %r122, i32 %r125)
  br label %B44

B44:
  br label %B45

B45:
  %r126 = alloca i32, i32 4
  %r127 = load a#11 i32, ptr %r3
  %r128 = loadaddr @n#0
  %r129 = load n#0 i32, ptr %r128
  %r130 = icmp slt i32 %r127, %r129
  br i1 %r130, label %B46, label %B47

B46:
  %r131 = loadaddr @array#0
  %r132 = add i32 0, 4 ; loadint
  %r133 = load loc#16 i32, ptr %r36
  %r134 = loadaddr @n#0
  %r135 = load n#0 i32, ptr %r134
  %r136 = add i32 %r133, %r135
  %r137 = mul i32 %r136, %r132
  %r138 = add i32 %r131, %r137
  %r139 = load array#0 i32, ptr %r138
  %r140 = add i32 0, 1 ; loadint
  %r142 = add i32 0, 0 ; loadint
  %r141 = sub i32 %r142, %r140
  %r143 = icmp ne i32 %r139, %r141
  store logic_expr@#126 i32 %r143, ptr %r126
  br label %B48

B47:
  %r144 = add i32 0, 0 ; loadint
  store logic_expr@#126 i32 %r144, ptr %r126
  br label %B48

B48:
  %r145 = load logic_expr@#126 i32, ptr %r126
  br i1 %r145, label %B49, label %B50

B49:
  %r147 = load loc#16 i32, ptr %r36
  %r148 = load loc#16 i32, ptr %r36
  %r149 = loadaddr @n#0
  %r150 = load n#0 i32, ptr %r149
  %r151 = add i32 %r148, %r150
  %r146 = call i32 @mmerge(i32 %r147, i32 %r151)
  br label %B50

B50:
  br label %B51

B51:
  %r152 = alloca i32, i32 4
  %r153 = load a#11 i32, ptr %r3
  %r154 = add i32 0, 1 ; loadint
  %r155 = icmp sgt i32 %r153, %r154
  br i1 %r155, label %B52, label %B53

B52:
  %r156 = loadaddr @array#0
  %r157 = add i32 0, 4 ; loadint
  %r158 = load loc#16 i32, ptr %r36
  %r159 = loadaddr @n#0
  %r160 = load n#0 i32, ptr %r159
  %r161 = sub i32 %r158, %r160
  %r162 = mul i32 %r161, %r157
  %r163 = add i32 %r156, %r162
  %r164 = load array#0 i32, ptr %r163
  %r165 = add i32 0, 1 ; loadint
  %r167 = add i32 0, 0 ; loadint
  %r166 = sub i32 %r167, %r165
  %r168 = icmp ne i32 %r164, %r166
  store logic_expr@#152 i32 %r168, ptr %r152
  br label %B54

B53:
  %r169 = add i32 0, 0 ; loadint
  store logic_expr@#152 i32 %r169, ptr %r152
  br label %B54

B54:
  %r170 = load logic_expr@#152 i32, ptr %r152
  br i1 %r170, label %B55, label %B56

B55:
  %r172 = load loc#16 i32, ptr %r36
  %r173 = load loc#16 i32, ptr %r36
  %r174 = loadaddr @n#0
  %r175 = load n#0 i32, ptr %r174
  %r176 = sub i32 %r173, %r175
  %r171 = call i32 @mmerge(i32 %r172, i32 %r176)
  br label %B56

B56:
  br label %B57

B57:
  %r177 = alloca i32, i32 4
  %r178 = alloca i32, i32 4
  %r179 = loadaddr @array#0
  %r180 = add i32 0, 4 ; loadint
  %r181 = add i32 0, 0 ; loadint
  %r182 = mul i32 %r181, %r180
  %r183 = add i32 %r179, %r182
  %r184 = load array#0 i32, ptr %r183
  %r185 = add i32 0, 1 ; loadint
  %r187 = add i32 0, 0 ; loadint
  %r186 = sub i32 %r187, %r185
  %r188 = icmp ne i32 %r184, %r186
  br i1 %r188, label %B58, label %B59

B58:
  %r189 = loadaddr @array#0
  %r190 = add i32 0, 4 ; loadint
  %r191 = load k#13 i32, ptr %r20
  %r192 = mul i32 %r191, %r190
  %r193 = add i32 %r189, %r192
  %r194 = load array#0 i32, ptr %r193
  %r195 = add i32 0, 1 ; loadint
  %r197 = add i32 0, 0 ; loadint
  %r196 = sub i32 %r197, %r195
  %r198 = icmp ne i32 %r194, %r196
  store logic_expr@#178 i32 %r198, ptr %r178
  br label %B60

B59:
  %r199 = add i32 0, 0 ; loadint
  store logic_expr@#178 i32 %r199, ptr %r178
  br label %B60

B60:
  %r200 = load logic_expr@#178 i32, ptr %r178
  br i1 %r200, label %B61, label %B62

B61:
  %r202 = add i32 0, 0 ; loadint
  %r201 = call i32 @findfa(i32 %r202)
  %r204 = load k#13 i32, ptr %r20
  %r203 = call i32 @findfa(i32 %r204)
  %r205 = icmp eq i32 %r201, %r203
  store logic_expr@#177 i32 %r205, ptr %r177
  br label %B63

B62:
  %r206 = add i32 0, 0 ; loadint
  store logic_expr@#177 i32 %r206, ptr %r177
  br label %B63

B63:
  %r207 = load logic_expr@#177 i32, ptr %r177
  br i1 %r207, label %B64, label %B65

B64:
  %r208 = add i32 0, 1 ; loadint
  store flag#13 i32 %r208, ptr %r15
  %r209 = alloca i32, i32 4
  %r210 = load i#13 i32, ptr %r13
  %r211 = add i32 0, 1 ; loadint
  %r212 = add i32 %r210, %r211
  store tmp#23 i32 %r212, ptr %r209
  %r214 = load tmp#23 i32, ptr %r209
  %r213 = call i32 @putint(i32 %r214)
  %r216 = add i32 0, 10 ; loadint
  %r215 = call i32 @putch(i32 %r216)
  br label %B65

B65:
  br label %B26

B66:
  %r220 = load flag#13 i32, ptr %r15
  %r222 = add i32 0, 0 ; loadint
  %r221 = icmp eq i32 %r222, %r220
  br i1 %r221, label %B67, label %B68

B67:
  %r224 = add i32 0, 1 ; loadint
  %r226 = add i32 0, 0 ; loadint
  %r225 = sub i32 %r226, %r224
  %r223 = call i32 @putint(i32 %r225)
  %r228 = add i32 0, 10 ; loadint
  %r227 = call i32 @putch(i32 %r228)
  br label %B68

B68:
  br label %B18

}
define void @mmerge(i32 %r1, i32 %r2){
B12:
  %r3 = alloca i32, i32 4
  store a#8 i32 %r1, ptr %r3
  %r4 = alloca i32, i32 4
  store b#8 i32 %r2, ptr %r4
  %r5 = alloca i32, i32 4
  %r7 = load a#8 i32, ptr %r3
  %r6 = call i32 @findfa(i32 %r7)
  store m#9 i32 %r6, ptr %r5
  %r8 = alloca i32, i32 4
  %r10 = load b#8 i32, ptr %r4
  %r9 = call i32 @findfa(i32 %r10)
  store n#9 i32 %r9, ptr %r8
  br label %B13

B13:
  %r11 = load m#9 i32, ptr %r5
  %r12 = load n#9 i32, ptr %r8
  %r13 = icmp ne i32 %r11, %r12
  br i1 %r13, label %B14, label %B15

B14:
  %r14 = load n#9 i32, ptr %r8
  %r15 = loadaddr @array#0
  %r16 = loadaddr @array#0
  %r17 = add i32 0, 4 ; loadint
  %r18 = load m#9 i32, ptr %r5
  %r19 = mul i32 %r18, %r17
  %r20 = add i32 %r16, %r19
  store array#0 i32 %r14, ptr %r20
  br label %B15

B15:
  %r21 = add i32 0, 0 ; loadint
  ret i32 %r21

}
define i32 @findfa(i32 %r1){
B5:
  %r2 = alloca i32, i32 4
  store a#5 i32 %r1, ptr %r2
  br label %B6

B6:
  %r3 = loadaddr @array#0
  %r4 = add i32 0, 4 ; loadint
  %r5 = load a#5 i32, ptr %r2
  %r6 = mul i32 %r5, %r4
  %r7 = add i32 %r3, %r6
  %r8 = load array#0 i32, ptr %r7
  %r9 = load a#5 i32, ptr %r2
  %r10 = icmp eq i32 %r8, %r9
  br i1 %r10, label %B7, label %B8

B7:
  %r11 = load a#5 i32, ptr %r2
  ret i32 %r11

B8:
  %r13 = loadaddr @array#0
  %r14 = add i32 0, 4 ; loadint
  %r15 = load a#5 i32, ptr %r2
  %r16 = mul i32 %r15, %r14
  %r17 = add i32 %r13, %r16
  %r18 = load array#0 i32, ptr %r17
  %r12 = call i32 @findfa(i32 %r18)
  %r19 = loadaddr @array#0
  %r20 = loadaddr @array#0
  %r21 = add i32 0, 4 ; loadint
  %r22 = load a#5 i32, ptr %r2
  %r23 = mul i32 %r22, %r21
  %r24 = add i32 %r20, %r23
  store array#0 i32 %r12, ptr %r24
  %r25 = loadaddr @array#0
  %r26 = add i32 0, 4 ; loadint
  %r27 = load a#5 i32, ptr %r2
  %r28 = mul i32 %r27, %r26
  %r29 = add i32 %r25, %r28
  %r30 = load array#0 i32, ptr %r29
  ret i32 %r30

}
define void @init(i32 %r1){
B0:
  %r2 = alloca i32, i32 4
  store n#1 i32 %r1, ptr %r2
  %r3 = alloca i32, i32 4
  %r4 = add i32 0, 1 ; loadint
  store i#2 i32 %r4, ptr %r3
  br label %B1

B1:
  %r5 = load i#2 i32, ptr %r3
  %r6 = load n#1 i32, ptr %r2
  %r7 = load n#1 i32, ptr %r2
  %r8 = mul i32 %r6, %r7
  %r9 = add i32 0, 1 ; loadint
  %r10 = add i32 %r8, %r9
  %r11 = icmp sle i32 %r5, %r10
  br i1 %r11, label %B2, label %B3

B2:
  %r12 = add i32 0, 1 ; loadint
  %r14 = add i32 0, 0 ; loadint
  %r13 = sub i32 %r14, %r12
  %r15 = loadaddr @array#0
  %r16 = loadaddr @array#0
  %r17 = add i32 0, 4 ; loadint
  %r18 = load i#2 i32, ptr %r3
  %r19 = mul i32 %r18, %r17
  %r20 = add i32 %r16, %r19
  store array#0 i32 %r13, ptr %r20
  %r21 = load i#2 i32, ptr %r3
  %r22 = add i32 0, 1 ; loadint
  %r23 = add i32 %r21, %r22
  store i#2 i32 %r23, ptr %r3
  br label %B1

B3:
  %r24 = add i32 0, 0 ; loadint
  ret i32 %r24

}
