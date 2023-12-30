; module
@len#0 = global const int 20, 4
define i32 @main(){
B0:
  %r1 = alloca int, 4
  %r2 = alloca int, 4
  %r3 = alloca int, 4
  %r4 = alloca int, 4
  %r5 = alloca int, 4
  %r6 = alloca int [20], 80
  %r7 = add i32 0, 1 ; loadint
  %r9 = add i32 0, 0 ; loadint
  %r8 = add i32 %r6, %r9
  store i32 %r7, ptr %r8
  %r10 = add i32 0, 2 ; loadint
  %r12 = add i32 0, 4 ; loadint
  %r11 = add i32 %r6, %r12
  store i32 %r10, ptr %r11
  %r13 = add i32 0, 3 ; loadint
  %r15 = add i32 0, 8 ; loadint
  %r14 = add i32 %r6, %r15
  store i32 %r13, ptr %r14
  %r16 = add i32 0, 4 ; loadint
  %r18 = add i32 0, 12 ; loadint
  %r17 = add i32 %r6, %r18
  store i32 %r16, ptr %r17
  %r19 = add i32 0, 5 ; loadint
  %r21 = add i32 0, 16 ; loadint
  %r20 = add i32 %r6, %r21
  store i32 %r19, ptr %r20
  %r22 = add i32 0, 6 ; loadint
  %r24 = add i32 0, 20 ; loadint
  %r23 = add i32 %r6, %r24
  store i32 %r22, ptr %r23
  %r25 = add i32 0, 7 ; loadint
  %r27 = add i32 0, 24 ; loadint
  %r26 = add i32 %r6, %r27
  store i32 %r25, ptr %r26
  %r28 = add i32 0, 8 ; loadint
  %r30 = add i32 0, 28 ; loadint
  %r29 = add i32 %r6, %r30
  store i32 %r28, ptr %r29
  %r31 = add i32 0, 9 ; loadint
  %r33 = add i32 0, 32 ; loadint
  %r32 = add i32 %r6, %r33
  store i32 %r31, ptr %r32
  %r34 = add i32 0, 0 ; loadint
  %r36 = add i32 0, 36 ; loadint
  %r35 = add i32 %r6, %r36
  store i32 %r34, ptr %r35
  %r37 = add i32 0, 1 ; loadint
  %r39 = add i32 0, 40 ; loadint
  %r38 = add i32 %r6, %r39
  store i32 %r37, ptr %r38
  %r40 = add i32 0, 2 ; loadint
  %r42 = add i32 0, 44 ; loadint
  %r41 = add i32 %r6, %r42
  store i32 %r40, ptr %r41
  %r43 = add i32 0, 3 ; loadint
  %r45 = add i32 0, 48 ; loadint
  %r44 = add i32 %r6, %r45
  store i32 %r43, ptr %r44
  %r46 = add i32 0, 4 ; loadint
  %r48 = add i32 0, 52 ; loadint
  %r47 = add i32 %r6, %r48
  store i32 %r46, ptr %r47
  %r49 = add i32 0, 5 ; loadint
  %r51 = add i32 0, 56 ; loadint
  %r50 = add i32 %r6, %r51
  store i32 %r49, ptr %r50
  %r52 = add i32 0, 6 ; loadint
  %r54 = add i32 0, 60 ; loadint
  %r53 = add i32 %r6, %r54
  store i32 %r52, ptr %r53
  %r55 = add i32 0, 7 ; loadint
  %r57 = add i32 0, 64 ; loadint
  %r56 = add i32 %r6, %r57
  store i32 %r55, ptr %r56
  %r58 = add i32 0, 8 ; loadint
  %r60 = add i32 0, 68 ; loadint
  %r59 = add i32 %r6, %r60
  store i32 %r58, ptr %r59
  %r61 = add i32 0, 9 ; loadint
  %r63 = add i32 0, 72 ; loadint
  %r62 = add i32 %r6, %r63
  store i32 %r61, ptr %r62
  %r64 = add i32 0, 0 ; loadint
  %r66 = add i32 0, 76 ; loadint
  %r65 = add i32 %r6, %r66
  store i32 %r64, ptr %r65
  %r67 = alloca int [20], 80
  %r68 = add i32 0, 2 ; loadint
  %r70 = add i32 0, 0 ; loadint
  %r69 = add i32 %r67, %r70
  store i32 %r68, ptr %r69
  %r71 = add i32 0, 3 ; loadint
  %r73 = add i32 0, 4 ; loadint
  %r72 = add i32 %r67, %r73
  store i32 %r71, ptr %r72
  %r74 = add i32 0, 4 ; loadint
  %r76 = add i32 0, 8 ; loadint
  %r75 = add i32 %r67, %r76
  store i32 %r74, ptr %r75
  %r77 = add i32 0, 2 ; loadint
  %r79 = add i32 0, 12 ; loadint
  %r78 = add i32 %r67, %r79
  store i32 %r77, ptr %r78
  %r80 = add i32 0, 5 ; loadint
  %r82 = add i32 0, 16 ; loadint
  %r81 = add i32 %r67, %r82
  store i32 %r80, ptr %r81
  %r83 = add i32 0, 7 ; loadint
  %r85 = add i32 0, 20 ; loadint
  %r84 = add i32 %r67, %r85
  store i32 %r83, ptr %r84
  %r86 = add i32 0, 9 ; loadint
  %r88 = add i32 0, 24 ; loadint
  %r87 = add i32 %r67, %r88
  store i32 %r86, ptr %r87
  %r89 = add i32 0, 9 ; loadint
  %r91 = add i32 0, 28 ; loadint
  %r90 = add i32 %r67, %r91
  store i32 %r89, ptr %r90
  %r92 = add i32 0, 0 ; loadint
  %r94 = add i32 0, 32 ; loadint
  %r93 = add i32 %r67, %r94
  store i32 %r92, ptr %r93
  %r95 = add i32 0, 1 ; loadint
  %r97 = add i32 0, 36 ; loadint
  %r96 = add i32 %r67, %r97
  store i32 %r95, ptr %r96
  %r98 = add i32 0, 9 ; loadint
  %r100 = add i32 0, 40 ; loadint
  %r99 = add i32 %r67, %r100
  store i32 %r98, ptr %r99
  %r101 = add i32 0, 8 ; loadint
  %r103 = add i32 0, 44 ; loadint
  %r102 = add i32 %r67, %r103
  store i32 %r101, ptr %r102
  %r104 = add i32 0, 7 ; loadint
  %r106 = add i32 0, 48 ; loadint
  %r105 = add i32 %r67, %r106
  store i32 %r104, ptr %r105
  %r107 = add i32 0, 6 ; loadint
  %r109 = add i32 0, 52 ; loadint
  %r108 = add i32 %r67, %r109
  store i32 %r107, ptr %r108
  %r110 = add i32 0, 4 ; loadint
  %r112 = add i32 0, 56 ; loadint
  %r111 = add i32 %r67, %r112
  store i32 %r110, ptr %r111
  %r113 = add i32 0, 3 ; loadint
  %r115 = add i32 0, 60 ; loadint
  %r114 = add i32 %r67, %r115
  store i32 %r113, ptr %r114
  %r116 = add i32 0, 2 ; loadint
  %r118 = add i32 0, 64 ; loadint
  %r117 = add i32 %r67, %r118
  store i32 %r116, ptr %r117
  %r119 = add i32 0, 1 ; loadint
  %r121 = add i32 0, 68 ; loadint
  %r120 = add i32 %r67, %r121
  store i32 %r119, ptr %r120
  %r122 = add i32 0, 2 ; loadint
  %r124 = add i32 0, 72 ; loadint
  %r123 = add i32 %r67, %r124
  store i32 %r122, ptr %r123
  %r125 = add i32 0, 2 ; loadint
  %r127 = add i32 0, 76 ; loadint
  %r126 = add i32 %r67, %r127
  store i32 %r125, ptr %r126
  %r128 = alloca int, 4
  %r129 = loadaddr @len#0
  %r130 = load i32, ptr %r129
  store i32 %r130, ptr %r128
  %r131 = alloca int, 4
  %r132 = loadaddr @len#0
  %r133 = load i32, ptr %r132
  store i32 %r133, ptr %r131
  %r134 = alloca int [25], 100
  %r135 = alloca int [25], 100
  %r136 = alloca int [40], 160
  %r137 = add i32 0, 0 ; loadint
  %r139 = add i32 0, 0 ; loadint
  %r138 = add i32 %r136, %r139
  store i32 %r137, ptr %r138
  %r140 = add i32 0, 0 ; loadint
  %r142 = add i32 0, 4 ; loadint
  %r141 = add i32 %r136, %r142
  store i32 %r140, ptr %r141
  %r143 = add i32 0, 0 ; loadint
  %r145 = add i32 0, 8 ; loadint
  %r144 = add i32 %r136, %r145
  store i32 %r143, ptr %r144
  %r146 = add i32 0, 0 ; loadint
  %r148 = add i32 0, 12 ; loadint
  %r147 = add i32 %r136, %r148
  store i32 %r146, ptr %r147
  %r149 = add i32 0, 0 ; loadint
  %r151 = add i32 0, 16 ; loadint
  %r150 = add i32 %r136, %r151
  store i32 %r149, ptr %r150
  %r152 = add i32 0, 0 ; loadint
  %r154 = add i32 0, 20 ; loadint
  %r153 = add i32 %r136, %r154
  store i32 %r152, ptr %r153
  %r155 = add i32 0, 0 ; loadint
  %r157 = add i32 0, 24 ; loadint
  %r156 = add i32 %r136, %r157
  store i32 %r155, ptr %r156
  %r158 = add i32 0, 0 ; loadint
  %r160 = add i32 0, 28 ; loadint
  %r159 = add i32 %r136, %r160
  store i32 %r158, ptr %r159
  %r161 = add i32 0, 0 ; loadint
  %r163 = add i32 0, 32 ; loadint
  %r162 = add i32 %r136, %r163
  store i32 %r161, ptr %r162
  %r164 = add i32 0, 0 ; loadint
  %r166 = add i32 0, 36 ; loadint
  %r165 = add i32 %r136, %r166
  store i32 %r164, ptr %r165
  %r167 = add i32 0, 0 ; loadint
  %r169 = add i32 0, 40 ; loadint
  %r168 = add i32 %r136, %r169
  store i32 %r167, ptr %r168
  %r170 = add i32 0, 0 ; loadint
  %r172 = add i32 0, 44 ; loadint
  %r171 = add i32 %r136, %r172
  store i32 %r170, ptr %r171
  %r173 = add i32 0, 0 ; loadint
  %r175 = add i32 0, 48 ; loadint
  %r174 = add i32 %r136, %r175
  store i32 %r173, ptr %r174
  %r176 = add i32 0, 0 ; loadint
  %r178 = add i32 0, 52 ; loadint
  %r177 = add i32 %r136, %r178
  store i32 %r176, ptr %r177
  %r179 = add i32 0, 0 ; loadint
  %r181 = add i32 0, 56 ; loadint
  %r180 = add i32 %r136, %r181
  store i32 %r179, ptr %r180
  %r182 = add i32 0, 0 ; loadint
  %r184 = add i32 0, 60 ; loadint
  %r183 = add i32 %r136, %r184
  store i32 %r182, ptr %r183
  %r185 = add i32 0, 0 ; loadint
  %r187 = add i32 0, 64 ; loadint
  %r186 = add i32 %r136, %r187
  store i32 %r185, ptr %r186
  %r188 = add i32 0, 0 ; loadint
  %r190 = add i32 0, 68 ; loadint
  %r189 = add i32 %r136, %r190
  store i32 %r188, ptr %r189
  %r191 = add i32 0, 0 ; loadint
  %r193 = add i32 0, 72 ; loadint
  %r192 = add i32 %r136, %r193
  store i32 %r191, ptr %r192
  %r194 = add i32 0, 0 ; loadint
  %r196 = add i32 0, 76 ; loadint
  %r195 = add i32 %r136, %r196
  store i32 %r194, ptr %r195
  %r197 = add i32 0, 0 ; loadint
  %r199 = add i32 0, 80 ; loadint
  %r198 = add i32 %r136, %r199
  store i32 %r197, ptr %r198
  %r200 = add i32 0, 0 ; loadint
  %r202 = add i32 0, 84 ; loadint
  %r201 = add i32 %r136, %r202
  store i32 %r200, ptr %r201
  %r203 = add i32 0, 0 ; loadint
  %r205 = add i32 0, 88 ; loadint
  %r204 = add i32 %r136, %r205
  store i32 %r203, ptr %r204
  %r206 = add i32 0, 0 ; loadint
  %r208 = add i32 0, 92 ; loadint
  %r207 = add i32 %r136, %r208
  store i32 %r206, ptr %r207
  %r209 = add i32 0, 0 ; loadint
  %r211 = add i32 0, 96 ; loadint
  %r210 = add i32 %r136, %r211
  store i32 %r209, ptr %r210
  %r212 = add i32 0, 0 ; loadint
  %r214 = add i32 0, 100 ; loadint
  %r213 = add i32 %r136, %r214
  store i32 %r212, ptr %r213
  %r215 = add i32 0, 0 ; loadint
  %r217 = add i32 0, 104 ; loadint
  %r216 = add i32 %r136, %r217
  store i32 %r215, ptr %r216
  %r218 = add i32 0, 0 ; loadint
  %r220 = add i32 0, 108 ; loadint
  %r219 = add i32 %r136, %r220
  store i32 %r218, ptr %r219
  %r221 = add i32 0, 0 ; loadint
  %r223 = add i32 0, 112 ; loadint
  %r222 = add i32 %r136, %r223
  store i32 %r221, ptr %r222
  %r224 = add i32 0, 0 ; loadint
  %r226 = add i32 0, 116 ; loadint
  %r225 = add i32 %r136, %r226
  store i32 %r224, ptr %r225
  %r227 = add i32 0, 0 ; loadint
  %r229 = add i32 0, 120 ; loadint
  %r228 = add i32 %r136, %r229
  store i32 %r227, ptr %r228
  %r230 = add i32 0, 0 ; loadint
  %r232 = add i32 0, 124 ; loadint
  %r231 = add i32 %r136, %r232
  store i32 %r230, ptr %r231
  %r233 = add i32 0, 0 ; loadint
  %r235 = add i32 0, 128 ; loadint
  %r234 = add i32 %r136, %r235
  store i32 %r233, ptr %r234
  %r236 = add i32 0, 0 ; loadint
  %r238 = add i32 0, 132 ; loadint
  %r237 = add i32 %r136, %r238
  store i32 %r236, ptr %r237
  %r239 = add i32 0, 0 ; loadint
  %r241 = add i32 0, 136 ; loadint
  %r240 = add i32 %r136, %r241
  store i32 %r239, ptr %r240
  %r242 = add i32 0, 0 ; loadint
  %r244 = add i32 0, 140 ; loadint
  %r243 = add i32 %r136, %r244
  store i32 %r242, ptr %r243
  %r245 = add i32 0, 0 ; loadint
  %r247 = add i32 0, 144 ; loadint
  %r246 = add i32 %r136, %r247
  store i32 %r245, ptr %r246
  %r248 = add i32 0, 0 ; loadint
  %r250 = add i32 0, 148 ; loadint
  %r249 = add i32 %r136, %r250
  store i32 %r248, ptr %r249
  %r251 = add i32 0, 0 ; loadint
  %r253 = add i32 0, 152 ; loadint
  %r252 = add i32 %r136, %r253
  store i32 %r251, ptr %r252
  %r254 = add i32 0, 0 ; loadint
  %r256 = add i32 0, 156 ; loadint
  %r255 = add i32 %r136, %r256
  store i32 %r254, ptr %r255
  %r257 = add i32 0, 0 ; loadint
  store i32 %r257, ptr %r1
  br label %B1

B1:
  %r258 = load i32, ptr %r1
  %r259 = load i32, ptr %r128
  %r260 = icmp slt i32 %r258, %r259
  br i1 %r260, label %B2, label %B3

B2:
  %r261 = add i32 0, 4 ; loadint
  %r262 = load i32, ptr %r1
  %r263 = mul i32 %r262, %r261
  %r264 = add i32 %r6, %r263
  %r265 = load i32, ptr %r264
  %r266 = add i32 0, 4 ; loadint
  %r267 = load i32, ptr %r1
  %r268 = mul i32 %r267, %r266
  %r269 = add i32 %r134, %r268
  store i32 %r265, ptr %r269
  %r270 = load i32, ptr %r1
  %r271 = add i32 0, 1 ; loadint
  %r272 = add i32 %r270, %r271
  store i32 %r272, ptr %r1
  br label %B1

B3:
  %r273 = add i32 0, 0 ; loadint
  store i32 %r273, ptr %r1
  br label %B4

B4:
  %r274 = load i32, ptr %r1
  %r275 = load i32, ptr %r131
  %r276 = icmp slt i32 %r274, %r275
  br i1 %r276, label %B5, label %B6

B5:
  %r277 = add i32 0, 4 ; loadint
  %r278 = load i32, ptr %r1
  %r279 = mul i32 %r278, %r277
  %r280 = add i32 %r67, %r279
  %r281 = load i32, ptr %r280
  %r282 = add i32 0, 4 ; loadint
  %r283 = load i32, ptr %r1
  %r284 = mul i32 %r283, %r282
  %r285 = add i32 %r135, %r284
  store i32 %r281, ptr %r285
  %r286 = load i32, ptr %r1
  %r287 = add i32 0, 1 ; loadint
  %r288 = add i32 %r286, %r287
  store i32 %r288, ptr %r1
  br label %B4

B6:
  %r289 = load i32, ptr %r128
  %r290 = load i32, ptr %r131
  %r291 = add i32 %r289, %r290
  %r292 = add i32 0, 1 ; loadint
  %r293 = sub i32 %r291, %r292
  store i32 %r293, ptr %r4
  %r294 = add i32 0, 0 ; loadint
  store i32 %r294, ptr %r1
  br label %B7

B7:
  %r295 = load i32, ptr %r1
  %r296 = load i32, ptr %r4
  %r297 = icmp sle i32 %r295, %r296
  br i1 %r297, label %B8, label %B9

B8:
  %r298 = add i32 0, 0 ; loadint
  %r299 = add i32 0, 4 ; loadint
  %r300 = load i32, ptr %r1
  %r301 = mul i32 %r300, %r299
  %r302 = add i32 %r136, %r301
  store i32 %r298, ptr %r302
  %r303 = load i32, ptr %r1
  %r304 = add i32 0, 1 ; loadint
  %r305 = add i32 %r303, %r304
  store i32 %r305, ptr %r1
  br label %B7

B9:
  %r306 = add i32 0, 0 ; loadint
  store i32 %r306, ptr %r5
  %r307 = load i32, ptr %r131
  %r308 = add i32 0, 1 ; loadint
  %r309 = sub i32 %r307, %r308
  store i32 %r309, ptr %r1
  br label %B10

B10:
  %r310 = load i32, ptr %r1
  %r311 = add i32 0, 1 ; loadint
  %r313 = add i32 0, 0 ; loadint
  %r312 = sub i32 %r313, %r311
  %r314 = icmp sgt i32 %r310, %r312
  br i1 %r314, label %B11, label %B12

B11:
  %r315 = add i32 0, 4 ; loadint
  %r316 = load i32, ptr %r1
  %r317 = mul i32 %r316, %r315
  %r318 = add i32 %r135, %r317
  %r319 = load i32, ptr %r318
  store i32 %r319, ptr %r3
  %r320 = load i32, ptr %r128
  %r321 = add i32 0, 1 ; loadint
  %r322 = sub i32 %r320, %r321
  store i32 %r322, ptr %r2
  br label %B13

B12:
  br label %B20

B13:
  %r323 = load i32, ptr %r2
  %r324 = add i32 0, 1 ; loadint
  %r326 = add i32 0, 0 ; loadint
  %r325 = sub i32 %r326, %r324
  %r327 = icmp sgt i32 %r323, %r325
  br i1 %r327, label %B14, label %B15

B14:
  %r328 = add i32 0, 4 ; loadint
  %r329 = load i32, ptr %r4
  %r330 = mul i32 %r329, %r328
  %r331 = add i32 %r136, %r330
  %r332 = load i32, ptr %r331
  %r333 = load i32, ptr %r3
  %r334 = add i32 0, 4 ; loadint
  %r335 = load i32, ptr %r2
  %r336 = mul i32 %r335, %r334
  %r337 = add i32 %r134, %r336
  %r338 = load i32, ptr %r337
  %r339 = mul i32 %r333, %r338
  %r340 = add i32 %r332, %r339
  store i32 %r340, ptr %r5
  br label %B16

B15:
  %r377 = load i32, ptr %r4
  %r378 = load i32, ptr %r128
  %r379 = add i32 %r377, %r378
  %r380 = add i32 0, 1 ; loadint
  %r381 = sub i32 %r379, %r380
  store i32 %r381, ptr %r4
  %r382 = load i32, ptr %r1
  %r383 = add i32 0, 1 ; loadint
  %r384 = sub i32 %r382, %r383
  store i32 %r384, ptr %r1
  br label %B10

B16:
  %r341 = load i32, ptr %r5
  %r342 = add i32 0, 10 ; loadint
  %r343 = icmp sge i32 %r341, %r342
  br i1 %r343, label %B17, label %B18

B17:
  %r344 = load i32, ptr %r5
  %r345 = add i32 0, 4 ; loadint
  %r346 = load i32, ptr %r4
  %r347 = mul i32 %r346, %r345
  %r348 = add i32 %r136, %r347
  store i32 %r344, ptr %r348
  %r349 = add i32 0, 4 ; loadint
  %r350 = load i32, ptr %r4
  %r351 = add i32 0, 1 ; loadint
  %r352 = sub i32 %r350, %r351
  %r353 = mul i32 %r352, %r349
  %r354 = add i32 %r136, %r353
  %r355 = load i32, ptr %r354
  %r356 = load i32, ptr %r5
  %r357 = add i32 0, 10 ; loadint
  %r358 = sdiv i32 %r356, %r357
  %r359 = add i32 %r355, %r358
  %r360 = add i32 0, 4 ; loadint
  %r361 = load i32, ptr %r4
  %r362 = add i32 0, 1 ; loadint
  %r363 = sub i32 %r361, %r362
  %r364 = mul i32 %r363, %r360
  %r365 = add i32 %r136, %r364
  store i32 %r359, ptr %r365
  br label %B19

B18:
  %r366 = load i32, ptr %r5
  %r367 = add i32 0, 4 ; loadint
  %r368 = load i32, ptr %r4
  %r369 = mul i32 %r368, %r367
  %r370 = add i32 %r136, %r369
  store i32 %r366, ptr %r370
  br label %B19

B19:
  %r371 = load i32, ptr %r2
  %r372 = add i32 0, 1 ; loadint
  %r373 = sub i32 %r371, %r372
  store i32 %r373, ptr %r2
  %r374 = load i32, ptr %r4
  %r375 = add i32 0, 1 ; loadint
  %r376 = sub i32 %r374, %r375
  store i32 %r376, ptr %r4
  br label %B13

B20:
  %r385 = add i32 0, 4 ; loadint
  %r386 = add i32 0, 0 ; loadint
  %r387 = mul i32 %r386, %r385
  %r388 = add i32 %r136, %r387
  %r389 = load i32, ptr %r388
  %r390 = add i32 0, 0 ; loadint
  %r391 = icmp ne i32 %r389, %r390
  br i1 %r391, label %B21, label %B22

B21:
  %r393 = add i32 0, 4 ; loadint
  %r394 = add i32 0, 0 ; loadint
  %r395 = mul i32 %r394, %r393
  %r396 = add i32 %r136, %r395
  %r397 = load i32, ptr %r396
  %r392 = call i32 @putint(i32 %r397)
  br label %B22

B22:
  %r398 = add i32 0, 1 ; loadint
  store i32 %r398, ptr %r1
  br label %B23

B23:
  %r399 = load i32, ptr %r1
  %r400 = load i32, ptr %r128
  %r401 = load i32, ptr %r131
  %r402 = add i32 %r400, %r401
  %r403 = add i32 0, 1 ; loadint
  %r404 = sub i32 %r402, %r403
  %r405 = icmp sle i32 %r399, %r404
  br i1 %r405, label %B24, label %B25

B24:
  %r407 = add i32 0, 4 ; loadint
  %r408 = load i32, ptr %r1
  %r409 = mul i32 %r408, %r407
  %r410 = add i32 %r136, %r409
  %r411 = load i32, ptr %r410
  %r406 = call i32 @putint(i32 %r411)
  %r412 = load i32, ptr %r1
  %r413 = add i32 0, 1 ; loadint
  %r414 = add i32 %r412, %r413
  store i32 %r414, ptr %r1
  br label %B23

B25:
  %r415 = add i32 0, 0 ; loadint
  ret i32 %r415

}
