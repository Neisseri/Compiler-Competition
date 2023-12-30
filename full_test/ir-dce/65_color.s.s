; module
@maxn#0 = global const int 18, 4
@mod#0 = global const int 1000000007, 4
@dp#0 = global int [18,18,18,18,18,7], 52907904
@list#0 = global int [200], 800
@cns#0 = global int [20], 80
define i32 @main(){
B31:
  %r1 = alloca int, 4
  %r2 = call i32 @getint()
  store i32 %r2, ptr %r1
  %r3 = alloca int, 4
  %r4 = add i32 0, 0 ; loadint
  store i32 %r4, ptr %r3
  br label %B32

B32:
  %r5 = load i32, ptr %r3
  %r6 = loadaddr @maxn#0
  %r7 = load i32, ptr %r6
  %r8 = icmp slt i32 %r5, %r7
  br i1 %r8, label %B33, label %B34

B33:
  %r9 = alloca int, 4
  %r10 = add i32 0, 0 ; loadint
  store i32 %r10, ptr %r9
  br label %B35

B34:
  %r90 = add i32 0, 0 ; loadint
  store i32 %r90, ptr %r3
  br label %B50

B35:
  %r11 = load i32, ptr %r9
  %r12 = loadaddr @maxn#0
  %r13 = load i32, ptr %r12
  %r14 = icmp slt i32 %r11, %r13
  br i1 %r14, label %B36, label %B37

B36:
  %r15 = alloca int, 4
  %r16 = add i32 0, 0 ; loadint
  store i32 %r16, ptr %r15
  br label %B38

B37:
  %r87 = load i32, ptr %r3
  %r88 = add i32 0, 1 ; loadint
  %r89 = add i32 %r87, %r88
  store i32 %r89, ptr %r3
  br label %B32

B38:
  %r17 = load i32, ptr %r15
  %r18 = loadaddr @maxn#0
  %r19 = load i32, ptr %r18
  %r20 = icmp slt i32 %r17, %r19
  br i1 %r20, label %B39, label %B40

B39:
  %r21 = alloca int, 4
  %r22 = add i32 0, 0 ; loadint
  store i32 %r22, ptr %r21
  br label %B41

B40:
  %r84 = load i32, ptr %r9
  %r85 = add i32 0, 1 ; loadint
  %r86 = add i32 %r84, %r85
  store i32 %r86, ptr %r9
  br label %B35

B41:
  %r23 = load i32, ptr %r21
  %r24 = loadaddr @maxn#0
  %r25 = load i32, ptr %r24
  %r26 = icmp slt i32 %r23, %r25
  br i1 %r26, label %B42, label %B43

B42:
  %r27 = alloca int, 4
  %r28 = add i32 0, 0 ; loadint
  store i32 %r28, ptr %r27
  br label %B44

B43:
  %r81 = load i32, ptr %r15
  %r82 = add i32 0, 1 ; loadint
  %r83 = add i32 %r81, %r82
  store i32 %r83, ptr %r15
  br label %B38

B44:
  %r29 = load i32, ptr %r27
  %r30 = loadaddr @maxn#0
  %r31 = load i32, ptr %r30
  %r32 = icmp slt i32 %r29, %r31
  br i1 %r32, label %B45, label %B46

B45:
  %r33 = alloca int, 4
  %r34 = add i32 0, 0 ; loadint
  store i32 %r34, ptr %r33
  br label %B47

B46:
  %r78 = load i32, ptr %r21
  %r79 = add i32 0, 1 ; loadint
  %r80 = add i32 %r78, %r79
  store i32 %r80, ptr %r21
  br label %B41

B47:
  %r35 = load i32, ptr %r33
  %r36 = add i32 0, 7 ; loadint
  %r37 = icmp slt i32 %r35, %r36
  br i1 %r37, label %B48, label %B49

B48:
  %r38 = add i32 0, 1 ; loadint
  %r40 = add i32 0, 0 ; loadint
  %r39 = sub i32 %r40, %r38
  %r41 = loadaddr @dp#0
  %r42 = loadaddr @dp#0
  %r43 = add i32 0, 4 ; loadint
  %r44 = load i32, ptr %r33
  %r45 = mul i32 %r44, %r43
  %r46 = add i32 %r42, %r45
  %r47 = add i32 0, 7 ; loadint
  %r48 = mul i32 %r43, %r47
  %r49 = load i32, ptr %r27
  %r50 = mul i32 %r49, %r48
  %r51 = add i32 %r46, %r50
  %r52 = add i32 0, 18 ; loadint
  %r53 = mul i32 %r48, %r52
  %r54 = load i32, ptr %r21
  %r55 = mul i32 %r54, %r53
  %r56 = add i32 %r51, %r55
  %r57 = add i32 0, 18 ; loadint
  %r58 = mul i32 %r53, %r57
  %r59 = load i32, ptr %r15
  %r60 = mul i32 %r59, %r58
  %r61 = add i32 %r56, %r60
  %r62 = add i32 0, 18 ; loadint
  %r63 = mul i32 %r58, %r62
  %r64 = load i32, ptr %r9
  %r65 = mul i32 %r64, %r63
  %r66 = add i32 %r61, %r65
  %r67 = add i32 0, 18 ; loadint
  %r68 = mul i32 %r63, %r67
  %r69 = load i32, ptr %r3
  %r70 = mul i32 %r69, %r68
  %r71 = add i32 %r66, %r70
  store i32 %r39, ptr %r71
  %r72 = load i32, ptr %r33
  %r73 = add i32 0, 1 ; loadint
  %r74 = add i32 %r72, %r73
  store i32 %r74, ptr %r33
  br label %B47

B49:
  %r75 = load i32, ptr %r27
  %r76 = add i32 0, 1 ; loadint
  %r77 = add i32 %r75, %r76
  store i32 %r77, ptr %r27
  br label %B44

B50:
  %r91 = load i32, ptr %r3
  %r92 = load i32, ptr %r1
  %r93 = icmp slt i32 %r91, %r92
  br i1 %r93, label %B51, label %B52

B51:
  %r94 = call i32 @getint()
  %r95 = loadaddr @list#0
  %r96 = loadaddr @list#0
  %r97 = add i32 0, 4 ; loadint
  %r98 = load i32, ptr %r3
  %r99 = mul i32 %r98, %r97
  %r100 = add i32 %r96, %r99
  store i32 %r94, ptr %r100
  %r101 = loadaddr @cns#0
  %r102 = add i32 0, 4 ; loadint
  %r103 = loadaddr @list#0
  %r104 = add i32 0, 4 ; loadint
  %r105 = load i32, ptr %r3
  %r106 = mul i32 %r105, %r104
  %r107 = add i32 %r103, %r106
  %r108 = load i32, ptr %r107
  %r109 = mul i32 %r108, %r102
  %r110 = add i32 %r101, %r109
  %r111 = load i32, ptr %r110
  %r112 = add i32 0, 1 ; loadint
  %r113 = add i32 %r111, %r112
  %r114 = loadaddr @cns#0
  %r115 = loadaddr @cns#0
  %r116 = add i32 0, 4 ; loadint
  %r117 = loadaddr @list#0
  %r118 = add i32 0, 4 ; loadint
  %r119 = load i32, ptr %r3
  %r120 = mul i32 %r119, %r118
  %r121 = add i32 %r117, %r120
  %r122 = load i32, ptr %r121
  %r123 = mul i32 %r122, %r116
  %r124 = add i32 %r115, %r123
  store i32 %r113, ptr %r124
  %r125 = load i32, ptr %r3
  %r126 = add i32 0, 1 ; loadint
  %r127 = add i32 %r125, %r126
  store i32 %r127, ptr %r3
  br label %B50

B52:
  %r128 = alloca int, 4
  %r130 = loadaddr @cns#0
  %r131 = add i32 0, 4 ; loadint
  %r132 = add i32 0, 1 ; loadint
  %r133 = mul i32 %r132, %r131
  %r134 = add i32 %r130, %r133
  %r135 = load i32, ptr %r134
  %r136 = loadaddr @cns#0
  %r137 = add i32 0, 4 ; loadint
  %r138 = add i32 0, 2 ; loadint
  %r139 = mul i32 %r138, %r137
  %r140 = add i32 %r136, %r139
  %r141 = load i32, ptr %r140
  %r142 = loadaddr @cns#0
  %r143 = add i32 0, 4 ; loadint
  %r144 = add i32 0, 3 ; loadint
  %r145 = mul i32 %r144, %r143
  %r146 = add i32 %r142, %r145
  %r147 = load i32, ptr %r146
  %r148 = loadaddr @cns#0
  %r149 = add i32 0, 4 ; loadint
  %r150 = add i32 0, 4 ; loadint
  %r151 = mul i32 %r150, %r149
  %r152 = add i32 %r148, %r151
  %r153 = load i32, ptr %r152
  %r154 = loadaddr @cns#0
  %r155 = add i32 0, 4 ; loadint
  %r156 = add i32 0, 5 ; loadint
  %r157 = mul i32 %r156, %r155
  %r158 = add i32 %r154, %r157
  %r159 = load i32, ptr %r158
  %r160 = add i32 0, 0 ; loadint
  %r129 = call i32 @dfs(i32 %r135, i32 %r141, i32 %r147, i32 %r153, i32 %r159, i32 %r160)
  store i32 %r129, ptr %r128
  %r162 = load i32, ptr %r128
  %r161 = call i32 @putint(i32 %r162)
  %r163 = load i32, ptr %r128
  ret i32 %r163

}
define i32 @dfs(i32, i32, i32, i32, i32, i32){
B6:
  %r7 = alloca int, 4
  store i32 %r1, ptr %r7
  %r8 = alloca int, 4
  store i32 %r2, ptr %r8
  %r9 = alloca int, 4
  store i32 %r3, ptr %r9
  %r10 = alloca int, 4
  store i32 %r4, ptr %r10
  %r11 = alloca int, 4
  store i32 %r5, ptr %r11
  %r12 = alloca int, 4
  store i32 %r6, ptr %r12
  br label %B7

B7:
  %r13 = loadaddr @dp#0
  %r14 = add i32 0, 4 ; loadint
  %r15 = load i32, ptr %r12
  %r16 = mul i32 %r15, %r14
  %r17 = add i32 %r13, %r16
  %r18 = add i32 0, 7 ; loadint
  %r19 = mul i32 %r14, %r18
  %r20 = load i32, ptr %r11
  %r21 = mul i32 %r20, %r19
  %r22 = add i32 %r17, %r21
  %r23 = add i32 0, 18 ; loadint
  %r24 = mul i32 %r19, %r23
  %r25 = load i32, ptr %r10
  %r26 = mul i32 %r25, %r24
  %r27 = add i32 %r22, %r26
  %r28 = add i32 0, 18 ; loadint
  %r29 = mul i32 %r24, %r28
  %r30 = load i32, ptr %r9
  %r31 = mul i32 %r30, %r29
  %r32 = add i32 %r27, %r31
  %r33 = add i32 0, 18 ; loadint
  %r34 = mul i32 %r29, %r33
  %r35 = load i32, ptr %r8
  %r36 = mul i32 %r35, %r34
  %r37 = add i32 %r32, %r36
  %r38 = add i32 0, 18 ; loadint
  %r39 = mul i32 %r34, %r38
  %r40 = load i32, ptr %r7
  %r41 = mul i32 %r40, %r39
  %r42 = add i32 %r37, %r41
  %r43 = load i32, ptr %r42
  %r44 = add i32 0, 1 ; loadint
  %r46 = add i32 0, 0 ; loadint
  %r45 = sub i32 %r46, %r44
  %r47 = icmp ne i32 %r43, %r45
  br i1 %r47, label %B8, label %B9

B8:
  %r48 = loadaddr @dp#0
  %r49 = add i32 0, 4 ; loadint
  %r50 = load i32, ptr %r12
  %r51 = mul i32 %r50, %r49
  %r52 = add i32 %r48, %r51
  %r53 = add i32 0, 7 ; loadint
  %r54 = mul i32 %r49, %r53
  %r55 = load i32, ptr %r11
  %r56 = mul i32 %r55, %r54
  %r57 = add i32 %r52, %r56
  %r58 = add i32 0, 18 ; loadint
  %r59 = mul i32 %r54, %r58
  %r60 = load i32, ptr %r10
  %r61 = mul i32 %r60, %r59
  %r62 = add i32 %r57, %r61
  %r63 = add i32 0, 18 ; loadint
  %r64 = mul i32 %r59, %r63
  %r65 = load i32, ptr %r9
  %r66 = mul i32 %r65, %r64
  %r67 = add i32 %r62, %r66
  %r68 = add i32 0, 18 ; loadint
  %r69 = mul i32 %r64, %r68
  %r70 = load i32, ptr %r8
  %r71 = mul i32 %r70, %r69
  %r72 = add i32 %r67, %r71
  %r73 = add i32 0, 18 ; loadint
  %r74 = mul i32 %r69, %r73
  %r75 = load i32, ptr %r7
  %r76 = mul i32 %r75, %r74
  %r77 = add i32 %r72, %r76
  %r78 = load i32, ptr %r77
  ret i32 %r78

B9:
  br label %B11

B11:
  %r79 = load i32, ptr %r7
  %r80 = load i32, ptr %r8
  %r81 = add i32 %r79, %r80
  %r82 = load i32, ptr %r9
  %r83 = add i32 %r81, %r82
  %r84 = load i32, ptr %r10
  %r85 = add i32 %r83, %r84
  %r86 = load i32, ptr %r11
  %r87 = add i32 %r85, %r86
  %r88 = add i32 0, 0 ; loadint
  %r89 = icmp eq i32 %r87, %r88
  br i1 %r89, label %B12, label %B13

B12:
  %r90 = add i32 0, 1 ; loadint
  ret i32 %r90

B13:
  %r91 = alloca int, 4
  %r92 = add i32 0, 0 ; loadint
  store i32 %r92, ptr %r91
  br label %B15

B15:
  %r93 = load i32, ptr %r7
  br i1 %r93, label %B16, label %B17

B16:
  %r94 = load i32, ptr %r91
  %r95 = load i32, ptr %r7
  %r97 = load i32, ptr %r12
  %r98 = add i32 0, 2 ; loadint
  %r96 = call i32 @equal(i32 %r97, i32 %r98)
  %r99 = sub i32 %r95, %r96
  %r101 = load i32, ptr %r7
  %r102 = add i32 0, 1 ; loadint
  %r103 = sub i32 %r101, %r102
  %r104 = load i32, ptr %r8
  %r105 = load i32, ptr %r9
  %r106 = load i32, ptr %r10
  %r107 = load i32, ptr %r11
  %r108 = add i32 0, 1 ; loadint
  %r100 = call i32 @dfs(i32 %r103, i32 %r104, i32 %r105, i32 %r106, i32 %r107, i32 %r108)
  %r109 = mul i32 %r99, %r100
  %r110 = add i32 %r94, %r109
  %r111 = loadaddr @mod#0
  %r112 = load i32, ptr %r111
  %r113 = srem i32 %r110, %r112
  store i32 %r113, ptr %r91
  br label %B17

B17:
  br label %B18

B18:
  %r114 = load i32, ptr %r8
  br i1 %r114, label %B19, label %B20

B19:
  %r115 = load i32, ptr %r91
  %r116 = load i32, ptr %r8
  %r118 = load i32, ptr %r12
  %r119 = add i32 0, 3 ; loadint
  %r117 = call i32 @equal(i32 %r118, i32 %r119)
  %r120 = sub i32 %r116, %r117
  %r122 = load i32, ptr %r7
  %r123 = add i32 0, 1 ; loadint
  %r124 = add i32 %r122, %r123
  %r125 = load i32, ptr %r8
  %r126 = add i32 0, 1 ; loadint
  %r127 = sub i32 %r125, %r126
  %r128 = load i32, ptr %r9
  %r129 = load i32, ptr %r10
  %r130 = load i32, ptr %r11
  %r131 = add i32 0, 2 ; loadint
  %r121 = call i32 @dfs(i32 %r124, i32 %r127, i32 %r128, i32 %r129, i32 %r130, i32 %r131)
  %r132 = mul i32 %r120, %r121
  %r133 = add i32 %r115, %r132
  %r134 = loadaddr @mod#0
  %r135 = load i32, ptr %r134
  %r136 = srem i32 %r133, %r135
  store i32 %r136, ptr %r91
  br label %B20

B20:
  br label %B21

B21:
  %r137 = load i32, ptr %r9
  br i1 %r137, label %B22, label %B23

B22:
  %r138 = load i32, ptr %r91
  %r139 = load i32, ptr %r9
  %r141 = load i32, ptr %r12
  %r142 = add i32 0, 4 ; loadint
  %r140 = call i32 @equal(i32 %r141, i32 %r142)
  %r143 = sub i32 %r139, %r140
  %r145 = load i32, ptr %r7
  %r146 = load i32, ptr %r8
  %r147 = add i32 0, 1 ; loadint
  %r148 = add i32 %r146, %r147
  %r149 = load i32, ptr %r9
  %r150 = add i32 0, 1 ; loadint
  %r151 = sub i32 %r149, %r150
  %r152 = load i32, ptr %r10
  %r153 = load i32, ptr %r11
  %r154 = add i32 0, 3 ; loadint
  %r144 = call i32 @dfs(i32 %r145, i32 %r148, i32 %r151, i32 %r152, i32 %r153, i32 %r154)
  %r155 = mul i32 %r143, %r144
  %r156 = add i32 %r138, %r155
  %r157 = loadaddr @mod#0
  %r158 = load i32, ptr %r157
  %r159 = srem i32 %r156, %r158
  store i32 %r159, ptr %r91
  br label %B23

B23:
  br label %B24

B24:
  %r160 = load i32, ptr %r10
  br i1 %r160, label %B25, label %B26

B25:
  %r161 = load i32, ptr %r91
  %r162 = load i32, ptr %r10
  %r164 = load i32, ptr %r12
  %r165 = add i32 0, 5 ; loadint
  %r163 = call i32 @equal(i32 %r164, i32 %r165)
  %r166 = sub i32 %r162, %r163
  %r168 = load i32, ptr %r7
  %r169 = load i32, ptr %r8
  %r170 = load i32, ptr %r9
  %r171 = add i32 0, 1 ; loadint
  %r172 = add i32 %r170, %r171
  %r173 = load i32, ptr %r10
  %r174 = add i32 0, 1 ; loadint
  %r175 = sub i32 %r173, %r174
  %r176 = load i32, ptr %r11
  %r177 = add i32 0, 4 ; loadint
  %r167 = call i32 @dfs(i32 %r168, i32 %r169, i32 %r172, i32 %r175, i32 %r176, i32 %r177)
  %r178 = mul i32 %r166, %r167
  %r179 = add i32 %r161, %r178
  %r180 = loadaddr @mod#0
  %r181 = load i32, ptr %r180
  %r182 = srem i32 %r179, %r181
  store i32 %r182, ptr %r91
  br label %B26

B26:
  br label %B27

B27:
  %r183 = load i32, ptr %r11
  br i1 %r183, label %B28, label %B29

B28:
  %r184 = load i32, ptr %r91
  %r185 = load i32, ptr %r11
  %r187 = load i32, ptr %r7
  %r188 = load i32, ptr %r8
  %r189 = load i32, ptr %r9
  %r190 = load i32, ptr %r10
  %r191 = add i32 0, 1 ; loadint
  %r192 = add i32 %r190, %r191
  %r193 = load i32, ptr %r11
  %r194 = add i32 0, 1 ; loadint
  %r195 = sub i32 %r193, %r194
  %r196 = add i32 0, 5 ; loadint
  %r186 = call i32 @dfs(i32 %r187, i32 %r188, i32 %r189, i32 %r192, i32 %r195, i32 %r196)
  %r197 = mul i32 %r185, %r186
  %r198 = add i32 %r184, %r197
  %r199 = loadaddr @mod#0
  %r200 = load i32, ptr %r199
  %r201 = srem i32 %r198, %r200
  store i32 %r201, ptr %r91
  br label %B29

B29:
  %r202 = load i32, ptr %r91
  %r203 = loadaddr @mod#0
  %r204 = load i32, ptr %r203
  %r205 = srem i32 %r202, %r204
  %r206 = loadaddr @dp#0
  %r207 = loadaddr @dp#0
  %r208 = add i32 0, 4 ; loadint
  %r209 = load i32, ptr %r12
  %r210 = mul i32 %r209, %r208
  %r211 = add i32 %r207, %r210
  %r212 = add i32 0, 7 ; loadint
  %r213 = mul i32 %r208, %r212
  %r214 = load i32, ptr %r11
  %r215 = mul i32 %r214, %r213
  %r216 = add i32 %r211, %r215
  %r217 = add i32 0, 18 ; loadint
  %r218 = mul i32 %r213, %r217
  %r219 = load i32, ptr %r10
  %r220 = mul i32 %r219, %r218
  %r221 = add i32 %r216, %r220
  %r222 = add i32 0, 18 ; loadint
  %r223 = mul i32 %r218, %r222
  %r224 = load i32, ptr %r9
  %r225 = mul i32 %r224, %r223
  %r226 = add i32 %r221, %r225
  %r227 = add i32 0, 18 ; loadint
  %r228 = mul i32 %r223, %r227
  %r229 = load i32, ptr %r8
  %r230 = mul i32 %r229, %r228
  %r231 = add i32 %r226, %r230
  %r232 = add i32 0, 18 ; loadint
  %r233 = mul i32 %r228, %r232
  %r234 = load i32, ptr %r7
  %r235 = mul i32 %r234, %r233
  %r236 = add i32 %r231, %r235
  store i32 %r205, ptr %r236
  %r237 = loadaddr @dp#0
  %r238 = add i32 0, 4 ; loadint
  %r239 = load i32, ptr %r12
  %r240 = mul i32 %r239, %r238
  %r241 = add i32 %r237, %r240
  %r242 = add i32 0, 7 ; loadint
  %r243 = mul i32 %r238, %r242
  %r244 = load i32, ptr %r11
  %r245 = mul i32 %r244, %r243
  %r246 = add i32 %r241, %r245
  %r247 = add i32 0, 18 ; loadint
  %r248 = mul i32 %r243, %r247
  %r249 = load i32, ptr %r10
  %r250 = mul i32 %r249, %r248
  %r251 = add i32 %r246, %r250
  %r252 = add i32 0, 18 ; loadint
  %r253 = mul i32 %r248, %r252
  %r254 = load i32, ptr %r9
  %r255 = mul i32 %r254, %r253
  %r256 = add i32 %r251, %r255
  %r257 = add i32 0, 18 ; loadint
  %r258 = mul i32 %r253, %r257
  %r259 = load i32, ptr %r8
  %r260 = mul i32 %r259, %r258
  %r261 = add i32 %r256, %r260
  %r262 = add i32 0, 18 ; loadint
  %r263 = mul i32 %r258, %r262
  %r264 = load i32, ptr %r7
  %r265 = mul i32 %r264, %r263
  %r266 = add i32 %r261, %r265
  %r267 = load i32, ptr %r266
  ret i32 %r267

}
define i32 @equal(i32, i32){
B0:
  %r3 = alloca int, 4
  store i32 %r1, ptr %r3
  %r4 = alloca int, 4
  store i32 %r2, ptr %r4
  br label %B1

B1:
  %r5 = load i32, ptr %r3
  %r6 = load i32, ptr %r4
  %r7 = icmp eq i32 %r5, %r6
  br i1 %r7, label %B2, label %B3

B2:
  %r8 = add i32 0, 1 ; loadint
  ret i32 %r8

B3:
  %r9 = add i32 0, 0 ; loadint
  ret i32 %r9

}
