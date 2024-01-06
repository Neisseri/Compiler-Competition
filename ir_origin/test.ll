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
  store i32 %r5, ptr %r1
  br label %B18

B18:
  %r6 = load i32, ptr %r1
  %tmpconbr6 = trunc i32 %r6 to i1
  br i1 %tmpconbr6, label %B19, label %B20

B19:
  %r7 = load i32, ptr %r1
  %r8 = add i32 0, 1 ; loadint
  %r9 = sub i32 %r7, %r8
  store i32 %r9, ptr %r1
  %r10 = add i32 0, 4 ; loadint
  %r11 = loadaddr @n#0
  store i32 %r10, ptr %r11
  %r12 = add i32 0, 10 ; loadint
  store i32 %r12, ptr %r2
  %r13 = alloca i32, i32 4
  %r14 = add i32 0, 0 ; loadint
  store i32 %r14, ptr %r13
  %r15 = alloca i32, i32 4
  %r16 = add i32 0, 0 ; loadint
  store i32 %r16, ptr %r15
  %r18 = loadaddr @n#0
  %r19 = load i32, ptr %r18
  %r17 = call i32 @init(i32 %r19)
  %r20 = alloca i32, i32 4
  %r21 = loadaddr @n#0
  %r22 = load i32, ptr %r21
  %r23 = loadaddr @n#0
  %r24 = load i32, ptr %r23
  %r25 = mul i32 %r22, %r24
  %r26 = add i32 0, 1 ; loadint
  %r27 = add i32 %r25, %r26
  store i32 %r27, ptr %r20
  br label %B21

B20:
  %r229 = add i32 0, 0 ; loadint
  ret i32 %r229

B21:
  %r28 = load i32, ptr %r13
  %r29 = load i32, ptr %r2
  %tmpcmp30 = icmp slt i32 %r28, %r29
  %r30 = zext i1 %tmpcmp30 to i32
  %tmpconbr30 = trunc i32 %r30 to i1
  br i1 %tmpconbr30, label %B22, label %B23

B22:
  %r31 = call i32 @getint()
  store i32 %r31, ptr %r3
  %r32 = call i32 @getint()
  store i32 %r32, ptr %r4
  br label %B24

B23:
  br label %B66

B24:
  %r33 = load i32, ptr %r15
  %r35 = add i32 0, 0 ; loadint
  %tmpcmp34 = icmp eq i32 %r35, %r33
  %r34 = zext i1 %tmpcmp34 to i32
  %tmpconbr34 = trunc i32 %r34 to i1
  br i1 %tmpconbr34, label %B25, label %B26

B25:
  %r36 = alloca i32, i32 4
  %r37 = loadaddr @n#0
  %r38 = load i32, ptr %r37
  %r39 = load i32, ptr %r3
  %r40 = add i32 0, 1 ; loadint
  %r41 = sub i32 %r39, %r40
  %r42 = mul i32 %r38, %r41
  %r43 = load i32, ptr %r4
  %r44 = add i32 %r42, %r43
  store i32 %r44, ptr %r36
  %r45 = load i32, ptr %r36
  %r46 = loadaddr @array#0
  %r47 = loadaddr @array#0
  %r48 = add i32 0, 4 ; loadint
  %r49 = load i32, ptr %r36
  %r50 = mul i32 %r49, %r48
  %r51 = add i32 %r47, %r50
  store i32 %r45, ptr %r51
  br label %B27

B26:
  %r217 = load i32, ptr %r13
  %r218 = add i32 0, 1 ; loadint
  %r219 = add i32 %r217, %r218
  store i32 %r219, ptr %r13
  br label %B21

B27:
  %r52 = load i32, ptr %r3
  %r53 = add i32 0, 1 ; loadint
  %tmpcmp54 = icmp eq i32 %r52, %r53
  %r54 = zext i1 %tmpcmp54 to i32
  %tmpconbr54 = trunc i32 %r54 to i1
  br i1 %tmpconbr54, label %B28, label %B29

B28:
  %r55 = add i32 0, 0 ; loadint
  %r56 = loadaddr @array#0
  %r57 = loadaddr @array#0
  %r58 = add i32 0, 4 ; loadint
  %r59 = add i32 0, 0 ; loadint
  %r60 = mul i32 %r59, %r58
  %r61 = add i32 %r57, %r60
  store i32 %r55, ptr %r61
  %r63 = load i32, ptr %r36
  %r64 = add i32 0, 0 ; loadint
  %r62 = call i32 @mmerge(i32 %r63, i32 %r64)
  br label %B29

B29:
  br label %B30

B30:
  %r65 = load i32, ptr %r3
  %r66 = loadaddr @n#0
  %r67 = load i32, ptr %r66
  %tmpcmp68 = icmp eq i32 %r65, %r67
  %r68 = zext i1 %tmpcmp68 to i32
  %tmpconbr68 = trunc i32 %r68 to i1
  br i1 %tmpconbr68, label %B31, label %B32

B31:
  %r69 = load i32, ptr %r20
  %r70 = loadaddr @array#0
  %r71 = loadaddr @array#0
  %r72 = add i32 0, 4 ; loadint
  %r73 = load i32, ptr %r20
  %r74 = mul i32 %r73, %r72
  %r75 = add i32 %r71, %r74
  store i32 %r69, ptr %r75
  %r77 = load i32, ptr %r36
  %r78 = load i32, ptr %r20
  %r76 = call i32 @mmerge(i32 %r77, i32 %r78)
  br label %B32

B32:
  br label %B33

B33:
  %r79 = alloca i32, i32 4
  %r80 = load i32, ptr %r4
  %r81 = loadaddr @n#0
  %r82 = load i32, ptr %r81
  %tmpcmp83 = icmp slt i32 %r80, %r82
  %r83 = zext i1 %tmpcmp83 to i32
  %tmpconbr83 = trunc i32 %r83 to i1
  br i1 %tmpconbr83, label %B34, label %B35

B34:
  %r84 = loadaddr @array#0
  %r85 = add i32 0, 4 ; loadint
  %r86 = load i32, ptr %r36
  %r87 = add i32 0, 1 ; loadint
  %r88 = add i32 %r86, %r87
  %r89 = mul i32 %r88, %r85
  %r90 = add i32 %r84, %r89
  %r91 = load i32, ptr %r90
  %r92 = add i32 0, 1 ; loadint
  %r94 = add i32 0, 0 ; loadint
  %r93 = sub i32 %r94, %r92
  %tmpcmp95 = icmp ne i32 %r91, %r93
  %r95 = zext i1 %tmpcmp95 to i32
  store i32 %r95, ptr %r79
  br label %B36

B35:
  %r96 = add i32 0, 0 ; loadint
  store i32 %r96, ptr %r79
  br label %B36

B36:
  %r97 = load i32, ptr %r79
  %tmpconbr97 = trunc i32 %r97 to i1
  br i1 %tmpconbr97, label %B37, label %B38

B37:
  %r99 = load i32, ptr %r36
  %r100 = load i32, ptr %r36
  %r101 = add i32 0, 1 ; loadint
  %r102 = add i32 %r100, %r101
  %r98 = call i32 @mmerge(i32 %r99, i32 %r102)
  br label %B38

B38:
  br label %B39

B39:
  %r103 = alloca i32, i32 4
  %r104 = load i32, ptr %r4
  %r105 = add i32 0, 1 ; loadint
  %tmpcmp106 = icmp sgt i32 %r104, %r105
  %r106 = zext i1 %tmpcmp106 to i32
  %tmpconbr106 = trunc i32 %r106 to i1
  br i1 %tmpconbr106, label %B40, label %B41

B40:
  %r107 = loadaddr @array#0
  %r108 = add i32 0, 4 ; loadint
  %r109 = load i32, ptr %r36
  %r110 = add i32 0, 1 ; loadint
  %r111 = sub i32 %r109, %r110
  %r112 = mul i32 %r111, %r108
  %r113 = add i32 %r107, %r112
  %r114 = load i32, ptr %r113
  %r115 = add i32 0, 1 ; loadint
  %r117 = add i32 0, 0 ; loadint
  %r116 = sub i32 %r117, %r115
  %tmpcmp118 = icmp ne i32 %r114, %r116
  %r118 = zext i1 %tmpcmp118 to i32
  store i32 %r118, ptr %r103
  br label %B42

B41:
  %r119 = add i32 0, 0 ; loadint
  store i32 %r119, ptr %r103
  br label %B42

B42:
  %r120 = load i32, ptr %r103
  %tmpconbr120 = trunc i32 %r120 to i1
  br i1 %tmpconbr120, label %B43, label %B44

B43:
  %r122 = load i32, ptr %r36
  %r123 = load i32, ptr %r36
  %r124 = add i32 0, 1 ; loadint
  %r125 = sub i32 %r123, %r124
  %r121 = call i32 @mmerge(i32 %r122, i32 %r125)
  br label %B44

B44:
  br label %B45

B45:
  %r126 = alloca i32, i32 4
  %r127 = load i32, ptr %r3
  %r128 = loadaddr @n#0
  %r129 = load i32, ptr %r128
  %tmpcmp130 = icmp slt i32 %r127, %r129
  %r130 = zext i1 %tmpcmp130 to i32
  %tmpconbr130 = trunc i32 %r130 to i1
  br i1 %tmpconbr130, label %B46, label %B47

B46:
  %r131 = loadaddr @array#0
  %r132 = add i32 0, 4 ; loadint
  %r133 = load i32, ptr %r36
  %r134 = loadaddr @n#0
  %r135 = load i32, ptr %r134
  %r136 = add i32 %r133, %r135
  %r137 = mul i32 %r136, %r132
  %r138 = add i32 %r131, %r137
  %r139 = load i32, ptr %r138
  %r140 = add i32 0, 1 ; loadint
  %r142 = add i32 0, 0 ; loadint
  %r141 = sub i32 %r142, %r140
  %tmpcmp143 = icmp ne i32 %r139, %r141
  %r143 = zext i1 %tmpcmp143 to i32
  store i32 %r143, ptr %r126
  br label %B48

B47:
  %r144 = add i32 0, 0 ; loadint
  store i32 %r144, ptr %r126
  br label %B48

B48:
  %r145 = load i32, ptr %r126
  %tmpconbr145 = trunc i32 %r145 to i1
  br i1 %tmpconbr145, label %B49, label %B50

B49:
  %r147 = load i32, ptr %r36
  %r148 = load i32, ptr %r36
  %r149 = loadaddr @n#0
  %r150 = load i32, ptr %r149
  %r151 = add i32 %r148, %r150
  %r146 = call i32 @mmerge(i32 %r147, i32 %r151)
  br label %B50

B50:
  br label %B51

B51:
  %r152 = alloca i32, i32 4
  %r153 = load i32, ptr %r3
  %r154 = add i32 0, 1 ; loadint
  %tmpcmp155 = icmp sgt i32 %r153, %r154
  %r155 = zext i1 %tmpcmp155 to i32
  %tmpconbr155 = trunc i32 %r155 to i1
  br i1 %tmpconbr155, label %B52, label %B53

B52:
  %r156 = loadaddr @array#0
  %r157 = add i32 0, 4 ; loadint
  %r158 = load i32, ptr %r36
  %r159 = loadaddr @n#0
  %r160 = load i32, ptr %r159
  %r161 = sub i32 %r158, %r160
  %r162 = mul i32 %r161, %r157
  %r163 = add i32 %r156, %r162
  %r164 = load i32, ptr %r163
  %r165 = add i32 0, 1 ; loadint
  %r167 = add i32 0, 0 ; loadint
  %r166 = sub i32 %r167, %r165
  %tmpcmp168 = icmp ne i32 %r164, %r166
  %r168 = zext i1 %tmpcmp168 to i32
  store i32 %r168, ptr %r152
  br label %B54

B53:
  %r169 = add i32 0, 0 ; loadint
  store i32 %r169, ptr %r152
  br label %B54

B54:
  %r170 = load i32, ptr %r152
  %tmpconbr170 = trunc i32 %r170 to i1
  br i1 %tmpconbr170, label %B55, label %B56

B55:
  %r172 = load i32, ptr %r36
  %r173 = load i32, ptr %r36
  %r174 = loadaddr @n#0
  %r175 = load i32, ptr %r174
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
  %r184 = load i32, ptr %r183
  %r185 = add i32 0, 1 ; loadint
  %r187 = add i32 0, 0 ; loadint
  %r186 = sub i32 %r187, %r185
  %tmpcmp188 = icmp ne i32 %r184, %r186
  %r188 = zext i1 %tmpcmp188 to i32
  %tmpconbr188 = trunc i32 %r188 to i1
  br i1 %tmpconbr188, label %B58, label %B59

B58:
  %r189 = loadaddr @array#0
  %r190 = add i32 0, 4 ; loadint
  %r191 = load i32, ptr %r20
  %r192 = mul i32 %r191, %r190
  %r193 = add i32 %r189, %r192
  %r194 = load i32, ptr %r193
  %r195 = add i32 0, 1 ; loadint
  %r197 = add i32 0, 0 ; loadint
  %r196 = sub i32 %r197, %r195
  %tmpcmp198 = icmp ne i32 %r194, %r196
  %r198 = zext i1 %tmpcmp198 to i32
  store i32 %r198, ptr %r178
  br label %B60

B59:
  %r199 = add i32 0, 0 ; loadint
  store i32 %r199, ptr %r178
  br label %B60

B60:
  %r200 = load i32, ptr %r178
  %tmpconbr200 = trunc i32 %r200 to i1
  br i1 %tmpconbr200, label %B61, label %B62

B61:
  %r202 = add i32 0, 0 ; loadint
  %r201 = call i32 @findfa(i32 %r202)
  %r204 = load i32, ptr %r20
  %r203 = call i32 @findfa(i32 %r204)
  %tmpcmp205 = icmp eq i32 %r201, %r203
  %r205 = zext i1 %tmpcmp205 to i32
  store i32 %r205, ptr %r177
  br label %B63

B62:
  %r206 = add i32 0, 0 ; loadint
  store i32 %r206, ptr %r177
  br label %B63

B63:
  %r207 = load i32, ptr %r177
  %tmpconbr207 = trunc i32 %r207 to i1
  br i1 %tmpconbr207, label %B64, label %B65

B64:
  %r208 = add i32 0, 1 ; loadint
  store i32 %r208, ptr %r15
  %r209 = alloca i32, i32 4
  %r210 = load i32, ptr %r13
  %r211 = add i32 0, 1 ; loadint
  %r212 = add i32 %r210, %r211
  store i32 %r212, ptr %r209
  %r214 = load i32, ptr %r209
  %r213 = call i32 @putint(i32 %r214)
  %r216 = add i32 0, 10 ; loadint
  %r215 = call i32 @putch(i32 %r216)
  br label %B65

B65:
  br label %B26

B66:
  %r220 = load i32, ptr %r15
  %r222 = add i32 0, 0 ; loadint
  %tmpcmp221 = icmp eq i32 %r222, %r220
  %r221 = zext i1 %tmpcmp221 to i32
  %tmpconbr221 = trunc i32 %r221 to i1
  br i1 %tmpconbr221, label %B67, label %B68

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
define i32 @mmerge(i32 %r1, i32 %r2){
B12:
  %r3 = alloca i32, i32 4
  store i32 %r1, ptr %r3
  %r4 = alloca i32, i32 4
  store i32 %r2, ptr %r4
  %r5 = alloca i32, i32 4
  %r7 = load i32, ptr %r3
  %r6 = call i32 @findfa(i32 %r7)
  store i32 %r6, ptr %r5
  %r8 = alloca i32, i32 4
  %r10 = load i32, ptr %r4
  %r9 = call i32 @findfa(i32 %r10)
  store i32 %r9, ptr %r8
  br label %B13

B13:
  %r11 = load i32, ptr %r5
  %r12 = load i32, ptr %r8
  %tmpcmp13 = icmp ne i32 %r11, %r12
  %r13 = zext i1 %tmpcmp13 to i32
  %tmpconbr13 = trunc i32 %r13 to i1
  br i1 %tmpconbr13, label %B14, label %B15

B14:
  %r14 = load i32, ptr %r8
  %r15 = loadaddr @array#0
  %r16 = loadaddr @array#0
  %r17 = add i32 0, 4 ; loadint
  %r18 = load i32, ptr %r5
  %r19 = mul i32 %r18, %r17
  %r20 = add i32 %r16, %r19
  store i32 %r14, ptr %r20
  br label %B15

B15:
  %r21 = add i32 0, 0 ; loadint
  ret i32 %r21

}
define i32 @findfa(i32 %r1){
B5:
  %r2 = alloca i32, i32 4
  store i32 %r1, ptr %r2
  br label %B6

B6:
  %r3 = loadaddr @array#0
  %r4 = add i32 0, 4 ; loadint
  %r5 = load i32, ptr %r2
  %r6 = mul i32 %r5, %r4
  %r7 = add i32 %r3, %r6
  %r8 = load i32, ptr %r7
  %r9 = load i32, ptr %r2
  %tmpcmp10 = icmp eq i32 %r8, %r9
  %r10 = zext i1 %tmpcmp10 to i32
  %tmpconbr10 = trunc i32 %r10 to i1
  br i1 %tmpconbr10, label %B7, label %B8

B7:
  %r11 = load i32, ptr %r2
  ret i32 %r11

B8:
  %r13 = loadaddr @array#0
  %r14 = add i32 0, 4 ; loadint
  %r15 = load i32, ptr %r2
  %r16 = mul i32 %r15, %r14
  %r17 = add i32 %r13, %r16
  %r18 = load i32, ptr %r17
  %r12 = call i32 @findfa(i32 %r18)
  %r19 = loadaddr @array#0
  %r20 = loadaddr @array#0
  %r21 = add i32 0, 4 ; loadint
  %r22 = load i32, ptr %r2
  %r23 = mul i32 %r22, %r21
  %r24 = add i32 %r20, %r23
  store i32 %r12, ptr %r24
  %r25 = loadaddr @array#0
  %r26 = add i32 0, 4 ; loadint
  %r27 = load i32, ptr %r2
  %r28 = mul i32 %r27, %r26
  %r29 = add i32 %r25, %r28
  %r30 = load i32, ptr %r29
  ret i32 %r30

}
define i32 @init(i32 %r1){
B0:
  %r2 = alloca i32, i32 4
  store i32 %r1, ptr %r2
  %r3 = alloca i32, i32 4
  %r4 = add i32 0, 1 ; loadint
  store i32 %r4, ptr %r3
  br label %B1

B1:
  %r5 = load i32, ptr %r3
  %r6 = load i32, ptr %r2
  %r7 = load i32, ptr %r2
  %r8 = mul i32 %r6, %r7
  %r9 = add i32 0, 1 ; loadint
  %r10 = add i32 %r8, %r9
  %tmpcmp11 = icmp sle i32 %r5, %r10
  %r11 = zext i1 %tmpcmp11 to i32
  %tmpconbr11 = trunc i32 %r11 to i1
  br i1 %tmpconbr11, label %B2, label %B3

B2:
  %r12 = add i32 0, 1 ; loadint
  %r14 = add i32 0, 0 ; loadint
  %r13 = sub i32 %r14, %r12
  %r15 = loadaddr @array#0
  %r16 = loadaddr @array#0
  %r17 = add i32 0, 4 ; loadint
  %r18 = load i32, ptr %r3
  %r19 = mul i32 %r18, %r17
  %r20 = add i32 %r16, %r19
  store i32 %r13, ptr %r20
  %r21 = load i32, ptr %r3
  %r22 = add i32 0, 1 ; loadint
  %r23 = add i32 %r21, %r22
  store i32 %r23, ptr %r3
  br label %B1

B3:
  %r24 = add i32 0, 0 ; loadint
  ret i32 %r24

}
