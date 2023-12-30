; module
@n#0 = global int, 4
define i32 @avgPooling(i32, i32){
B85:
  %r3 = alloca int, 4
  store i32 %r2, ptr %r3
  %r4 = alloca int, 4
  %r5 = alloca int, 4
  %r6 = add i32 0, 0 ; loadint
  store i32 %r6, ptr %r5
  %r7 = add i32 0, 0 ; loadint
  store i32 %r7, ptr %r4
  %r8 = alloca int, 4
  br label %B86

B86:
  %r9 = load i32, ptr %r5
  %r10 = loadaddr @n#0
  %r11 = load i32, ptr %r10
  %r12 = icmp slt i32 %r9, %r11
  br i1 %r12, label %B87, label %B88

B87:
  br label %B89

B88:
  %r74 = loadaddr @n#0
  %r75 = load i32, ptr %r74
  %r76 = load i32, ptr %r3
  %r77 = sub i32 %r75, %r76
  %r78 = add i32 0, 1 ; loadint
  %r79 = add i32 %r77, %r78
  store i32 %r79, ptr %r5
  br label %B97

B89:
  %r13 = load i32, ptr %r5
  %r14 = load i32, ptr %r3
  %r15 = add i32 0, 1 ; loadint
  %r16 = sub i32 %r14, %r15
  %r17 = icmp slt i32 %r13, %r16
  br i1 %r17, label %B90, label %B91

B90:
  %r18 = load i32, ptr %r4
  %r19 = add i32 0, 4 ; loadint
  %r20 = load i32, ptr %r5
  %r21 = mul i32 %r20, %r19
  %r22 = add i32 %r1, %r21
  %r23 = load i32, ptr %r22
  %r24 = add i32 %r18, %r23
  store i32 %r24, ptr %r4
  br label %B92

B91:
  br label %B93

B92:
  %r71 = load i32, ptr %r5
  %r72 = add i32 0, 1 ; loadint
  %r73 = add i32 %r71, %r72
  store i32 %r73, ptr %r5
  br label %B86

B93:
  %r25 = load i32, ptr %r5
  %r26 = load i32, ptr %r3
  %r27 = add i32 0, 1 ; loadint
  %r28 = sub i32 %r26, %r27
  %r29 = icmp eq i32 %r25, %r28
  br i1 %r29, label %B94, label %B95

B94:
  %r30 = add i32 0, 4 ; loadint
  %r31 = add i32 0, 0 ; loadint
  %r32 = mul i32 %r31, %r30
  %r33 = add i32 %r1, %r32
  %r34 = load i32, ptr %r33
  store i32 %r34, ptr %r8
  %r35 = load i32, ptr %r4
  %r36 = load i32, ptr %r3
  %r37 = sdiv i32 %r35, %r36
  %r38 = add i32 0, 4 ; loadint
  %r39 = add i32 0, 0 ; loadint
  %r40 = mul i32 %r39, %r38
  %r41 = add i32 %r1, %r40
  store i32 %r37, ptr %r41
  br label %B96

B95:
  %r42 = load i32, ptr %r4
  %r43 = add i32 0, 4 ; loadint
  %r44 = load i32, ptr %r5
  %r45 = mul i32 %r44, %r43
  %r46 = add i32 %r1, %r45
  %r47 = load i32, ptr %r46
  %r48 = add i32 %r42, %r47
  %r49 = load i32, ptr %r8
  %r50 = sub i32 %r48, %r49
  store i32 %r50, ptr %r4
  %r51 = add i32 0, 4 ; loadint
  %r52 = load i32, ptr %r5
  %r53 = load i32, ptr %r3
  %r54 = sub i32 %r52, %r53
  %r55 = add i32 0, 1 ; loadint
  %r56 = add i32 %r54, %r55
  %r57 = mul i32 %r56, %r51
  %r58 = add i32 %r1, %r57
  %r59 = load i32, ptr %r58
  store i32 %r59, ptr %r8
  %r60 = load i32, ptr %r4
  %r61 = load i32, ptr %r3
  %r62 = sdiv i32 %r60, %r61
  %r63 = add i32 0, 4 ; loadint
  %r64 = load i32, ptr %r5
  %r65 = load i32, ptr %r3
  %r66 = sub i32 %r64, %r65
  %r67 = add i32 0, 1 ; loadint
  %r68 = add i32 %r66, %r67
  %r69 = mul i32 %r68, %r63
  %r70 = add i32 %r1, %r69
  store i32 %r62, ptr %r70
  br label %B96

B96:
  br label %B92

B97:
  %r80 = load i32, ptr %r5
  %r81 = loadaddr @n#0
  %r82 = load i32, ptr %r81
  %r83 = icmp slt i32 %r80, %r82
  br i1 %r83, label %B98, label %B99

B98:
  %r84 = add i32 0, 0 ; loadint
  %r85 = add i32 0, 4 ; loadint
  %r86 = load i32, ptr %r5
  %r87 = mul i32 %r86, %r85
  %r88 = add i32 %r1, %r87
  store i32 %r84, ptr %r88
  %r89 = load i32, ptr %r5
  %r90 = add i32 0, 1 ; loadint
  %r91 = add i32 %r89, %r90
  store i32 %r91, ptr %r5
  br label %B97

B99:
  %r92 = add i32 0, 0 ; loadint
  ret i32 %r92

}
define i32 @calSum(i32, i32){
B76:
  %r3 = alloca int, 4
  store i32 %r2, ptr %r3
  %r4 = alloca int, 4
  %r5 = add i32 0, 0 ; loadint
  store i32 %r5, ptr %r4
  %r6 = alloca int, 4
  %r7 = add i32 0, 0 ; loadint
  store i32 %r7, ptr %r6
  br label %B77

B77:
  %r8 = load i32, ptr %r6
  %r9 = loadaddr @n#0
  %r10 = load i32, ptr %r9
  %r11 = icmp slt i32 %r8, %r10
  br i1 %r11, label %B78, label %B79

B78:
  %r12 = load i32, ptr %r4
  %r13 = add i32 0, 4 ; loadint
  %r14 = load i32, ptr %r6
  %r15 = mul i32 %r14, %r13
  %r16 = add i32 %r1, %r15
  %r17 = load i32, ptr %r16
  %r18 = add i32 %r12, %r17
  store i32 %r18, ptr %r4
  br label %B80

B79:
  %r40 = add i32 0, 0 ; loadint
  ret i32 %r40

B80:
  %r19 = load i32, ptr %r6
  %r20 = load i32, ptr %r3
  %r21 = srem i32 %r19, %r20
  %r22 = load i32, ptr %r3
  %r23 = add i32 0, 1 ; loadint
  %r24 = sub i32 %r22, %r23
  %r25 = icmp ne i32 %r21, %r24
  br i1 %r25, label %B81, label %B82

B81:
  %r26 = add i32 0, 0 ; loadint
  %r27 = add i32 0, 4 ; loadint
  %r28 = load i32, ptr %r6
  %r29 = mul i32 %r28, %r27
  %r30 = add i32 %r1, %r29
  store i32 %r26, ptr %r30
  br label %B83

B82:
  %r31 = load i32, ptr %r4
  %r32 = add i32 0, 4 ; loadint
  %r33 = load i32, ptr %r6
  %r34 = mul i32 %r33, %r32
  %r35 = add i32 %r1, %r34
  store i32 %r31, ptr %r35
  %r36 = add i32 0, 0 ; loadint
  store i32 %r36, ptr %r4
  br label %B83

B83:
  %r37 = load i32, ptr %r6
  %r38 = add i32 0, 1 ; loadint
  %r39 = add i32 %r37, %r38
  store i32 %r39, ptr %r6
  br label %B77

}
define i32 @arrCopy(i32, i32){
B71:
  %r3 = alloca int, 4
  %r4 = add i32 0, 0 ; loadint
  store i32 %r4, ptr %r3
  br label %B72

B72:
  %r5 = load i32, ptr %r3
  %r6 = loadaddr @n#0
  %r7 = load i32, ptr %r6
  %r8 = icmp slt i32 %r5, %r7
  br i1 %r8, label %B73, label %B74

B73:
  %r9 = add i32 0, 4 ; loadint
  %r10 = load i32, ptr %r3
  %r11 = mul i32 %r10, %r9
  %r12 = add i32 %r1, %r11
  %r13 = load i32, ptr %r12
  %r14 = add i32 0, 4 ; loadint
  %r15 = load i32, ptr %r3
  %r16 = mul i32 %r15, %r14
  %r17 = add i32 %r2, %r16
  store i32 %r13, ptr %r17
  %r18 = load i32, ptr %r3
  %r19 = add i32 0, 1 ; loadint
  %r20 = add i32 %r18, %r19
  store i32 %r20, ptr %r3
  br label %B72

B74:
  %r21 = add i32 0, 0 ; loadint
  ret i32 %r21

}
define i32 @main(){
B101:
  %r1 = add i32 0, 32 ; loadint
  %r2 = loadaddr @n#0
  store i32 %r1, ptr %r2
  %r3 = alloca int [32], 128
  %r4 = alloca int [32], 128
  %r5 = add i32 0, 7 ; loadint
  %r6 = add i32 0, 4 ; loadint
  %r7 = add i32 0, 0 ; loadint
  %r8 = mul i32 %r7, %r6
  %r9 = add i32 %r3, %r8
  store i32 %r5, ptr %r9
  %r10 = add i32 0, 23 ; loadint
  %r11 = add i32 0, 4 ; loadint
  %r12 = add i32 0, 1 ; loadint
  %r13 = mul i32 %r12, %r11
  %r14 = add i32 %r3, %r13
  store i32 %r10, ptr %r14
  %r15 = add i32 0, 89 ; loadint
  %r16 = add i32 0, 4 ; loadint
  %r17 = add i32 0, 2 ; loadint
  %r18 = mul i32 %r17, %r16
  %r19 = add i32 %r3, %r18
  store i32 %r15, ptr %r19
  %r20 = add i32 0, 26 ; loadint
  %r21 = add i32 0, 4 ; loadint
  %r22 = add i32 0, 3 ; loadint
  %r23 = mul i32 %r22, %r21
  %r24 = add i32 %r3, %r23
  store i32 %r20, ptr %r24
  %r25 = add i32 0, 282 ; loadint
  %r26 = add i32 0, 4 ; loadint
  %r27 = add i32 0, 4 ; loadint
  %r28 = mul i32 %r27, %r26
  %r29 = add i32 %r3, %r28
  store i32 %r25, ptr %r29
  %r30 = add i32 0, 254 ; loadint
  %r31 = add i32 0, 4 ; loadint
  %r32 = add i32 0, 5 ; loadint
  %r33 = mul i32 %r32, %r31
  %r34 = add i32 %r3, %r33
  store i32 %r30, ptr %r34
  %r35 = add i32 0, 27 ; loadint
  %r36 = add i32 0, 4 ; loadint
  %r37 = add i32 0, 6 ; loadint
  %r38 = mul i32 %r37, %r36
  %r39 = add i32 %r3, %r38
  store i32 %r35, ptr %r39
  %r40 = add i32 0, 5 ; loadint
  %r41 = add i32 0, 4 ; loadint
  %r42 = add i32 0, 7 ; loadint
  %r43 = mul i32 %r42, %r41
  %r44 = add i32 %r3, %r43
  store i32 %r40, ptr %r44
  %r45 = add i32 0, 83 ; loadint
  %r46 = add i32 0, 4 ; loadint
  %r47 = add i32 0, 8 ; loadint
  %r48 = mul i32 %r47, %r46
  %r49 = add i32 %r3, %r48
  store i32 %r45, ptr %r49
  %r50 = add i32 0, 273 ; loadint
  %r51 = add i32 0, 4 ; loadint
  %r52 = add i32 0, 9 ; loadint
  %r53 = mul i32 %r52, %r51
  %r54 = add i32 %r3, %r53
  store i32 %r50, ptr %r54
  %r55 = add i32 0, 574 ; loadint
  %r56 = add i32 0, 4 ; loadint
  %r57 = add i32 0, 10 ; loadint
  %r58 = mul i32 %r57, %r56
  %r59 = add i32 %r3, %r58
  store i32 %r55, ptr %r59
  %r60 = add i32 0, 905 ; loadint
  %r61 = add i32 0, 4 ; loadint
  %r62 = add i32 0, 11 ; loadint
  %r63 = mul i32 %r62, %r61
  %r64 = add i32 %r3, %r63
  store i32 %r60, ptr %r64
  %r65 = add i32 0, 354 ; loadint
  %r66 = add i32 0, 4 ; loadint
  %r67 = add i32 0, 12 ; loadint
  %r68 = mul i32 %r67, %r66
  %r69 = add i32 %r3, %r68
  store i32 %r65, ptr %r69
  %r70 = add i32 0, 657 ; loadint
  %r71 = add i32 0, 4 ; loadint
  %r72 = add i32 0, 13 ; loadint
  %r73 = mul i32 %r72, %r71
  %r74 = add i32 %r3, %r73
  store i32 %r70, ptr %r74
  %r75 = add i32 0, 935 ; loadint
  %r76 = add i32 0, 4 ; loadint
  %r77 = add i32 0, 14 ; loadint
  %r78 = mul i32 %r77, %r76
  %r79 = add i32 %r3, %r78
  store i32 %r75, ptr %r79
  %r80 = add i32 0, 264 ; loadint
  %r81 = add i32 0, 4 ; loadint
  %r82 = add i32 0, 15 ; loadint
  %r83 = mul i32 %r82, %r81
  %r84 = add i32 %r3, %r83
  store i32 %r80, ptr %r84
  %r85 = add i32 0, 639 ; loadint
  %r86 = add i32 0, 4 ; loadint
  %r87 = add i32 0, 16 ; loadint
  %r88 = mul i32 %r87, %r86
  %r89 = add i32 %r3, %r88
  store i32 %r85, ptr %r89
  %r90 = add i32 0, 459 ; loadint
  %r91 = add i32 0, 4 ; loadint
  %r92 = add i32 0, 17 ; loadint
  %r93 = mul i32 %r92, %r91
  %r94 = add i32 %r3, %r93
  store i32 %r90, ptr %r94
  %r95 = add i32 0, 29 ; loadint
  %r96 = add i32 0, 4 ; loadint
  %r97 = add i32 0, 18 ; loadint
  %r98 = mul i32 %r97, %r96
  %r99 = add i32 %r3, %r98
  store i32 %r95, ptr %r99
  %r100 = add i32 0, 68 ; loadint
  %r101 = add i32 0, 4 ; loadint
  %r102 = add i32 0, 19 ; loadint
  %r103 = mul i32 %r102, %r101
  %r104 = add i32 %r3, %r103
  store i32 %r100, ptr %r104
  %r105 = add i32 0, 929 ; loadint
  %r106 = add i32 0, 4 ; loadint
  %r107 = add i32 0, 20 ; loadint
  %r108 = mul i32 %r107, %r106
  %r109 = add i32 %r3, %r108
  store i32 %r105, ptr %r109
  %r110 = add i32 0, 756 ; loadint
  %r111 = add i32 0, 4 ; loadint
  %r112 = add i32 0, 21 ; loadint
  %r113 = mul i32 %r112, %r111
  %r114 = add i32 %r3, %r113
  store i32 %r110, ptr %r114
  %r115 = add i32 0, 452 ; loadint
  %r116 = add i32 0, 4 ; loadint
  %r117 = add i32 0, 22 ; loadint
  %r118 = mul i32 %r117, %r116
  %r119 = add i32 %r3, %r118
  store i32 %r115, ptr %r119
  %r120 = add i32 0, 279 ; loadint
  %r121 = add i32 0, 4 ; loadint
  %r122 = add i32 0, 23 ; loadint
  %r123 = mul i32 %r122, %r121
  %r124 = add i32 %r3, %r123
  store i32 %r120, ptr %r124
  %r125 = add i32 0, 58 ; loadint
  %r126 = add i32 0, 4 ; loadint
  %r127 = add i32 0, 24 ; loadint
  %r128 = mul i32 %r127, %r126
  %r129 = add i32 %r3, %r128
  store i32 %r125, ptr %r129
  %r130 = add i32 0, 87 ; loadint
  %r131 = add i32 0, 4 ; loadint
  %r132 = add i32 0, 25 ; loadint
  %r133 = mul i32 %r132, %r131
  %r134 = add i32 %r3, %r133
  store i32 %r130, ptr %r134
  %r135 = add i32 0, 96 ; loadint
  %r136 = add i32 0, 4 ; loadint
  %r137 = add i32 0, 26 ; loadint
  %r138 = mul i32 %r137, %r136
  %r139 = add i32 %r3, %r138
  store i32 %r135, ptr %r139
  %r140 = add i32 0, 36 ; loadint
  %r141 = add i32 0, 4 ; loadint
  %r142 = add i32 0, 27 ; loadint
  %r143 = mul i32 %r142, %r141
  %r144 = add i32 %r3, %r143
  store i32 %r140, ptr %r144
  %r145 = add i32 0, 39 ; loadint
  %r146 = add i32 0, 4 ; loadint
  %r147 = add i32 0, 28 ; loadint
  %r148 = mul i32 %r147, %r146
  %r149 = add i32 %r3, %r148
  store i32 %r145, ptr %r149
  %r150 = add i32 0, 28 ; loadint
  %r151 = add i32 0, 4 ; loadint
  %r152 = add i32 0, 29 ; loadint
  %r153 = mul i32 %r152, %r151
  %r154 = add i32 %r3, %r153
  store i32 %r150, ptr %r154
  %r155 = add i32 0, 1 ; loadint
  %r156 = add i32 0, 4 ; loadint
  %r157 = add i32 0, 30 ; loadint
  %r158 = mul i32 %r157, %r156
  %r159 = add i32 %r3, %r158
  store i32 %r155, ptr %r159
  %r160 = add i32 0, 290 ; loadint
  %r161 = add i32 0, 4 ; loadint
  %r162 = add i32 0, 31 ; loadint
  %r163 = mul i32 %r162, %r161
  %r164 = add i32 %r3, %r163
  store i32 %r160, ptr %r164
  %r165 = alloca int, 4
  %r166 = call i32 @arrCopy(i32 %r3, i32 %r4)
  store i32 %r166, ptr %r165
  %r167 = call i32 @revert(i32 %r4)
  store i32 %r167, ptr %r165
  %r168 = alloca int, 4
  %r169 = add i32 0, 0 ; loadint
  store i32 %r169, ptr %r168
  br label %B102

B102:
  %r170 = load i32, ptr %r168
  %r171 = add i32 0, 32 ; loadint
  %r172 = icmp slt i32 %r170, %r171
  br i1 %r172, label %B103, label %B104

B103:
  %r173 = add i32 0, 4 ; loadint
  %r174 = load i32, ptr %r168
  %r175 = mul i32 %r174, %r173
  %r176 = add i32 %r4, %r175
  %r177 = load i32, ptr %r176
  store i32 %r177, ptr %r165
  %r179 = load i32, ptr %r165
  %r178 = call i32 @putint(i32 %r179)
  %r180 = load i32, ptr %r168
  %r181 = add i32 0, 1 ; loadint
  %r182 = add i32 %r180, %r181
  store i32 %r182, ptr %r168
  br label %B102

B104:
  %r183 = call i32 @bubblesort(i32 %r4)
  store i32 %r183, ptr %r165
  %r184 = add i32 0, 0 ; loadint
  store i32 %r184, ptr %r168
  br label %B105

B105:
  %r185 = load i32, ptr %r168
  %r186 = add i32 0, 32 ; loadint
  %r187 = icmp slt i32 %r185, %r186
  br i1 %r187, label %B106, label %B107

B106:
  %r188 = add i32 0, 4 ; loadint
  %r189 = load i32, ptr %r168
  %r190 = mul i32 %r189, %r188
  %r191 = add i32 %r4, %r190
  %r192 = load i32, ptr %r191
  store i32 %r192, ptr %r165
  %r194 = load i32, ptr %r165
  %r193 = call i32 @putint(i32 %r194)
  %r195 = load i32, ptr %r168
  %r196 = add i32 0, 1 ; loadint
  %r197 = add i32 %r195, %r196
  store i32 %r197, ptr %r168
  br label %B105

B107:
  %r198 = call i32 @getMid(i32 %r4)
  store i32 %r198, ptr %r165
  %r200 = load i32, ptr %r165
  %r199 = call i32 @putint(i32 %r200)
  %r201 = call i32 @getMost(i32 %r4)
  store i32 %r201, ptr %r165
  %r203 = load i32, ptr %r165
  %r202 = call i32 @putint(i32 %r203)
  %r204 = call i32 @arrCopy(i32 %r3, i32 %r4)
  store i32 %r204, ptr %r165
  %r205 = call i32 @bubblesort(i32 %r4)
  store i32 %r205, ptr %r165
  %r206 = add i32 0, 0 ; loadint
  store i32 %r206, ptr %r168
  br label %B108

B108:
  %r207 = load i32, ptr %r168
  %r208 = add i32 0, 32 ; loadint
  %r209 = icmp slt i32 %r207, %r208
  br i1 %r209, label %B109, label %B110

B109:
  %r210 = add i32 0, 4 ; loadint
  %r211 = load i32, ptr %r168
  %r212 = mul i32 %r211, %r210
  %r213 = add i32 %r4, %r212
  %r214 = load i32, ptr %r213
  store i32 %r214, ptr %r165
  %r216 = load i32, ptr %r165
  %r215 = call i32 @putint(i32 %r216)
  %r217 = load i32, ptr %r168
  %r218 = add i32 0, 1 ; loadint
  %r219 = add i32 %r217, %r218
  store i32 %r219, ptr %r168
  br label %B108

B110:
  %r220 = call i32 @arrCopy(i32 %r3, i32 %r4)
  store i32 %r220, ptr %r165
  %r221 = call i32 @insertsort(i32 %r4)
  store i32 %r221, ptr %r165
  %r222 = add i32 0, 0 ; loadint
  store i32 %r222, ptr %r168
  br label %B111

B111:
  %r223 = load i32, ptr %r168
  %r224 = add i32 0, 32 ; loadint
  %r225 = icmp slt i32 %r223, %r224
  br i1 %r225, label %B112, label %B113

B112:
  %r226 = add i32 0, 4 ; loadint
  %r227 = load i32, ptr %r168
  %r228 = mul i32 %r227, %r226
  %r229 = add i32 %r4, %r228
  %r230 = load i32, ptr %r229
  store i32 %r230, ptr %r165
  %r232 = load i32, ptr %r165
  %r231 = call i32 @putint(i32 %r232)
  %r233 = load i32, ptr %r168
  %r234 = add i32 0, 1 ; loadint
  %r235 = add i32 %r233, %r234
  store i32 %r235, ptr %r168
  br label %B111

B113:
  %r236 = call i32 @arrCopy(i32 %r3, i32 %r4)
  store i32 %r236, ptr %r165
  %r237 = add i32 0, 0 ; loadint
  store i32 %r237, ptr %r168
  %r238 = add i32 0, 31 ; loadint
  store i32 %r238, ptr %r165
  %r240 = load i32, ptr %r168
  %r241 = load i32, ptr %r165
  %r239 = call i32 @QuickSort(i32 %r4, i32 %r240, i32 %r241)
  store i32 %r239, ptr %r165
  br label %B114

B114:
  %r242 = load i32, ptr %r168
  %r243 = add i32 0, 32 ; loadint
  %r244 = icmp slt i32 %r242, %r243
  br i1 %r244, label %B115, label %B116

B115:
  %r245 = add i32 0, 4 ; loadint
  %r246 = load i32, ptr %r168
  %r247 = mul i32 %r246, %r245
  %r248 = add i32 %r4, %r247
  %r249 = load i32, ptr %r248
  store i32 %r249, ptr %r165
  %r251 = load i32, ptr %r165
  %r250 = call i32 @putint(i32 %r251)
  %r252 = load i32, ptr %r168
  %r253 = add i32 0, 1 ; loadint
  %r254 = add i32 %r252, %r253
  store i32 %r254, ptr %r168
  br label %B114

B116:
  %r255 = call i32 @arrCopy(i32 %r3, i32 %r4)
  store i32 %r255, ptr %r165
  %r257 = add i32 0, 4 ; loadint
  %r256 = call i32 @calSum(i32 %r4, i32 %r257)
  store i32 %r256, ptr %r165
  %r258 = add i32 0, 0 ; loadint
  store i32 %r258, ptr %r168
  br label %B117

B117:
  %r259 = load i32, ptr %r168
  %r260 = add i32 0, 32 ; loadint
  %r261 = icmp slt i32 %r259, %r260
  br i1 %r261, label %B118, label %B119

B118:
  %r262 = add i32 0, 4 ; loadint
  %r263 = load i32, ptr %r168
  %r264 = mul i32 %r263, %r262
  %r265 = add i32 %r4, %r264
  %r266 = load i32, ptr %r265
  store i32 %r266, ptr %r165
  %r268 = load i32, ptr %r165
  %r267 = call i32 @putint(i32 %r268)
  %r269 = load i32, ptr %r168
  %r270 = add i32 0, 1 ; loadint
  %r271 = add i32 %r269, %r270
  store i32 %r271, ptr %r168
  br label %B117

B119:
  %r272 = call i32 @arrCopy(i32 %r3, i32 %r4)
  store i32 %r272, ptr %r165
  %r274 = add i32 0, 3 ; loadint
  %r273 = call i32 @avgPooling(i32 %r4, i32 %r274)
  store i32 %r273, ptr %r165
  %r275 = add i32 0, 0 ; loadint
  store i32 %r275, ptr %r168
  br label %B120

B120:
  %r276 = load i32, ptr %r168
  %r277 = add i32 0, 32 ; loadint
  %r278 = icmp slt i32 %r276, %r277
  br i1 %r278, label %B121, label %B122

B121:
  %r279 = add i32 0, 4 ; loadint
  %r280 = load i32, ptr %r168
  %r281 = mul i32 %r280, %r279
  %r282 = add i32 %r4, %r281
  %r283 = load i32, ptr %r282
  store i32 %r283, ptr %r165
  %r285 = load i32, ptr %r165
  %r284 = call i32 @putint(i32 %r285)
  %r286 = load i32, ptr %r168
  %r287 = add i32 0, 1 ; loadint
  %r288 = add i32 %r286, %r287
  store i32 %r288, ptr %r168
  br label %B120

B122:
  %r289 = add i32 0, 0 ; loadint
  ret i32 %r289

}
define i32 @revert(i32){
B66:
  %r2 = alloca int, 4
  %r3 = alloca int, 4
  %r4 = alloca int, 4
  %r5 = add i32 0, 0 ; loadint
  store i32 %r5, ptr %r3
  %r6 = add i32 0, 0 ; loadint
  store i32 %r6, ptr %r4
  br label %B67

B67:
  %r7 = load i32, ptr %r3
  %r8 = load i32, ptr %r4
  %r9 = icmp slt i32 %r7, %r8
  br i1 %r9, label %B68, label %B69

B68:
  %r10 = add i32 0, 4 ; loadint
  %r11 = load i32, ptr %r3
  %r12 = mul i32 %r11, %r10
  %r13 = add i32 %r1, %r12
  %r14 = load i32, ptr %r13
  store i32 %r14, ptr %r2
  %r15 = add i32 0, 4 ; loadint
  %r16 = load i32, ptr %r4
  %r17 = mul i32 %r16, %r15
  %r18 = add i32 %r1, %r17
  %r19 = load i32, ptr %r18
  %r20 = add i32 0, 4 ; loadint
  %r21 = load i32, ptr %r3
  %r22 = mul i32 %r21, %r20
  %r23 = add i32 %r1, %r22
  store i32 %r19, ptr %r23
  %r24 = load i32, ptr %r2
  %r25 = add i32 0, 4 ; loadint
  %r26 = load i32, ptr %r4
  %r27 = mul i32 %r26, %r25
  %r28 = add i32 %r1, %r27
  store i32 %r24, ptr %r28
  %r29 = load i32, ptr %r3
  %r30 = add i32 0, 1 ; loadint
  %r31 = add i32 %r29, %r30
  store i32 %r31, ptr %r3
  %r32 = load i32, ptr %r4
  %r33 = add i32 0, 1 ; loadint
  %r34 = sub i32 %r32, %r33
  store i32 %r34, ptr %r4
  br label %B67

B69:
  %r35 = add i32 0, 0 ; loadint
  ret i32 %r35

}
define i32 @QuickSort(i32, i32, i32){
B22:
  %r4 = alloca int, 4
  store i32 %r2, ptr %r4
  %r5 = alloca int, 4
  store i32 %r3, ptr %r5
  br label %B23

B23:
  %r6 = load i32, ptr %r4
  %r7 = load i32, ptr %r5
  %r8 = icmp slt i32 %r6, %r7
  br i1 %r8, label %B24, label %B25

B24:
  %r9 = alloca int, 4
  %r10 = load i32, ptr %r4
  store i32 %r10, ptr %r9
  %r11 = alloca int, 4
  %r12 = load i32, ptr %r5
  store i32 %r12, ptr %r11
  %r13 = alloca int, 4
  %r14 = add i32 0, 4 ; loadint
  %r15 = load i32, ptr %r4
  %r16 = mul i32 %r15, %r14
  %r17 = add i32 %r1, %r16
  %r18 = load i32, ptr %r17
  store i32 %r18, ptr %r13
  br label %B26

B25:
  %r104 = add i32 0, 0 ; loadint
  ret i32 %r104

B26:
  %r19 = load i32, ptr %r9
  %r20 = load i32, ptr %r11
  %r21 = icmp slt i32 %r19, %r20
  br i1 %r21, label %B27, label %B28

B27:
  br label %B29

B28:
  %r86 = load i32, ptr %r13
  %r87 = add i32 0, 4 ; loadint
  %r88 = load i32, ptr %r9
  %r89 = mul i32 %r88, %r87
  %r90 = add i32 %r1, %r89
  store i32 %r86, ptr %r90
  %r91 = alloca int, 4
  %r92 = load i32, ptr %r9
  %r93 = add i32 0, 1 ; loadint
  %r94 = sub i32 %r92, %r93
  store i32 %r94, ptr %r91
  %r96 = load i32, ptr %r4
  %r97 = load i32, ptr %r91
  %r95 = call i32 @QuickSort(i32 %r1, i32 %r96, i32 %r97)
  store i32 %r95, ptr %r91
  %r98 = load i32, ptr %r9
  %r99 = add i32 0, 1 ; loadint
  %r100 = add i32 %r98, %r99
  store i32 %r100, ptr %r91
  %r102 = load i32, ptr %r91
  %r103 = load i32, ptr %r5
  %r101 = call i32 @QuickSort(i32 %r1, i32 %r102, i32 %r103)
  store i32 %r101, ptr %r91
  br label %B25

B29:
  %r22 = alloca int, 4
  %r23 = load i32, ptr %r9
  %r24 = load i32, ptr %r11
  %r25 = icmp slt i32 %r23, %r24
  br i1 %r25, label %B32, label %B33

B30:
  %r37 = load i32, ptr %r11
  %r38 = add i32 0, 1 ; loadint
  %r39 = sub i32 %r37, %r38
  store i32 %r39, ptr %r11
  br label %B29

B31:
  br label %B35

B32:
  %r26 = add i32 0, 4 ; loadint
  %r27 = load i32, ptr %r11
  %r28 = mul i32 %r27, %r26
  %r29 = add i32 %r1, %r28
  %r30 = load i32, ptr %r29
  %r31 = load i32, ptr %r13
  %r32 = add i32 0, 1 ; loadint
  %r33 = sub i32 %r31, %r32
  %r34 = icmp sgt i32 %r30, %r33
  store i32 %r34, ptr %r22
  br label %B34

B33:
  %r35 = add i32 0, 0 ; loadint
  store i32 %r35, ptr %r22
  br label %B34

B34:
  %r36 = load i32, ptr %r22
  br i1 %r36, label %B30, label %B31

B35:
  %r40 = load i32, ptr %r9
  %r41 = load i32, ptr %r11
  %r42 = icmp slt i32 %r40, %r41
  br i1 %r42, label %B36, label %B37

B36:
  %r43 = add i32 0, 4 ; loadint
  %r44 = load i32, ptr %r11
  %r45 = mul i32 %r44, %r43
  %r46 = add i32 %r1, %r45
  %r47 = load i32, ptr %r46
  %r48 = add i32 0, 4 ; loadint
  %r49 = load i32, ptr %r9
  %r50 = mul i32 %r49, %r48
  %r51 = add i32 %r1, %r50
  store i32 %r47, ptr %r51
  %r52 = load i32, ptr %r9
  %r53 = add i32 0, 1 ; loadint
  %r54 = add i32 %r52, %r53
  store i32 %r54, ptr %r9
  br label %B37

B37:
  br label %B38

B38:
  %r55 = alloca int, 4
  %r56 = load i32, ptr %r9
  %r57 = load i32, ptr %r11
  %r58 = icmp slt i32 %r56, %r57
  br i1 %r58, label %B41, label %B42

B39:
  %r68 = load i32, ptr %r9
  %r69 = add i32 0, 1 ; loadint
  %r70 = add i32 %r68, %r69
  store i32 %r70, ptr %r9
  br label %B38

B40:
  br label %B44

B41:
  %r59 = add i32 0, 4 ; loadint
  %r60 = load i32, ptr %r9
  %r61 = mul i32 %r60, %r59
  %r62 = add i32 %r1, %r61
  %r63 = load i32, ptr %r62
  %r64 = load i32, ptr %r13
  %r65 = icmp slt i32 %r63, %r64
  store i32 %r65, ptr %r55
  br label %B43

B42:
  %r66 = add i32 0, 0 ; loadint
  store i32 %r66, ptr %r55
  br label %B43

B43:
  %r67 = load i32, ptr %r55
  br i1 %r67, label %B39, label %B40

B44:
  %r71 = load i32, ptr %r9
  %r72 = load i32, ptr %r11
  %r73 = icmp slt i32 %r71, %r72
  br i1 %r73, label %B45, label %B46

B45:
  %r74 = add i32 0, 4 ; loadint
  %r75 = load i32, ptr %r9
  %r76 = mul i32 %r75, %r74
  %r77 = add i32 %r1, %r76
  %r78 = load i32, ptr %r77
  %r79 = add i32 0, 4 ; loadint
  %r80 = load i32, ptr %r11
  %r81 = mul i32 %r80, %r79
  %r82 = add i32 %r1, %r81
  store i32 %r78, ptr %r82
  %r83 = load i32, ptr %r11
  %r84 = add i32 0, 1 ; loadint
  %r85 = sub i32 %r83, %r84
  store i32 %r85, ptr %r11
  br label %B46

B46:
  br label %B26

}
define i32 @getMid(i32){
B48:
  %r2 = alloca int, 4
  br label %B49

B49:
  %r3 = loadaddr @n#0
  %r4 = load i32, ptr %r3
  %r5 = add i32 0, 2 ; loadint
  %r6 = srem i32 %r4, %r5
  %r7 = add i32 0, 0 ; loadint
  %r8 = icmp eq i32 %r6, %r7
  br i1 %r8, label %B50, label %B51

B50:
  %r9 = loadaddr @n#0
  %r10 = load i32, ptr %r9
  %r11 = add i32 0, 2 ; loadint
  %r12 = sdiv i32 %r10, %r11
  store i32 %r12, ptr %r2
  %r13 = add i32 0, 4 ; loadint
  %r14 = load i32, ptr %r2
  %r15 = mul i32 %r14, %r13
  %r16 = add i32 %r1, %r15
  %r17 = load i32, ptr %r16
  %r18 = add i32 0, 4 ; loadint
  %r19 = load i32, ptr %r2
  %r20 = add i32 0, 1 ; loadint
  %r21 = sub i32 %r19, %r20
  %r22 = mul i32 %r21, %r18
  %r23 = add i32 %r1, %r22
  %r24 = load i32, ptr %r23
  %r25 = add i32 %r17, %r24
  %r26 = add i32 0, 2 ; loadint
  %r27 = sdiv i32 %r25, %r26
  ret i32 %r27

B51:
  %r28 = loadaddr @n#0
  %r29 = load i32, ptr %r28
  %r30 = add i32 0, 2 ; loadint
  %r31 = sdiv i32 %r29, %r30
  store i32 %r31, ptr %r2
  %r32 = add i32 0, 4 ; loadint
  %r33 = load i32, ptr %r2
  %r34 = mul i32 %r33, %r32
  %r35 = add i32 %r1, %r34
  %r36 = load i32, ptr %r35
  ret i32 %r36

}
define i32 @insertsort(i32){
B11:
  %r2 = alloca int, 4
  %r3 = add i32 0, 1 ; loadint
  store i32 %r3, ptr %r2
  br label %B12

B12:
  %r4 = load i32, ptr %r2
  %r5 = loadaddr @n#0
  %r6 = load i32, ptr %r5
  %r7 = icmp slt i32 %r4, %r6
  br i1 %r7, label %B13, label %B14

B13:
  %r8 = alloca int, 4
  %r9 = add i32 0, 4 ; loadint
  %r10 = load i32, ptr %r2
  %r11 = mul i32 %r10, %r9
  %r12 = add i32 %r1, %r11
  %r13 = load i32, ptr %r12
  store i32 %r13, ptr %r8
  %r14 = alloca int, 4
  %r15 = load i32, ptr %r2
  %r16 = add i32 0, 1 ; loadint
  %r17 = sub i32 %r15, %r16
  store i32 %r17, ptr %r14
  br label %B15

B14:
  %r57 = add i32 0, 0 ; loadint
  ret i32 %r57

B15:
  %r18 = alloca int, 4
  %r19 = load i32, ptr %r14
  %r20 = add i32 0, 1 ; loadint
  %r22 = add i32 0, 0 ; loadint
  %r21 = sub i32 %r22, %r20
  %r23 = icmp sgt i32 %r19, %r21
  br i1 %r23, label %B18, label %B19

B16:
  %r33 = add i32 0, 4 ; loadint
  %r34 = load i32, ptr %r14
  %r35 = mul i32 %r34, %r33
  %r36 = add i32 %r1, %r35
  %r37 = load i32, ptr %r36
  %r38 = add i32 0, 4 ; loadint
  %r39 = load i32, ptr %r14
  %r40 = add i32 0, 1 ; loadint
  %r41 = add i32 %r39, %r40
  %r42 = mul i32 %r41, %r38
  %r43 = add i32 %r1, %r42
  store i32 %r37, ptr %r43
  %r44 = load i32, ptr %r14
  %r45 = add i32 0, 1 ; loadint
  %r46 = sub i32 %r44, %r45
  store i32 %r46, ptr %r14
  br label %B15

B17:
  %r47 = load i32, ptr %r8
  %r48 = add i32 0, 4 ; loadint
  %r49 = load i32, ptr %r14
  %r50 = add i32 0, 1 ; loadint
  %r51 = add i32 %r49, %r50
  %r52 = mul i32 %r51, %r48
  %r53 = add i32 %r1, %r52
  store i32 %r47, ptr %r53
  %r54 = load i32, ptr %r2
  %r55 = add i32 0, 1 ; loadint
  %r56 = add i32 %r54, %r55
  store i32 %r56, ptr %r2
  br label %B12

B18:
  %r24 = load i32, ptr %r8
  %r25 = add i32 0, 4 ; loadint
  %r26 = load i32, ptr %r14
  %r27 = mul i32 %r26, %r25
  %r28 = add i32 %r1, %r27
  %r29 = load i32, ptr %r28
  %r30 = icmp slt i32 %r24, %r29
  store i32 %r30, ptr %r18
  br label %B20

B19:
  %r31 = add i32 0, 0 ; loadint
  store i32 %r31, ptr %r18
  br label %B20

B20:
  %r32 = load i32, ptr %r18
  br i1 %r32, label %B16, label %B17

}
define i32 @getMost(i32){
B55:
  %r2 = alloca int [1000], 4000
  %r3 = alloca int, 4
  %r4 = add i32 0, 0 ; loadint
  store i32 %r4, ptr %r3
  br label %B56

B56:
  %r5 = load i32, ptr %r3
  %r6 = add i32 0, 1000 ; loadint
  %r7 = icmp slt i32 %r5, %r6
  br i1 %r7, label %B57, label %B58

B57:
  %r8 = add i32 0, 0 ; loadint
  %r9 = add i32 0, 4 ; loadint
  %r10 = load i32, ptr %r3
  %r11 = mul i32 %r10, %r9
  %r12 = add i32 %r2, %r11
  store i32 %r8, ptr %r12
  %r13 = load i32, ptr %r3
  %r14 = add i32 0, 1 ; loadint
  %r15 = add i32 %r13, %r14
  store i32 %r15, ptr %r3
  br label %B56

B58:
  %r16 = add i32 0, 0 ; loadint
  store i32 %r16, ptr %r3
  %r17 = alloca int, 4
  %r18 = alloca int, 4
  %r19 = add i32 0, 0 ; loadint
  store i32 %r19, ptr %r17
  br label %B59

B59:
  %r20 = load i32, ptr %r3
  %r21 = loadaddr @n#0
  %r22 = load i32, ptr %r21
  %r23 = icmp slt i32 %r20, %r22
  br i1 %r23, label %B60, label %B61

B60:
  %r24 = alloca int, 4
  %r25 = add i32 0, 4 ; loadint
  %r26 = load i32, ptr %r3
  %r27 = mul i32 %r26, %r25
  %r28 = add i32 %r1, %r27
  %r29 = load i32, ptr %r28
  store i32 %r29, ptr %r24
  %r30 = add i32 0, 4 ; loadint
  %r31 = load i32, ptr %r24
  %r32 = mul i32 %r31, %r30
  %r33 = add i32 %r2, %r32
  %r34 = load i32, ptr %r33
  %r35 = add i32 0, 1 ; loadint
  %r36 = add i32 %r34, %r35
  %r37 = add i32 0, 4 ; loadint
  %r38 = load i32, ptr %r24
  %r39 = mul i32 %r38, %r37
  %r40 = add i32 %r2, %r39
  store i32 %r36, ptr %r40
  br label %B62

B61:
  %r57 = load i32, ptr %r18
  ret i32 %r57

B62:
  %r41 = add i32 0, 4 ; loadint
  %r42 = load i32, ptr %r24
  %r43 = mul i32 %r42, %r41
  %r44 = add i32 %r2, %r43
  %r45 = load i32, ptr %r44
  %r46 = load i32, ptr %r17
  %r47 = icmp sgt i32 %r45, %r46
  br i1 %r47, label %B63, label %B64

B63:
  %r48 = add i32 0, 4 ; loadint
  %r49 = load i32, ptr %r24
  %r50 = mul i32 %r49, %r48
  %r51 = add i32 %r2, %r50
  %r52 = load i32, ptr %r51
  store i32 %r52, ptr %r17
  %r53 = load i32, ptr %r24
  store i32 %r53, ptr %r18
  br label %B64

B64:
  %r54 = load i32, ptr %r3
  %r55 = add i32 0, 1 ; loadint
  %r56 = add i32 %r54, %r55
  store i32 %r56, ptr %r3
  br label %B59

}
define i32 @bubblesort(i32){
B0:
  %r2 = alloca int, 4
  %r3 = alloca int, 4
  %r4 = add i32 0, 0 ; loadint
  store i32 %r4, ptr %r2
  br label %B1

B1:
  %r5 = load i32, ptr %r2
  %r6 = loadaddr @n#0
  %r7 = load i32, ptr %r6
  %r8 = add i32 0, 1 ; loadint
  %r9 = sub i32 %r7, %r8
  %r10 = icmp slt i32 %r5, %r9
  br i1 %r10, label %B2, label %B3

B2:
  %r11 = add i32 0, 0 ; loadint
  store i32 %r11, ptr %r3
  br label %B4

B3:
  %r63 = add i32 0, 0 ; loadint
  ret i32 %r63

B4:
  %r12 = load i32, ptr %r3
  %r13 = loadaddr @n#0
  %r14 = load i32, ptr %r13
  %r15 = load i32, ptr %r2
  %r16 = sub i32 %r14, %r15
  %r17 = add i32 0, 1 ; loadint
  %r18 = sub i32 %r16, %r17
  %r19 = icmp slt i32 %r12, %r18
  br i1 %r19, label %B5, label %B6

B5:
  br label %B7

B6:
  %r60 = load i32, ptr %r2
  %r61 = add i32 0, 1 ; loadint
  %r62 = add i32 %r60, %r61
  store i32 %r62, ptr %r2
  br label %B1

B7:
  %r20 = add i32 0, 4 ; loadint
  %r21 = load i32, ptr %r3
  %r22 = mul i32 %r21, %r20
  %r23 = add i32 %r1, %r22
  %r24 = load i32, ptr %r23
  %r25 = add i32 0, 4 ; loadint
  %r26 = load i32, ptr %r3
  %r27 = add i32 0, 1 ; loadint
  %r28 = add i32 %r26, %r27
  %r29 = mul i32 %r28, %r25
  %r30 = add i32 %r1, %r29
  %r31 = load i32, ptr %r30
  %r32 = icmp sgt i32 %r24, %r31
  br i1 %r32, label %B8, label %B9

B8:
  %r33 = alloca int, 4
  %r34 = add i32 0, 4 ; loadint
  %r35 = load i32, ptr %r3
  %r36 = add i32 0, 1 ; loadint
  %r37 = add i32 %r35, %r36
  %r38 = mul i32 %r37, %r34
  %r39 = add i32 %r1, %r38
  %r40 = load i32, ptr %r39
  store i32 %r40, ptr %r33
  %r41 = add i32 0, 4 ; loadint
  %r42 = load i32, ptr %r3
  %r43 = mul i32 %r42, %r41
  %r44 = add i32 %r1, %r43
  %r45 = load i32, ptr %r44
  %r46 = add i32 0, 4 ; loadint
  %r47 = load i32, ptr %r3
  %r48 = add i32 0, 1 ; loadint
  %r49 = add i32 %r47, %r48
  %r50 = mul i32 %r49, %r46
  %r51 = add i32 %r1, %r50
  store i32 %r45, ptr %r51
  %r52 = load i32, ptr %r33
  %r53 = add i32 0, 4 ; loadint
  %r54 = load i32, ptr %r3
  %r55 = mul i32 %r54, %r53
  %r56 = add i32 %r1, %r55
  store i32 %r52, ptr %r56
  br label %B9

B9:
  %r57 = load i32, ptr %r3
  %r58 = add i32 0, 1 ; loadint
  %r59 = add i32 %r57, %r58
  store i32 %r59, ptr %r3
  br label %B4

}
