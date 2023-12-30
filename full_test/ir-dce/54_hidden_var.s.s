; module
@b#0 = global int 5, 4
@c#0 = global int [4] [i32 6, i32 7, i32 8, i32 9], 16
define i32 @main(){
B0:
  %r1 = alloca int, 4
  %r2 = add i32 0, 1 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca int, 4
  %r4 = add i32 0, 2 ; loadint
  store i32 %r4, ptr %r3
  %r5 = add i32 0, 3 ; loadint
  store i32 %r5, ptr %r3
  %r7 = load i32, ptr %r3
  %r6 = call i32 @putint(i32 %r7)
  %r9 = load i32, ptr %r3
  %r8 = call i32 @putint(i32 %r9)
  %r11 = load i32, ptr %r1
  %r10 = call i32 @putint(i32 %r11)
  %r13 = add i32 0, 10 ; loadint
  %r12 = call i32 @putch(i32 %r13)
  br label %B1

B1:
  %r14 = load i32, ptr %r1
  %r15 = add i32 0, 5 ; loadint
  %r16 = icmp slt i32 %r14, %r15
  br i1 %r16, label %B2, label %B3

B2:
  %r17 = alloca int, 4
  %r18 = add i32 0, 0 ; loadint
  store i32 %r18, ptr %r17
  %r19 = load i32, ptr %r17
  %r20 = add i32 0, 1 ; loadint
  %r21 = add i32 %r19, %r20
  store i32 %r21, ptr %r17
  br label %B4

B3:
  %r24 = load i32, ptr %r1
  %r23 = call i32 @putint(i32 %r24)
  %r26 = add i32 0, 10 ; loadint
  %r25 = call i32 @putch(i32 %r26)
  %r27 = add i32 0, 1 ; loadint
  %r28 = loadaddr @c#0
  %r29 = loadaddr @c#0
  %r30 = add i32 0, 4 ; loadint
  %r31 = add i32 0, 2 ; loadint
  %r32 = mul i32 %r31, %r30
  %r33 = add i32 %r29, %r32
  store i32 %r27, ptr %r33
  %r34 = alloca int [2,8], 64
  %r35 = add i32 0, 0 ; loadint
  %r37 = add i32 0, 0 ; loadint
  %r36 = add i32 %r34, %r37
  store i32 %r35, ptr %r36
  %r38 = add i32 0, 9 ; loadint
  %r40 = add i32 0, 4 ; loadint
  %r39 = add i32 %r34, %r40
  store i32 %r38, ptr %r39
  %r41 = add i32 0, 0 ; loadint
  %r43 = add i32 0, 8 ; loadint
  %r42 = add i32 %r34, %r43
  store i32 %r41, ptr %r42
  %r44 = add i32 0, 0 ; loadint
  %r46 = add i32 0, 12 ; loadint
  %r45 = add i32 %r34, %r46
  store i32 %r44, ptr %r45
  %r47 = add i32 0, 0 ; loadint
  %r49 = add i32 0, 16 ; loadint
  %r48 = add i32 %r34, %r49
  store i32 %r47, ptr %r48
  %r50 = add i32 0, 0 ; loadint
  %r52 = add i32 0, 20 ; loadint
  %r51 = add i32 %r34, %r52
  store i32 %r50, ptr %r51
  %r53 = add i32 0, 0 ; loadint
  %r55 = add i32 0, 24 ; loadint
  %r54 = add i32 %r34, %r55
  store i32 %r53, ptr %r54
  %r56 = add i32 0, 0 ; loadint
  %r58 = add i32 0, 28 ; loadint
  %r57 = add i32 %r34, %r58
  store i32 %r56, ptr %r57
  %r59 = add i32 0, 8 ; loadint
  %r61 = add i32 0, 32 ; loadint
  %r60 = add i32 %r34, %r61
  store i32 %r59, ptr %r60
  %r62 = add i32 0, 3 ; loadint
  %r64 = add i32 0, 36 ; loadint
  %r63 = add i32 %r34, %r64
  store i32 %r62, ptr %r63
  %r65 = add i32 0, 0 ; loadint
  %r67 = add i32 0, 40 ; loadint
  %r66 = add i32 %r34, %r67
  store i32 %r65, ptr %r66
  %r68 = add i32 0, 0 ; loadint
  %r70 = add i32 0, 44 ; loadint
  %r69 = add i32 %r34, %r70
  store i32 %r68, ptr %r69
  %r71 = add i32 0, 0 ; loadint
  %r73 = add i32 0, 48 ; loadint
  %r72 = add i32 %r34, %r73
  store i32 %r71, ptr %r72
  %r74 = add i32 0, 0 ; loadint
  %r76 = add i32 0, 52 ; loadint
  %r75 = add i32 %r34, %r76
  store i32 %r74, ptr %r75
  %r77 = add i32 0, 0 ; loadint
  %r79 = add i32 0, 56 ; loadint
  %r78 = add i32 %r34, %r79
  store i32 %r77, ptr %r78
  %r80 = add i32 0, 0 ; loadint
  %r82 = add i32 0, 60 ; loadint
  %r81 = add i32 %r34, %r82
  store i32 %r80, ptr %r81
  %r83 = alloca int, 4
  %r84 = add i32 0, 2 ; loadint
  store i32 %r84, ptr %r83
  br label %B8

B4:
  %r22 = load i32, ptr %r17
  br i1 %r22, label %B5, label %B6

B5:
  br label %B3

B6:
  br label %B1

B8:
  %r85 = loadaddr @c#0
  %r86 = add i32 0, 4 ; loadint
  %r87 = add i32 0, 2 ; loadint
  %r88 = mul i32 %r87, %r86
  %r89 = add i32 %r85, %r88
  %r90 = load i32, ptr %r89
  br i1 %r90, label %B9, label %B10

B9:
  %r91 = alloca int [7,1,5], 140
  %r92 = add i32 0, 0 ; loadint
  %r94 = add i32 0, 0 ; loadint
  %r93 = add i32 %r91, %r94
  store i32 %r92, ptr %r93
  %r95 = add i32 0, 0 ; loadint
  %r97 = add i32 0, 4 ; loadint
  %r96 = add i32 %r91, %r97
  store i32 %r95, ptr %r96
  %r98 = add i32 0, 0 ; loadint
  %r100 = add i32 0, 8 ; loadint
  %r99 = add i32 %r91, %r100
  store i32 %r98, ptr %r99
  %r101 = add i32 0, 0 ; loadint
  %r103 = add i32 0, 12 ; loadint
  %r102 = add i32 %r91, %r103
  store i32 %r101, ptr %r102
  %r104 = add i32 0, 0 ; loadint
  %r106 = add i32 0, 16 ; loadint
  %r105 = add i32 %r91, %r106
  store i32 %r104, ptr %r105
  %r107 = add i32 0, 0 ; loadint
  %r109 = add i32 0, 20 ; loadint
  %r108 = add i32 %r91, %r109
  store i32 %r107, ptr %r108
  %r110 = add i32 0, 0 ; loadint
  %r112 = add i32 0, 24 ; loadint
  %r111 = add i32 %r91, %r112
  store i32 %r110, ptr %r111
  %r113 = add i32 0, 0 ; loadint
  %r115 = add i32 0, 28 ; loadint
  %r114 = add i32 %r91, %r115
  store i32 %r113, ptr %r114
  %r116 = add i32 0, 0 ; loadint
  %r118 = add i32 0, 32 ; loadint
  %r117 = add i32 %r91, %r118
  store i32 %r116, ptr %r117
  %r119 = add i32 0, 0 ; loadint
  %r121 = add i32 0, 36 ; loadint
  %r120 = add i32 %r91, %r121
  store i32 %r119, ptr %r120
  %r122 = add i32 0, 2 ; loadint
  %r124 = add i32 0, 40 ; loadint
  %r123 = add i32 %r91, %r124
  store i32 %r122, ptr %r123
  %r125 = add i32 0, 1 ; loadint
  %r127 = add i32 0, 44 ; loadint
  %r126 = add i32 %r91, %r127
  store i32 %r125, ptr %r126
  %r128 = add i32 0, 8 ; loadint
  %r130 = add i32 0, 48 ; loadint
  %r129 = add i32 %r91, %r130
  store i32 %r128, ptr %r129
  %r131 = add i32 0, 0 ; loadint
  %r133 = add i32 0, 52 ; loadint
  %r132 = add i32 %r91, %r133
  store i32 %r131, ptr %r132
  %r134 = add i32 0, 0 ; loadint
  %r136 = add i32 0, 56 ; loadint
  %r135 = add i32 %r91, %r136
  store i32 %r134, ptr %r135
  %r137 = add i32 0, 0 ; loadint
  %r139 = add i32 0, 0 ; loadint
  %r138 = add i32 %r91, %r139
  store i32 %r137, ptr %r138
  %r140 = add i32 0, 0 ; loadint
  %r142 = add i32 0, 4 ; loadint
  %r141 = add i32 %r91, %r142
  store i32 %r140, ptr %r141
  %r143 = add i32 0, 0 ; loadint
  %r145 = add i32 0, 8 ; loadint
  %r144 = add i32 %r91, %r145
  store i32 %r143, ptr %r144
  %r146 = add i32 0, 0 ; loadint
  %r148 = add i32 0, 12 ; loadint
  %r147 = add i32 %r91, %r148
  store i32 %r146, ptr %r147
  %r149 = add i32 0, 0 ; loadint
  %r151 = add i32 0, 16 ; loadint
  %r150 = add i32 %r91, %r151
  store i32 %r149, ptr %r150
  %r152 = add i32 0, 0 ; loadint
  %r154 = add i32 0, 80 ; loadint
  %r153 = add i32 %r91, %r154
  store i32 %r152, ptr %r153
  %r155 = add i32 0, 0 ; loadint
  %r157 = add i32 0, 84 ; loadint
  %r156 = add i32 %r91, %r157
  store i32 %r155, ptr %r156
  %r158 = add i32 0, 0 ; loadint
  %r160 = add i32 0, 88 ; loadint
  %r159 = add i32 %r91, %r160
  store i32 %r158, ptr %r159
  %r161 = add i32 0, 0 ; loadint
  %r163 = add i32 0, 92 ; loadint
  %r162 = add i32 %r91, %r163
  store i32 %r161, ptr %r162
  %r164 = add i32 0, 0 ; loadint
  %r166 = add i32 0, 96 ; loadint
  %r165 = add i32 %r91, %r166
  store i32 %r164, ptr %r165
  %r167 = add i32 0, 0 ; loadint
  %r169 = add i32 0, 100 ; loadint
  %r168 = add i32 %r91, %r169
  store i32 %r167, ptr %r168
  %r170 = add i32 0, 0 ; loadint
  %r172 = add i32 0, 104 ; loadint
  %r171 = add i32 %r91, %r172
  store i32 %r170, ptr %r171
  %r173 = add i32 0, 0 ; loadint
  %r175 = add i32 0, 108 ; loadint
  %r174 = add i32 %r91, %r175
  store i32 %r173, ptr %r174
  %r176 = add i32 0, 0 ; loadint
  %r178 = add i32 0, 112 ; loadint
  %r177 = add i32 %r91, %r178
  store i32 %r176, ptr %r177
  %r179 = add i32 0, 0 ; loadint
  %r181 = add i32 0, 116 ; loadint
  %r180 = add i32 %r91, %r181
  store i32 %r179, ptr %r180
  %r182 = add i32 0, 0 ; loadint
  %r184 = add i32 0, 120 ; loadint
  %r183 = add i32 %r91, %r184
  store i32 %r182, ptr %r183
  %r185 = add i32 0, 0 ; loadint
  %r187 = add i32 0, 124 ; loadint
  %r186 = add i32 %r91, %r187
  store i32 %r185, ptr %r186
  %r188 = add i32 0, 0 ; loadint
  %r190 = add i32 0, 128 ; loadint
  %r189 = add i32 %r91, %r190
  store i32 %r188, ptr %r189
  %r191 = add i32 0, 0 ; loadint
  %r193 = add i32 0, 132 ; loadint
  %r192 = add i32 %r91, %r193
  store i32 %r191, ptr %r192
  %r194 = add i32 0, 0 ; loadint
  %r196 = add i32 0, 136 ; loadint
  %r195 = add i32 %r91, %r196
  store i32 %r194, ptr %r195
  %r198 = add i32 0, 4 ; loadint
  %r199 = add i32 0, 0 ; loadint
  %r200 = mul i32 %r199, %r198
  %r201 = add i32 %r91, %r200
  %r202 = add i32 0, 5 ; loadint
  %r203 = mul i32 %r198, %r202
  %r204 = add i32 0, 0 ; loadint
  %r205 = mul i32 %r204, %r203
  %r206 = add i32 %r201, %r205
  %r207 = add i32 0, 1 ; loadint
  %r208 = mul i32 %r203, %r207
  %r209 = load i32, ptr %r83
  %r210 = mul i32 %r209, %r208
  %r211 = add i32 %r206, %r210
  %r212 = load i32, ptr %r211
  %r197 = call i32 @putint(i32 %r212)
  %r214 = add i32 0, 4 ; loadint
  %r215 = add i32 0, 1 ; loadint
  %r216 = mul i32 %r215, %r214
  %r217 = add i32 %r91, %r216
  %r218 = add i32 0, 5 ; loadint
  %r219 = mul i32 %r214, %r218
  %r220 = add i32 0, 0 ; loadint
  %r221 = mul i32 %r220, %r219
  %r222 = add i32 %r217, %r221
  %r223 = add i32 0, 1 ; loadint
  %r224 = mul i32 %r219, %r223
  %r225 = load i32, ptr %r83
  %r226 = mul i32 %r225, %r224
  %r227 = add i32 %r222, %r226
  %r228 = load i32, ptr %r227
  %r213 = call i32 @putint(i32 %r228)
  %r230 = add i32 0, 4 ; loadint
  %r231 = add i32 0, 2 ; loadint
  %r232 = mul i32 %r231, %r230
  %r233 = add i32 %r91, %r232
  %r234 = add i32 0, 5 ; loadint
  %r235 = mul i32 %r230, %r234
  %r236 = add i32 0, 0 ; loadint
  %r237 = mul i32 %r236, %r235
  %r238 = add i32 %r233, %r237
  %r239 = add i32 0, 1 ; loadint
  %r240 = mul i32 %r235, %r239
  %r241 = load i32, ptr %r83
  %r242 = mul i32 %r241, %r240
  %r243 = add i32 %r238, %r242
  %r244 = load i32, ptr %r243
  %r229 = call i32 @putint(i32 %r244)
  br label %B10

B10:
  %r246 = add i32 0, 10 ; loadint
  %r245 = call i32 @putch(i32 %r246)
  %r248 = loadaddr @b#0
  %r249 = load i32, ptr %r248
  %r247 = call i32 @putint(i32 %r249)
  %r251 = add i32 0, 10 ; loadint
  %r250 = call i32 @putch(i32 %r251)
  %r253 = loadaddr @c#0
  %r254 = add i32 0, 4 ; loadint
  %r255 = add i32 0, 0 ; loadint
  %r256 = mul i32 %r255, %r254
  %r257 = add i32 %r253, %r256
  %r258 = load i32, ptr %r257
  %r252 = call i32 @putint(i32 %r258)
  %r260 = loadaddr @c#0
  %r261 = add i32 0, 4 ; loadint
  %r262 = add i32 0, 1 ; loadint
  %r263 = mul i32 %r262, %r261
  %r264 = add i32 %r260, %r263
  %r265 = load i32, ptr %r264
  %r259 = call i32 @putint(i32 %r265)
  %r267 = loadaddr @c#0
  %r268 = add i32 0, 4 ; loadint
  %r269 = add i32 0, 2 ; loadint
  %r270 = mul i32 %r269, %r268
  %r271 = add i32 %r267, %r270
  %r272 = load i32, ptr %r271
  %r266 = call i32 @putint(i32 %r272)
  %r274 = loadaddr @c#0
  %r275 = add i32 0, 4 ; loadint
  %r276 = add i32 0, 3 ; loadint
  %r277 = mul i32 %r276, %r275
  %r278 = add i32 %r274, %r277
  %r279 = load i32, ptr %r278
  %r273 = call i32 @putint(i32 %r279)
  %r281 = add i32 0, 10 ; loadint
  %r280 = call i32 @putch(i32 %r281)
  %r282 = add i32 0, 0 ; loadint
  ret i32 %r282

}
