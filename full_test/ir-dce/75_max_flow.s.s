; module
@INF#0 = global const int 1879048192, 4
@size#0 = global int [10], 40
@to#0 = global int [10,10], 400
@cap#0 = global int [10,10], 400
@rev#0 = global int [10,10], 400
@used#0 = global int [10], 40
define i32 @main(){
B40:
  %r1 = alloca int, 4
  %r2 = alloca int, 4
  %r3 = call i32 @getint()
  store i32 %r3, ptr %r1
  %r4 = call i32 @getint()
  store i32 %r4, ptr %r2
  %r6 = loadaddr @size#0
  %r7 = add i32 0, 0 ; loadint
  %r8 = add i32 0, 10 ; loadint
  %r5 = call@my_memset(i32 %r6, i32 %r7, i32 %r8)
  br label %B41

B41:
  %r9 = load i32, ptr %r2
  %r10 = add i32 0, 0 ; loadint
  %r11 = icmp sgt i32 %r9, %r10
  br i1 %r11, label %B42, label %B43

B42:
  %r12 = alloca int, 4
  %r13 = alloca int, 4
  %r14 = call i32 @getint()
  store i32 %r14, ptr %r12
  %r15 = call i32 @getint()
  store i32 %r15, ptr %r13
  %r16 = alloca int, 4
  %r17 = call i32 @getint()
  store i32 %r17, ptr %r16
  %r19 = load i32, ptr %r12
  %r20 = load i32, ptr %r13
  %r21 = load i32, ptr %r16
  %r18 = call@add_node(i32 %r19, i32 %r20, i32 %r21)
  %r22 = load i32, ptr %r2
  %r23 = add i32 0, 1 ; loadint
  %r24 = sub i32 %r22, %r23
  store i32 %r24, ptr %r2
  br label %B41

B43:
  %r27 = add i32 0, 1 ; loadint
  %r28 = load i32, ptr %r1
  %r26 = call i32 @max_flow(i32 %r27, i32 %r28)
  %r25 = call i32 @putint(i32 %r26)
  %r30 = add i32 0, 10 ; loadint
  %r29 = call i32 @putch(i32 %r30)
  %r31 = add i32 0, 0 ; loadint
  ret i32 %r31

}
define i32 @max_flow(i32, i32){
B32:
  %r3 = alloca int, 4
  store i32 %r1, ptr %r3
  %r4 = alloca int, 4
  store i32 %r2, ptr %r4
  %r5 = alloca int, 4
  %r6 = add i32 0, 0 ; loadint
  store i32 %r6, ptr %r5
  br label %B33

B33:
  br i1 %r7, label %B34, label %B35

B34:
  %r9 = loadaddr @used#0
  %r10 = add i32 0, 0 ; loadint
  %r11 = add i32 0, 10 ; loadint
  %r8 = call@my_memset(i32 %r9, i32 %r10, i32 %r11)
  %r12 = alloca int, 4
  %r14 = load i32, ptr %r3
  %r15 = load i32, ptr %r4
  %r16 = loadaddr @INF#0
  %r17 = load i32, ptr %r16
  %r13 = call i32 @dfs(i32 %r14, i32 %r15, i32 %r17)
  store i32 %r13, ptr %r12
  br label %B36

B35:

B36:
  %r18 = load i32, ptr %r12
  %r19 = add i32 0, 0 ; loadint
  %r20 = icmp eq i32 %r18, %r19
  br i1 %r20, label %B37, label %B38

B37:
  %r21 = load i32, ptr %r5
  ret i32 %r21

B38:
  %r22 = load i32, ptr %r5
  %r23 = load i32, ptr %r12
  %r24 = add i32 %r22, %r23
  store i32 %r24, ptr %r5
  br label %B33

}
define i32 @dfs(i32, i32, i32){
B7:
  %r4 = alloca int, 4
  store i32 %r1, ptr %r4
  %r5 = alloca int, 4
  store i32 %r2, ptr %r5
  %r6 = alloca int, 4
  store i32 %r3, ptr %r6
  br label %B8

B8:
  %r7 = load i32, ptr %r4
  %r8 = load i32, ptr %r5
  %r9 = icmp eq i32 %r7, %r8
  br i1 %r9, label %B9, label %B10

B9:
  %r10 = load i32, ptr %r6
  ret i32 %r10

B10:
  %r11 = add i32 0, 1 ; loadint
  %r12 = loadaddr @used#0
  %r13 = loadaddr @used#0
  %r14 = add i32 0, 4 ; loadint
  %r15 = load i32, ptr %r4
  %r16 = mul i32 %r15, %r14
  %r17 = add i32 %r13, %r16
  store i32 %r11, ptr %r17
  %r18 = alloca int, 4
  %r19 = add i32 0, 0 ; loadint
  store i32 %r19, ptr %r18
  br label %B12

B12:
  %r20 = load i32, ptr %r18
  %r21 = loadaddr @size#0
  %r22 = add i32 0, 4 ; loadint
  %r23 = load i32, ptr %r4
  %r24 = mul i32 %r23, %r22
  %r25 = add i32 %r21, %r24
  %r26 = load i32, ptr %r25
  %r27 = icmp slt i32 %r20, %r26
  br i1 %r27, label %B13, label %B14

B13:
  br label %B15

B14:
  %r199 = add i32 0, 0 ; loadint
  ret i32 %r199

B15:
  %r28 = loadaddr @used#0
  %r29 = add i32 0, 4 ; loadint
  %r30 = loadaddr @to#0
  %r31 = add i32 0, 4 ; loadint
  %r32 = load i32, ptr %r18
  %r33 = mul i32 %r32, %r31
  %r34 = add i32 %r30, %r33
  %r35 = add i32 0, 10 ; loadint
  %r36 = mul i32 %r31, %r35
  %r37 = load i32, ptr %r4
  %r38 = mul i32 %r37, %r36
  %r39 = add i32 %r34, %r38
  %r40 = load i32, ptr %r39
  %r41 = mul i32 %r40, %r29
  %r42 = add i32 %r28, %r41
  %r43 = load i32, ptr %r42
  br i1 %r43, label %B16, label %B17

B16:
  %r44 = load i32, ptr %r18
  %r45 = add i32 0, 1 ; loadint
  %r46 = add i32 %r44, %r45
  store i32 %r46, ptr %r18
  br label %B12

B17:
  br label %B19

B19:
  %r47 = loadaddr @cap#0
  %r48 = add i32 0, 4 ; loadint
  %r49 = load i32, ptr %r18
  %r50 = mul i32 %r49, %r48
  %r51 = add i32 %r47, %r50
  %r52 = add i32 0, 10 ; loadint
  %r53 = mul i32 %r48, %r52
  %r54 = load i32, ptr %r4
  %r55 = mul i32 %r54, %r53
  %r56 = add i32 %r51, %r55
  %r57 = load i32, ptr %r56
  %r58 = add i32 0, 0 ; loadint
  %r59 = icmp sle i32 %r57, %r58
  br i1 %r59, label %B20, label %B21

B20:
  %r60 = load i32, ptr %r18
  %r61 = add i32 0, 1 ; loadint
  %r62 = add i32 %r60, %r61
  store i32 %r62, ptr %r18
  br label %B12

B21:
  %r63 = alloca int, 4
  br label %B23

B23:
  %r64 = load i32, ptr %r6
  %r65 = loadaddr @cap#0
  %r66 = add i32 0, 4 ; loadint
  %r67 = load i32, ptr %r18
  %r68 = mul i32 %r67, %r66
  %r69 = add i32 %r65, %r68
  %r70 = add i32 0, 10 ; loadint
  %r71 = mul i32 %r66, %r70
  %r72 = load i32, ptr %r4
  %r73 = mul i32 %r72, %r71
  %r74 = add i32 %r69, %r73
  %r75 = load i32, ptr %r74
  %r76 = icmp slt i32 %r64, %r75
  br i1 %r76, label %B24, label %B25

B24:
  %r77 = load i32, ptr %r6
  store i32 %r77, ptr %r63
  br label %B26

B25:
  %r78 = loadaddr @cap#0
  %r79 = add i32 0, 4 ; loadint
  %r80 = load i32, ptr %r18
  %r81 = mul i32 %r80, %r79
  %r82 = add i32 %r78, %r81
  %r83 = add i32 0, 10 ; loadint
  %r84 = mul i32 %r79, %r83
  %r85 = load i32, ptr %r4
  %r86 = mul i32 %r85, %r84
  %r87 = add i32 %r82, %r86
  %r88 = load i32, ptr %r87
  store i32 %r88, ptr %r63
  br label %B26

B26:
  %r89 = alloca int, 4
  %r91 = loadaddr @to#0
  %r92 = add i32 0, 4 ; loadint
  %r93 = load i32, ptr %r18
  %r94 = mul i32 %r93, %r92
  %r95 = add i32 %r91, %r94
  %r96 = add i32 0, 10 ; loadint
  %r97 = mul i32 %r92, %r96
  %r98 = load i32, ptr %r4
  %r99 = mul i32 %r98, %r97
  %r100 = add i32 %r95, %r99
  %r101 = load i32, ptr %r100
  %r102 = load i32, ptr %r5
  %r103 = load i32, ptr %r63
  %r90 = call i32 @dfs(i32 %r101, i32 %r102, i32 %r103)
  store i32 %r90, ptr %r89
  br label %B27

B27:
  %r104 = load i32, ptr %r89
  %r105 = add i32 0, 0 ; loadint
  %r106 = icmp sgt i32 %r104, %r105
  br i1 %r106, label %B28, label %B29

B28:
  %r107 = loadaddr @cap#0
  %r108 = add i32 0, 4 ; loadint
  %r109 = load i32, ptr %r18
  %r110 = mul i32 %r109, %r108
  %r111 = add i32 %r107, %r110
  %r112 = add i32 0, 10 ; loadint
  %r113 = mul i32 %r108, %r112
  %r114 = load i32, ptr %r4
  %r115 = mul i32 %r114, %r113
  %r116 = add i32 %r111, %r115
  %r117 = load i32, ptr %r116
  %r118 = load i32, ptr %r89
  %r119 = sub i32 %r117, %r118
  %r120 = loadaddr @cap#0
  %r121 = loadaddr @cap#0
  %r122 = add i32 0, 4 ; loadint
  %r123 = load i32, ptr %r18
  %r124 = mul i32 %r123, %r122
  %r125 = add i32 %r121, %r124
  %r126 = add i32 0, 10 ; loadint
  %r127 = mul i32 %r122, %r126
  %r128 = load i32, ptr %r4
  %r129 = mul i32 %r128, %r127
  %r130 = add i32 %r125, %r129
  store i32 %r119, ptr %r130
  %r131 = loadaddr @cap#0
  %r132 = add i32 0, 4 ; loadint
  %r133 = loadaddr @rev#0
  %r134 = add i32 0, 4 ; loadint
  %r135 = load i32, ptr %r18
  %r136 = mul i32 %r135, %r134
  %r137 = add i32 %r133, %r136
  %r138 = add i32 0, 10 ; loadint
  %r139 = mul i32 %r134, %r138
  %r140 = load i32, ptr %r4
  %r141 = mul i32 %r140, %r139
  %r142 = add i32 %r137, %r141
  %r143 = load i32, ptr %r142
  %r144 = mul i32 %r143, %r132
  %r145 = add i32 %r131, %r144
  %r146 = add i32 0, 10 ; loadint
  %r147 = mul i32 %r132, %r146
  %r148 = loadaddr @to#0
  %r149 = add i32 0, 4 ; loadint
  %r150 = load i32, ptr %r18
  %r151 = mul i32 %r150, %r149
  %r152 = add i32 %r148, %r151
  %r153 = add i32 0, 10 ; loadint
  %r154 = mul i32 %r149, %r153
  %r155 = load i32, ptr %r4
  %r156 = mul i32 %r155, %r154
  %r157 = add i32 %r152, %r156
  %r158 = load i32, ptr %r157
  %r159 = mul i32 %r158, %r147
  %r160 = add i32 %r145, %r159
  %r161 = load i32, ptr %r160
  %r162 = load i32, ptr %r89
  %r163 = add i32 %r161, %r162
  %r164 = loadaddr @cap#0
  %r165 = loadaddr @cap#0
  %r166 = add i32 0, 4 ; loadint
  %r167 = loadaddr @rev#0
  %r168 = add i32 0, 4 ; loadint
  %r169 = load i32, ptr %r18
  %r170 = mul i32 %r169, %r168
  %r171 = add i32 %r167, %r170
  %r172 = add i32 0, 10 ; loadint
  %r173 = mul i32 %r168, %r172
  %r174 = load i32, ptr %r4
  %r175 = mul i32 %r174, %r173
  %r176 = add i32 %r171, %r175
  %r177 = load i32, ptr %r176
  %r178 = mul i32 %r177, %r166
  %r179 = add i32 %r165, %r178
  %r180 = add i32 0, 10 ; loadint
  %r181 = mul i32 %r166, %r180
  %r182 = loadaddr @to#0
  %r183 = add i32 0, 4 ; loadint
  %r184 = load i32, ptr %r18
  %r185 = mul i32 %r184, %r183
  %r186 = add i32 %r182, %r185
  %r187 = add i32 0, 10 ; loadint
  %r188 = mul i32 %r183, %r187
  %r189 = load i32, ptr %r4
  %r190 = mul i32 %r189, %r188
  %r191 = add i32 %r186, %r190
  %r192 = load i32, ptr %r191
  %r193 = mul i32 %r192, %r181
  %r194 = add i32 %r179, %r193
  store i32 %r163, ptr %r194
  %r195 = load i32, ptr %r89
  ret i32 %r195

B29:
  %r196 = load i32, ptr %r18
  %r197 = add i32 0, 1 ; loadint
  %r198 = add i32 %r196, %r197
  store i32 %r198, ptr %r18
  br label %B12

}
define void @add_node(i32, i32, i32){
B5:
  %r4 = alloca int, 4
  store i32 %r1, ptr %r4
  %r5 = alloca int, 4
  store i32 %r2, ptr %r5
  %r6 = alloca int, 4
  store i32 %r3, ptr %r6
  %r7 = load i32, ptr %r5
  %r8 = loadaddr @to#0
  %r9 = loadaddr @to#0
  %r10 = add i32 0, 4 ; loadint
  %r11 = loadaddr @size#0
  %r12 = add i32 0, 4 ; loadint
  %r13 = load i32, ptr %r4
  %r14 = mul i32 %r13, %r12
  %r15 = add i32 %r11, %r14
  %r16 = load i32, ptr %r15
  %r17 = mul i32 %r16, %r10
  %r18 = add i32 %r9, %r17
  %r19 = add i32 0, 10 ; loadint
  %r20 = mul i32 %r10, %r19
  %r21 = load i32, ptr %r4
  %r22 = mul i32 %r21, %r20
  %r23 = add i32 %r18, %r22
  store i32 %r7, ptr %r23
  %r24 = load i32, ptr %r6
  %r25 = loadaddr @cap#0
  %r26 = loadaddr @cap#0
  %r27 = add i32 0, 4 ; loadint
  %r28 = loadaddr @size#0
  %r29 = add i32 0, 4 ; loadint
  %r30 = load i32, ptr %r4
  %r31 = mul i32 %r30, %r29
  %r32 = add i32 %r28, %r31
  %r33 = load i32, ptr %r32
  %r34 = mul i32 %r33, %r27
  %r35 = add i32 %r26, %r34
  %r36 = add i32 0, 10 ; loadint
  %r37 = mul i32 %r27, %r36
  %r38 = load i32, ptr %r4
  %r39 = mul i32 %r38, %r37
  %r40 = add i32 %r35, %r39
  store i32 %r24, ptr %r40
  %r41 = loadaddr @size#0
  %r42 = add i32 0, 4 ; loadint
  %r43 = load i32, ptr %r5
  %r44 = mul i32 %r43, %r42
  %r45 = add i32 %r41, %r44
  %r46 = load i32, ptr %r45
  %r47 = loadaddr @rev#0
  %r48 = loadaddr @rev#0
  %r49 = add i32 0, 4 ; loadint
  %r50 = loadaddr @size#0
  %r51 = add i32 0, 4 ; loadint
  %r52 = load i32, ptr %r4
  %r53 = mul i32 %r52, %r51
  %r54 = add i32 %r50, %r53
  %r55 = load i32, ptr %r54
  %r56 = mul i32 %r55, %r49
  %r57 = add i32 %r48, %r56
  %r58 = add i32 0, 10 ; loadint
  %r59 = mul i32 %r49, %r58
  %r60 = load i32, ptr %r4
  %r61 = mul i32 %r60, %r59
  %r62 = add i32 %r57, %r61
  store i32 %r46, ptr %r62
  %r63 = load i32, ptr %r4
  %r64 = loadaddr @to#0
  %r65 = loadaddr @to#0
  %r66 = add i32 0, 4 ; loadint
  %r67 = loadaddr @size#0
  %r68 = add i32 0, 4 ; loadint
  %r69 = load i32, ptr %r5
  %r70 = mul i32 %r69, %r68
  %r71 = add i32 %r67, %r70
  %r72 = load i32, ptr %r71
  %r73 = mul i32 %r72, %r66
  %r74 = add i32 %r65, %r73
  %r75 = add i32 0, 10 ; loadint
  %r76 = mul i32 %r66, %r75
  %r77 = load i32, ptr %r5
  %r78 = mul i32 %r77, %r76
  %r79 = add i32 %r74, %r78
  store i32 %r63, ptr %r79
  %r80 = add i32 0, 0 ; loadint
  %r81 = loadaddr @cap#0
  %r82 = loadaddr @cap#0
  %r83 = add i32 0, 4 ; loadint
  %r84 = loadaddr @size#0
  %r85 = add i32 0, 4 ; loadint
  %r86 = load i32, ptr %r5
  %r87 = mul i32 %r86, %r85
  %r88 = add i32 %r84, %r87
  %r89 = load i32, ptr %r88
  %r90 = mul i32 %r89, %r83
  %r91 = add i32 %r82, %r90
  %r92 = add i32 0, 10 ; loadint
  %r93 = mul i32 %r83, %r92
  %r94 = load i32, ptr %r5
  %r95 = mul i32 %r94, %r93
  %r96 = add i32 %r91, %r95
  store i32 %r80, ptr %r96
  %r97 = loadaddr @size#0
  %r98 = add i32 0, 4 ; loadint
  %r99 = load i32, ptr %r4
  %r100 = mul i32 %r99, %r98
  %r101 = add i32 %r97, %r100
  %r102 = load i32, ptr %r101
  %r103 = loadaddr @rev#0
  %r104 = loadaddr @rev#0
  %r105 = add i32 0, 4 ; loadint
  %r106 = loadaddr @size#0
  %r107 = add i32 0, 4 ; loadint
  %r108 = load i32, ptr %r5
  %r109 = mul i32 %r108, %r107
  %r110 = add i32 %r106, %r109
  %r111 = load i32, ptr %r110
  %r112 = mul i32 %r111, %r105
  %r113 = add i32 %r104, %r112
  %r114 = add i32 0, 10 ; loadint
  %r115 = mul i32 %r105, %r114
  %r116 = load i32, ptr %r5
  %r117 = mul i32 %r116, %r115
  %r118 = add i32 %r113, %r117
  store i32 %r102, ptr %r118
  %r119 = loadaddr @size#0
  %r120 = add i32 0, 4 ; loadint
  %r121 = load i32, ptr %r4
  %r122 = mul i32 %r121, %r120
  %r123 = add i32 %r119, %r122
  %r124 = load i32, ptr %r123
  %r125 = add i32 0, 1 ; loadint
  %r126 = add i32 %r124, %r125
  %r127 = loadaddr @size#0
  %r128 = loadaddr @size#0
  %r129 = add i32 0, 4 ; loadint
  %r130 = load i32, ptr %r4
  %r131 = mul i32 %r130, %r129
  %r132 = add i32 %r128, %r131
  store i32 %r126, ptr %r132
  %r133 = loadaddr @size#0
  %r134 = add i32 0, 4 ; loadint
  %r135 = load i32, ptr %r5
  %r136 = mul i32 %r135, %r134
  %r137 = add i32 %r133, %r136
  %r138 = load i32, ptr %r137
  %r139 = add i32 0, 1 ; loadint
  %r140 = add i32 %r138, %r139
  %r141 = loadaddr @size#0
  %r142 = loadaddr @size#0
  %r143 = add i32 0, 4 ; loadint
  %r144 = load i32, ptr %r5
  %r145 = mul i32 %r144, %r143
  %r146 = add i32 %r142, %r145
  store i32 %r140, ptr %r146
  %r147 = add i32 0, 0 ; loadint
  ret i32 %r147

}
define void @my_memset(i32, i32, i32){
B0:
  %r4 = alloca int, 4
  store i32 %r2, ptr %r4
  %r5 = alloca int, 4
  store i32 %r3, ptr %r5
  %r6 = alloca int, 4
  %r7 = add i32 0, 0 ; loadint
  store i32 %r7, ptr %r6
  br label %B1

B1:
  %r8 = load i32, ptr %r6
  %r9 = load i32, ptr %r5
  %r10 = icmp slt i32 %r8, %r9
  br i1 %r10, label %B2, label %B3

B2:
  %r11 = load i32, ptr %r4
  %r12 = add i32 0, 4 ; loadint
  %r13 = load i32, ptr %r6
  %r14 = mul i32 %r13, %r12
  %r15 = add i32 %r1, %r14
  store i32 %r11, ptr %r15
  %r16 = load i32, ptr %r6
  %r17 = add i32 0, 1 ; loadint
  %r18 = add i32 %r16, %r17
  store i32 %r18, ptr %r6
  br label %B1

B3:
  %r19 = add i32 0, 0 ; loadint
  ret i32 %r19

}
