; module
@buf#0 = global int [2,100], 800
define i32 @main(){
B24:
  %r1 = alloca int, 4
  %r3 = loadaddr @buf#0
  %r4 = add i32 0, 4 ; loadint
  %r5 = add i32 0, 100 ; loadint
  %r6 = mul i32 %r4, %r5
  %r7 = add i32 0, 0 ; loadint
  %r8 = mul i32 %r7, %r6
  %r9 = add i32 %r3, %r8
  %r2 = call i32 @getarray(i32 %r9)
  store i32 %r2, ptr %r1
  %r11 = add i32 0, 0 ; loadint
  %r12 = load i32, ptr %r1
  %r10 = call@merge_sort(i32 %r11, i32 %r12)
  %r14 = load i32, ptr %r1
  %r15 = loadaddr @buf#0
  %r16 = add i32 0, 4 ; loadint
  %r17 = add i32 0, 100 ; loadint
  %r18 = mul i32 %r16, %r17
  %r19 = add i32 0, 0 ; loadint
  %r20 = mul i32 %r19, %r18
  %r21 = add i32 %r15, %r20
  %r13 = call i32 @putarray(i32 %r14, i32 %r21)
  %r22 = add i32 0, 0 ; loadint
  ret i32 %r22

}
define void @merge_sort(i32, i32){
B0:
  %r3 = alloca int, 4
  store i32 %r1, ptr %r3
  %r4 = alloca int, 4
  store i32 %r2, ptr %r4
  br label %B1

B1:
  %r5 = load i32, ptr %r3
  %r6 = add i32 0, 1 ; loadint
  %r7 = add i32 %r5, %r6
  %r8 = load i32, ptr %r4
  %r9 = icmp sge i32 %r7, %r8
  br i1 %r9, label %B2, label %B3

B2:
  %r10 = add i32 0, 0 ; loadint
  ret i32 %r10

B3:
  %r11 = alloca int, 4
  %r12 = load i32, ptr %r3
  %r13 = load i32, ptr %r4
  %r14 = add i32 %r12, %r13
  %r15 = add i32 0, 2 ; loadint
  %r16 = sdiv i32 %r14, %r15
  store i32 %r16, ptr %r11
  %r18 = load i32, ptr %r3
  %r19 = load i32, ptr %r11
  %r17 = call i32 @merge_sort(i32 %r18, i32 %r19)
  %r21 = load i32, ptr %r11
  %r22 = load i32, ptr %r4
  %r20 = call i32 @merge_sort(i32 %r21, i32 %r22)
  %r23 = alloca int, 4
  %r24 = load i32, ptr %r3
  store i32 %r24, ptr %r23
  %r25 = alloca int, 4
  %r26 = load i32, ptr %r11
  store i32 %r26, ptr %r25
  %r27 = alloca int, 4
  %r28 = load i32, ptr %r3
  store i32 %r28, ptr %r27
  br label %B5

B5:
  %r29 = alloca int, 4
  %r30 = load i32, ptr %r23
  %r31 = load i32, ptr %r11
  %r32 = icmp slt i32 %r30, %r31
  br i1 %r32, label %B8, label %B9

B6:
  br label %B11

B7:
  br label %B15

B8:
  %r33 = load i32, ptr %r25
  %r34 = load i32, ptr %r4
  %r35 = icmp slt i32 %r33, %r34
  store i32 %r35, ptr %r29
  br label %B10

B9:
  %r36 = add i32 0, 0 ; loadint
  store i32 %r36, ptr %r29
  br label %B10

B10:
  %r37 = load i32, ptr %r29
  br i1 %r37, label %B6, label %B7

B11:
  %r38 = loadaddr @buf#0
  %r39 = add i32 0, 4 ; loadint
  %r40 = load i32, ptr %r23
  %r41 = mul i32 %r40, %r39
  %r42 = add i32 %r38, %r41
  %r43 = add i32 0, 100 ; loadint
  %r44 = mul i32 %r39, %r43
  %r45 = add i32 0, 0 ; loadint
  %r46 = mul i32 %r45, %r44
  %r47 = add i32 %r42, %r46
  %r48 = load i32, ptr %r47
  %r49 = loadaddr @buf#0
  %r50 = add i32 0, 4 ; loadint
  %r51 = load i32, ptr %r25
  %r52 = mul i32 %r51, %r50
  %r53 = add i32 %r49, %r52
  %r54 = add i32 0, 100 ; loadint
  %r55 = mul i32 %r50, %r54
  %r56 = add i32 0, 0 ; loadint
  %r57 = mul i32 %r56, %r55
  %r58 = add i32 %r53, %r57
  %r59 = load i32, ptr %r58
  %r60 = icmp slt i32 %r48, %r59
  br i1 %r60, label %B12, label %B13

B12:
  %r61 = loadaddr @buf#0
  %r62 = add i32 0, 4 ; loadint
  %r63 = load i32, ptr %r23
  %r64 = mul i32 %r63, %r62
  %r65 = add i32 %r61, %r64
  %r66 = add i32 0, 100 ; loadint
  %r67 = mul i32 %r62, %r66
  %r68 = add i32 0, 0 ; loadint
  %r69 = mul i32 %r68, %r67
  %r70 = add i32 %r65, %r69
  %r71 = load i32, ptr %r70
  %r72 = loadaddr @buf#0
  %r73 = loadaddr @buf#0
  %r74 = add i32 0, 4 ; loadint
  %r75 = load i32, ptr %r27
  %r76 = mul i32 %r75, %r74
  %r77 = add i32 %r73, %r76
  %r78 = add i32 0, 100 ; loadint
  %r79 = mul i32 %r74, %r78
  %r80 = add i32 0, 1 ; loadint
  %r81 = mul i32 %r80, %r79
  %r82 = add i32 %r77, %r81
  store i32 %r71, ptr %r82
  %r83 = load i32, ptr %r23
  %r84 = add i32 0, 1 ; loadint
  %r85 = add i32 %r83, %r84
  store i32 %r85, ptr %r23
  br label %B14

B13:
  %r86 = loadaddr @buf#0
  %r87 = add i32 0, 4 ; loadint
  %r88 = load i32, ptr %r25
  %r89 = mul i32 %r88, %r87
  %r90 = add i32 %r86, %r89
  %r91 = add i32 0, 100 ; loadint
  %r92 = mul i32 %r87, %r91
  %r93 = add i32 0, 0 ; loadint
  %r94 = mul i32 %r93, %r92
  %r95 = add i32 %r90, %r94
  %r96 = load i32, ptr %r95
  %r97 = loadaddr @buf#0
  %r98 = loadaddr @buf#0
  %r99 = add i32 0, 4 ; loadint
  %r100 = load i32, ptr %r27
  %r101 = mul i32 %r100, %r99
  %r102 = add i32 %r98, %r101
  %r103 = add i32 0, 100 ; loadint
  %r104 = mul i32 %r99, %r103
  %r105 = add i32 0, 1 ; loadint
  %r106 = mul i32 %r105, %r104
  %r107 = add i32 %r102, %r106
  store i32 %r96, ptr %r107
  %r108 = load i32, ptr %r25
  %r109 = add i32 0, 1 ; loadint
  %r110 = add i32 %r108, %r109
  store i32 %r110, ptr %r25
  br label %B14

B14:
  %r111 = load i32, ptr %r27
  %r112 = add i32 0, 1 ; loadint
  %r113 = add i32 %r111, %r112
  store i32 %r113, ptr %r27
  br label %B5

B15:
  %r114 = load i32, ptr %r23
  %r115 = load i32, ptr %r11
  %r116 = icmp slt i32 %r114, %r115
  br i1 %r116, label %B16, label %B17

B16:
  %r117 = loadaddr @buf#0
  %r118 = add i32 0, 4 ; loadint
  %r119 = load i32, ptr %r23
  %r120 = mul i32 %r119, %r118
  %r121 = add i32 %r117, %r120
  %r122 = add i32 0, 100 ; loadint
  %r123 = mul i32 %r118, %r122
  %r124 = add i32 0, 0 ; loadint
  %r125 = mul i32 %r124, %r123
  %r126 = add i32 %r121, %r125
  %r127 = load i32, ptr %r126
  %r128 = loadaddr @buf#0
  %r129 = loadaddr @buf#0
  %r130 = add i32 0, 4 ; loadint
  %r131 = load i32, ptr %r27
  %r132 = mul i32 %r131, %r130
  %r133 = add i32 %r129, %r132
  %r134 = add i32 0, 100 ; loadint
  %r135 = mul i32 %r130, %r134
  %r136 = add i32 0, 1 ; loadint
  %r137 = mul i32 %r136, %r135
  %r138 = add i32 %r133, %r137
  store i32 %r127, ptr %r138
  %r139 = load i32, ptr %r23
  %r140 = add i32 0, 1 ; loadint
  %r141 = add i32 %r139, %r140
  store i32 %r141, ptr %r23
  %r142 = load i32, ptr %r27
  %r143 = add i32 0, 1 ; loadint
  %r144 = add i32 %r142, %r143
  store i32 %r144, ptr %r27
  br label %B15

B17:
  br label %B18

B18:
  %r145 = load i32, ptr %r25
  %r146 = load i32, ptr %r4
  %r147 = icmp slt i32 %r145, %r146
  br i1 %r147, label %B19, label %B20

B19:
  %r148 = loadaddr @buf#0
  %r149 = add i32 0, 4 ; loadint
  %r150 = load i32, ptr %r25
  %r151 = mul i32 %r150, %r149
  %r152 = add i32 %r148, %r151
  %r153 = add i32 0, 100 ; loadint
  %r154 = mul i32 %r149, %r153
  %r155 = add i32 0, 0 ; loadint
  %r156 = mul i32 %r155, %r154
  %r157 = add i32 %r152, %r156
  %r158 = load i32, ptr %r157
  %r159 = loadaddr @buf#0
  %r160 = loadaddr @buf#0
  %r161 = add i32 0, 4 ; loadint
  %r162 = load i32, ptr %r27
  %r163 = mul i32 %r162, %r161
  %r164 = add i32 %r160, %r163
  %r165 = add i32 0, 100 ; loadint
  %r166 = mul i32 %r161, %r165
  %r167 = add i32 0, 1 ; loadint
  %r168 = mul i32 %r167, %r166
  %r169 = add i32 %r164, %r168
  store i32 %r158, ptr %r169
  %r170 = load i32, ptr %r25
  %r171 = add i32 0, 1 ; loadint
  %r172 = add i32 %r170, %r171
  store i32 %r172, ptr %r25
  %r173 = load i32, ptr %r27
  %r174 = add i32 0, 1 ; loadint
  %r175 = add i32 %r173, %r174
  store i32 %r175, ptr %r27
  br label %B18

B20:
  br label %B21

B21:
  %r176 = load i32, ptr %r3
  %r177 = load i32, ptr %r4
  %r178 = icmp slt i32 %r176, %r177
  br i1 %r178, label %B22, label %B23

B22:
  %r179 = loadaddr @buf#0
  %r180 = add i32 0, 4 ; loadint
  %r181 = load i32, ptr %r3
  %r182 = mul i32 %r181, %r180
  %r183 = add i32 %r179, %r182
  %r184 = add i32 0, 100 ; loadint
  %r185 = mul i32 %r180, %r184
  %r186 = add i32 0, 1 ; loadint
  %r187 = mul i32 %r186, %r185
  %r188 = add i32 %r183, %r187
  %r189 = load i32, ptr %r188
  %r190 = loadaddr @buf#0
  %r191 = loadaddr @buf#0
  %r192 = add i32 0, 4 ; loadint
  %r193 = load i32, ptr %r3
  %r194 = mul i32 %r193, %r192
  %r195 = add i32 %r191, %r194
  %r196 = add i32 0, 100 ; loadint
  %r197 = mul i32 %r192, %r196
  %r198 = add i32 0, 0 ; loadint
  %r199 = mul i32 %r198, %r197
  %r200 = add i32 %r195, %r199
  store i32 %r189, ptr %r200
  %r201 = load i32, ptr %r3
  %r202 = add i32 0, 1 ; loadint
  %r203 = add i32 %r201, %r202
  store i32 %r203, ptr %r3
  br label %B21

B23:

}
