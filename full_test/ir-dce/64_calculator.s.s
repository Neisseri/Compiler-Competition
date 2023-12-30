; module
@ints#0 = global int [10000], 40000
@intt#0 = global int, 4
@chas#0 = global int [10000], 40000
@chat#0 = global int, 4
@i#0 = global int 0, 4
@ii#0 = global int 1, 4
@c#0 = global int, 4
@get#0 = global int [10000], 40000
@get2#0 = global int [10000], 40000
define i32 @find(){
B32:
  %r1 = call i32 @chapop()
  %r2 = loadaddr @c#0
  store i32 %r1, ptr %r2
  %r3 = add i32 0, 32 ; loadint
  %r4 = loadaddr @get2#0
  %r5 = loadaddr @get2#0
  %r6 = add i32 0, 4 ; loadint
  %r7 = loadaddr @ii#0
  %r8 = load i32, ptr %r7
  %r9 = mul i32 %r8, %r6
  %r10 = add i32 %r5, %r9
  store i32 %r3, ptr %r10
  %r11 = loadaddr @c#0
  %r12 = load i32, ptr %r11
  %r13 = loadaddr @get2#0
  %r14 = loadaddr @get2#0
  %r15 = add i32 0, 4 ; loadint
  %r16 = loadaddr @ii#0
  %r17 = load i32, ptr %r16
  %r18 = add i32 0, 1 ; loadint
  %r19 = add i32 %r17, %r18
  %r20 = mul i32 %r19, %r15
  %r21 = add i32 %r14, %r20
  store i32 %r12, ptr %r21
  %r22 = loadaddr @ii#0
  %r23 = load i32, ptr %r22
  %r24 = add i32 0, 2 ; loadint
  %r25 = add i32 %r23, %r24
  %r26 = loadaddr @ii#0
  store i32 %r25, ptr %r26
  br label %B33

B33:
  %r27 = loadaddr @chat#0
  %r28 = load i32, ptr %r27
  %r29 = add i32 0, 0 ; loadint
  %r30 = icmp eq i32 %r28, %r29
  br i1 %r30, label %B34, label %B35

B34:
  %r31 = add i32 0, 0 ; loadint
  ret i32 %r31

B35:
  %r32 = add i32 0, 1 ; loadint
  ret i32 %r32

}
define i32 @chapop(){
B28:
  %r1 = loadaddr @chat#0
  %r2 = load i32, ptr %r1
  %r3 = add i32 0, 1 ; loadint
  %r4 = sub i32 %r2, %r3
  %r5 = loadaddr @chat#0
  store i32 %r4, ptr %r5
  %r6 = loadaddr @chas#0
  %r7 = add i32 0, 4 ; loadint
  %r8 = loadaddr @chat#0
  %r9 = load i32, ptr %r8
  %r10 = add i32 0, 1 ; loadint
  %r11 = add i32 %r9, %r10
  %r12 = mul i32 %r11, %r7
  %r13 = add i32 %r6, %r12
  %r14 = load i32, ptr %r13
  ret i32 %r14

}
define i32 @intpop(){
B26:
  %r1 = loadaddr @intt#0
  %r2 = load i32, ptr %r1
  %r3 = add i32 0, 1 ; loadint
  %r4 = sub i32 %r2, %r3
  %r5 = loadaddr @intt#0
  store i32 %r4, ptr %r5
  %r6 = loadaddr @ints#0
  %r7 = add i32 0, 4 ; loadint
  %r8 = loadaddr @intt#0
  %r9 = load i32, ptr %r8
  %r10 = add i32 0, 1 ; loadint
  %r11 = add i32 %r9, %r10
  %r12 = mul i32 %r11, %r7
  %r13 = add i32 %r6, %r12
  %r14 = load i32, ptr %r13
  ret i32 %r14

}
define void @chapush(i32){
B24:
  %r2 = alloca int, 4
  store i32 %r1, ptr %r2
  %r3 = loadaddr @chat#0
  %r4 = load i32, ptr %r3
  %r5 = add i32 0, 1 ; loadint
  %r6 = add i32 %r4, %r5
  %r7 = loadaddr @chat#0
  store i32 %r6, ptr %r7
  %r8 = load i32, ptr %r2
  %r9 = loadaddr @chas#0
  %r10 = loadaddr @chas#0
  %r11 = add i32 0, 4 ; loadint
  %r12 = loadaddr @chat#0
  %r13 = load i32, ptr %r12
  %r14 = mul i32 %r13, %r11
  %r15 = add i32 %r10, %r14
  store i32 %r8, ptr %r15
  %r16 = add i32 0, 0 ; loadint
  ret i32 %r16

}
define i32 @main(){
B38:
  %r1 = add i32 0, 0 ; loadint
  %r2 = loadaddr @intt#0
  store i32 %r1, ptr %r2
  %r3 = add i32 0, 0 ; loadint
  %r4 = loadaddr @chat#0
  store i32 %r3, ptr %r4
  %r5 = alloca int, 4
  %r7 = loadaddr @get#0
  %r6 = call i32 @getstr(i32 %r7)
  store i32 %r6, ptr %r5
  br label %B39

B39:
  %r8 = loadaddr @i#0
  %r9 = load i32, ptr %r8
  %r10 = load i32, ptr %r5
  %r11 = icmp slt i32 %r9, %r10
  br i1 %r11, label %B40, label %B41

B40:
  br label %B42

B41:
  br label %B165

B42:
  %r13 = loadaddr @get#0
  %r14 = add i32 0, 4 ; loadint
  %r15 = loadaddr @i#0
  %r16 = load i32, ptr %r15
  %r17 = mul i32 %r16, %r14
  %r18 = add i32 %r13, %r17
  %r19 = load i32, ptr %r18
  %r12 = call i32 @isdigit(i32 %r19)
  %r20 = add i32 0, 1 ; loadint
  %r21 = icmp eq i32 %r12, %r20
  br i1 %r21, label %B43, label %B44

B43:
  %r22 = loadaddr @get#0
  %r23 = add i32 0, 4 ; loadint
  %r24 = loadaddr @i#0
  %r25 = load i32, ptr %r24
  %r26 = mul i32 %r25, %r23
  %r27 = add i32 %r22, %r26
  %r28 = load i32, ptr %r27
  %r29 = loadaddr @get2#0
  %r30 = loadaddr @get2#0
  %r31 = add i32 0, 4 ; loadint
  %r32 = loadaddr @ii#0
  %r33 = load i32, ptr %r32
  %r34 = mul i32 %r33, %r31
  %r35 = add i32 %r30, %r34
  store i32 %r28, ptr %r35
  %r36 = loadaddr @ii#0
  %r37 = load i32, ptr %r36
  %r38 = add i32 0, 1 ; loadint
  %r39 = add i32 %r37, %r38
  %r40 = loadaddr @ii#0
  store i32 %r39, ptr %r40
  br label %B45

B44:
  br label %B46

B45:
  %r460 = loadaddr @i#0
  %r461 = load i32, ptr %r460
  %r462 = add i32 0, 1 ; loadint
  %r463 = add i32 %r461, %r462
  %r464 = loadaddr @i#0
  store i32 %r463, ptr %r464
  br label %B39

B46:
  %r41 = loadaddr @get#0
  %r42 = add i32 0, 4 ; loadint
  %r43 = loadaddr @i#0
  %r44 = load i32, ptr %r43
  %r45 = mul i32 %r44, %r42
  %r46 = add i32 %r41, %r45
  %r47 = load i32, ptr %r46
  %r48 = add i32 0, 40 ; loadint
  %r49 = icmp eq i32 %r47, %r48
  br i1 %r49, label %B47, label %B48

B47:
  %r51 = add i32 0, 40 ; loadint
  %r50 = call@chapush(i32 %r51)
  br label %B48

B48:
  br label %B49

B49:
  %r52 = loadaddr @get#0
  %r53 = add i32 0, 4 ; loadint
  %r54 = loadaddr @i#0
  %r55 = load i32, ptr %r54
  %r56 = mul i32 %r55, %r53
  %r57 = add i32 %r52, %r56
  %r58 = load i32, ptr %r57
  %r59 = add i32 0, 94 ; loadint
  %r60 = icmp eq i32 %r58, %r59
  br i1 %r60, label %B50, label %B51

B50:
  %r62 = add i32 0, 94 ; loadint
  %r61 = call@chapush(i32 %r62)
  br label %B51

B51:
  br label %B52

B52:
  %r63 = loadaddr @get#0
  %r64 = add i32 0, 4 ; loadint
  %r65 = loadaddr @i#0
  %r66 = load i32, ptr %r65
  %r67 = mul i32 %r66, %r64
  %r68 = add i32 %r63, %r67
  %r69 = load i32, ptr %r68
  %r70 = add i32 0, 41 ; loadint
  %r71 = icmp eq i32 %r69, %r70
  br i1 %r71, label %B53, label %B54

B53:
  %r72 = call i32 @chapop()
  %r73 = loadaddr @c#0
  store i32 %r72, ptr %r73
  br label %B55

B54:
  br label %B58

B55:
  %r74 = loadaddr @c#0
  %r75 = load i32, ptr %r74
  %r76 = add i32 0, 40 ; loadint
  %r77 = icmp ne i32 %r75, %r76
  br i1 %r77, label %B56, label %B57

B56:
  %r78 = add i32 0, 32 ; loadint
  %r79 = loadaddr @get2#0
  %r80 = loadaddr @get2#0
  %r81 = add i32 0, 4 ; loadint
  %r82 = loadaddr @ii#0
  %r83 = load i32, ptr %r82
  %r84 = mul i32 %r83, %r81
  %r85 = add i32 %r80, %r84
  store i32 %r78, ptr %r85
  %r86 = loadaddr @c#0
  %r87 = load i32, ptr %r86
  %r88 = loadaddr @get2#0
  %r89 = loadaddr @get2#0
  %r90 = add i32 0, 4 ; loadint
  %r91 = loadaddr @ii#0
  %r92 = load i32, ptr %r91
  %r93 = add i32 0, 1 ; loadint
  %r94 = add i32 %r92, %r93
  %r95 = mul i32 %r94, %r90
  %r96 = add i32 %r89, %r95
  store i32 %r87, ptr %r96
  %r97 = loadaddr @ii#0
  %r98 = load i32, ptr %r97
  %r99 = add i32 0, 2 ; loadint
  %r100 = add i32 %r98, %r99
  %r101 = loadaddr @ii#0
  store i32 %r100, ptr %r101
  %r102 = call i32 @chapop()
  %r103 = loadaddr @c#0
  store i32 %r102, ptr %r103
  br label %B55

B57:
  br label %B54

B58:
  %r104 = loadaddr @get#0
  %r105 = add i32 0, 4 ; loadint
  %r106 = loadaddr @i#0
  %r107 = load i32, ptr %r106
  %r108 = mul i32 %r107, %r105
  %r109 = add i32 %r104, %r108
  %r110 = load i32, ptr %r109
  %r111 = add i32 0, 43 ; loadint
  %r112 = icmp eq i32 %r110, %r111
  br i1 %r112, label %B59, label %B60

B59:
  br label %B61

B60:
  br label %B83

B61:
  %r113 = alloca int, 4
  %r114 = alloca int, 4
  %r115 = alloca int, 4
  %r116 = alloca int, 4
  %r117 = alloca int, 4
  %r118 = loadaddr @chas#0
  %r119 = add i32 0, 4 ; loadint
  %r120 = loadaddr @chat#0
  %r121 = load i32, ptr %r120
  %r122 = mul i32 %r121, %r119
  %r123 = add i32 %r118, %r122
  %r124 = load i32, ptr %r123
  %r125 = add i32 0, 43 ; loadint
  %r126 = icmp eq i32 %r124, %r125
  br i1 %r126, label %B64, label %B65

B62:
  br label %B79

B63:
  %r186 = add i32 0, 43 ; loadint
  %r185 = call@chapush(i32 %r186)
  br label %B60

B64:
  %r136 = add i32 0, 1 ; loadint
  store i32 %r136, ptr %r117
  br label %B66

B65:
  %r127 = loadaddr @chas#0
  %r128 = add i32 0, 4 ; loadint
  %r129 = loadaddr @chat#0
  %r130 = load i32, ptr %r129
  %r131 = mul i32 %r130, %r128
  %r132 = add i32 %r127, %r131
  %r133 = load i32, ptr %r132
  %r134 = add i32 0, 45 ; loadint
  %r135 = icmp eq i32 %r133, %r134
  store i32 %r135, ptr %r117
  br label %B66

B66:
  %r137 = load i32, ptr %r117
  br i1 %r137, label %B67, label %B68

B67:
  %r147 = add i32 0, 1 ; loadint
  store i32 %r147, ptr %r116
  br label %B69

B68:
  %r138 = loadaddr @chas#0
  %r139 = add i32 0, 4 ; loadint
  %r140 = loadaddr @chat#0
  %r141 = load i32, ptr %r140
  %r142 = mul i32 %r141, %r139
  %r143 = add i32 %r138, %r142
  %r144 = load i32, ptr %r143
  %r145 = add i32 0, 42 ; loadint
  %r146 = icmp eq i32 %r144, %r145
  store i32 %r146, ptr %r116
  br label %B69

B69:
  %r148 = load i32, ptr %r116
  br i1 %r148, label %B70, label %B71

B70:
  %r158 = add i32 0, 1 ; loadint
  store i32 %r158, ptr %r115
  br label %B72

B71:
  %r149 = loadaddr @chas#0
  %r150 = add i32 0, 4 ; loadint
  %r151 = loadaddr @chat#0
  %r152 = load i32, ptr %r151
  %r153 = mul i32 %r152, %r150
  %r154 = add i32 %r149, %r153
  %r155 = load i32, ptr %r154
  %r156 = add i32 0, 47 ; loadint
  %r157 = icmp eq i32 %r155, %r156
  store i32 %r157, ptr %r115
  br label %B72

B72:
  %r159 = load i32, ptr %r115
  br i1 %r159, label %B73, label %B74

B73:
  %r169 = add i32 0, 1 ; loadint
  store i32 %r169, ptr %r114
  br label %B75

B74:
  %r160 = loadaddr @chas#0
  %r161 = add i32 0, 4 ; loadint
  %r162 = loadaddr @chat#0
  %r163 = load i32, ptr %r162
  %r164 = mul i32 %r163, %r161
  %r165 = add i32 %r160, %r164
  %r166 = load i32, ptr %r165
  %r167 = add i32 0, 37 ; loadint
  %r168 = icmp eq i32 %r166, %r167
  store i32 %r168, ptr %r114
  br label %B75

B75:
  %r170 = load i32, ptr %r114
  br i1 %r170, label %B76, label %B77

B76:
  %r180 = add i32 0, 1 ; loadint
  store i32 %r180, ptr %r113
  br label %B78

B77:
  %r171 = loadaddr @chas#0
  %r172 = add i32 0, 4 ; loadint
  %r173 = loadaddr @chat#0
  %r174 = load i32, ptr %r173
  %r175 = mul i32 %r174, %r172
  %r176 = add i32 %r171, %r175
  %r177 = load i32, ptr %r176
  %r178 = add i32 0, 94 ; loadint
  %r179 = icmp eq i32 %r177, %r178
  store i32 %r179, ptr %r113
  br label %B78

B78:
  %r181 = load i32, ptr %r113
  br i1 %r181, label %B62, label %B63

B79:
  %r182 = call i32 @find()
  %r183 = add i32 0, 0 ; loadint
  %r184 = icmp eq i32 %r182, %r183
  br i1 %r184, label %B80, label %B81

B80:
  br label %B63

B81:
  br label %B61

B83:
  %r187 = loadaddr @get#0
  %r188 = add i32 0, 4 ; loadint
  %r189 = loadaddr @i#0
  %r190 = load i32, ptr %r189
  %r191 = mul i32 %r190, %r188
  %r192 = add i32 %r187, %r191
  %r193 = load i32, ptr %r192
  %r194 = add i32 0, 45 ; loadint
  %r195 = icmp eq i32 %r193, %r194
  br i1 %r195, label %B84, label %B85

B84:
  br label %B86

B85:
  br label %B108

B86:
  %r196 = alloca int, 4
  %r197 = alloca int, 4
  %r198 = alloca int, 4
  %r199 = alloca int, 4
  %r200 = alloca int, 4
  %r201 = loadaddr @chas#0
  %r202 = add i32 0, 4 ; loadint
  %r203 = loadaddr @chat#0
  %r204 = load i32, ptr %r203
  %r205 = mul i32 %r204, %r202
  %r206 = add i32 %r201, %r205
  %r207 = load i32, ptr %r206
  %r208 = add i32 0, 43 ; loadint
  %r209 = icmp eq i32 %r207, %r208
  br i1 %r209, label %B89, label %B90

B87:
  br label %B104

B88:
  %r269 = add i32 0, 45 ; loadint
  %r268 = call@chapush(i32 %r269)
  br label %B85

B89:
  %r219 = add i32 0, 1 ; loadint
  store i32 %r219, ptr %r200
  br label %B91

B90:
  %r210 = loadaddr @chas#0
  %r211 = add i32 0, 4 ; loadint
  %r212 = loadaddr @chat#0
  %r213 = load i32, ptr %r212
  %r214 = mul i32 %r213, %r211
  %r215 = add i32 %r210, %r214
  %r216 = load i32, ptr %r215
  %r217 = add i32 0, 45 ; loadint
  %r218 = icmp eq i32 %r216, %r217
  store i32 %r218, ptr %r200
  br label %B91

B91:
  %r220 = load i32, ptr %r200
  br i1 %r220, label %B92, label %B93

B92:
  %r230 = add i32 0, 1 ; loadint
  store i32 %r230, ptr %r199
  br label %B94

B93:
  %r221 = loadaddr @chas#0
  %r222 = add i32 0, 4 ; loadint
  %r223 = loadaddr @chat#0
  %r224 = load i32, ptr %r223
  %r225 = mul i32 %r224, %r222
  %r226 = add i32 %r221, %r225
  %r227 = load i32, ptr %r226
  %r228 = add i32 0, 42 ; loadint
  %r229 = icmp eq i32 %r227, %r228
  store i32 %r229, ptr %r199
  br label %B94

B94:
  %r231 = load i32, ptr %r199
  br i1 %r231, label %B95, label %B96

B95:
  %r241 = add i32 0, 1 ; loadint
  store i32 %r241, ptr %r198
  br label %B97

B96:
  %r232 = loadaddr @chas#0
  %r233 = add i32 0, 4 ; loadint
  %r234 = loadaddr @chat#0
  %r235 = load i32, ptr %r234
  %r236 = mul i32 %r235, %r233
  %r237 = add i32 %r232, %r236
  %r238 = load i32, ptr %r237
  %r239 = add i32 0, 47 ; loadint
  %r240 = icmp eq i32 %r238, %r239
  store i32 %r240, ptr %r198
  br label %B97

B97:
  %r242 = load i32, ptr %r198
  br i1 %r242, label %B98, label %B99

B98:
  %r252 = add i32 0, 1 ; loadint
  store i32 %r252, ptr %r197
  br label %B100

B99:
  %r243 = loadaddr @chas#0
  %r244 = add i32 0, 4 ; loadint
  %r245 = loadaddr @chat#0
  %r246 = load i32, ptr %r245
  %r247 = mul i32 %r246, %r244
  %r248 = add i32 %r243, %r247
  %r249 = load i32, ptr %r248
  %r250 = add i32 0, 37 ; loadint
  %r251 = icmp eq i32 %r249, %r250
  store i32 %r251, ptr %r197
  br label %B100

B100:
  %r253 = load i32, ptr %r197
  br i1 %r253, label %B101, label %B102

B101:
  %r263 = add i32 0, 1 ; loadint
  store i32 %r263, ptr %r196
  br label %B103

B102:
  %r254 = loadaddr @chas#0
  %r255 = add i32 0, 4 ; loadint
  %r256 = loadaddr @chat#0
  %r257 = load i32, ptr %r256
  %r258 = mul i32 %r257, %r255
  %r259 = add i32 %r254, %r258
  %r260 = load i32, ptr %r259
  %r261 = add i32 0, 94 ; loadint
  %r262 = icmp eq i32 %r260, %r261
  store i32 %r262, ptr %r196
  br label %B103

B103:
  %r264 = load i32, ptr %r196
  br i1 %r264, label %B87, label %B88

B104:
  %r265 = call i32 @find()
  %r266 = add i32 0, 0 ; loadint
  %r267 = icmp eq i32 %r265, %r266
  br i1 %r267, label %B105, label %B106

B105:
  br label %B88

B106:
  br label %B86

B108:
  %r270 = loadaddr @get#0
  %r271 = add i32 0, 4 ; loadint
  %r272 = loadaddr @i#0
  %r273 = load i32, ptr %r272
  %r274 = mul i32 %r273, %r271
  %r275 = add i32 %r270, %r274
  %r276 = load i32, ptr %r275
  %r277 = add i32 0, 42 ; loadint
  %r278 = icmp eq i32 %r276, %r277
  br i1 %r278, label %B109, label %B110

B109:
  br label %B111

B110:
  br label %B127

B111:
  %r279 = alloca int, 4
  %r280 = alloca int, 4
  %r281 = alloca int, 4
  %r282 = loadaddr @chas#0
  %r283 = add i32 0, 4 ; loadint
  %r284 = loadaddr @chat#0
  %r285 = load i32, ptr %r284
  %r286 = mul i32 %r285, %r283
  %r287 = add i32 %r282, %r286
  %r288 = load i32, ptr %r287
  %r289 = add i32 0, 42 ; loadint
  %r290 = icmp eq i32 %r288, %r289
  br i1 %r290, label %B114, label %B115

B112:
  br label %B123

B113:
  %r328 = add i32 0, 42 ; loadint
  %r327 = call@chapush(i32 %r328)
  br label %B110

B114:
  %r300 = add i32 0, 1 ; loadint
  store i32 %r300, ptr %r281
  br label %B116

B115:
  %r291 = loadaddr @chas#0
  %r292 = add i32 0, 4 ; loadint
  %r293 = loadaddr @chat#0
  %r294 = load i32, ptr %r293
  %r295 = mul i32 %r294, %r292
  %r296 = add i32 %r291, %r295
  %r297 = load i32, ptr %r296
  %r298 = add i32 0, 47 ; loadint
  %r299 = icmp eq i32 %r297, %r298
  store i32 %r299, ptr %r281
  br label %B116

B116:
  %r301 = load i32, ptr %r281
  br i1 %r301, label %B117, label %B118

B117:
  %r311 = add i32 0, 1 ; loadint
  store i32 %r311, ptr %r280
  br label %B119

B118:
  %r302 = loadaddr @chas#0
  %r303 = add i32 0, 4 ; loadint
  %r304 = loadaddr @chat#0
  %r305 = load i32, ptr %r304
  %r306 = mul i32 %r305, %r303
  %r307 = add i32 %r302, %r306
  %r308 = load i32, ptr %r307
  %r309 = add i32 0, 37 ; loadint
  %r310 = icmp eq i32 %r308, %r309
  store i32 %r310, ptr %r280
  br label %B119

B119:
  %r312 = load i32, ptr %r280
  br i1 %r312, label %B120, label %B121

B120:
  %r322 = add i32 0, 1 ; loadint
  store i32 %r322, ptr %r279
  br label %B122

B121:
  %r313 = loadaddr @chas#0
  %r314 = add i32 0, 4 ; loadint
  %r315 = loadaddr @chat#0
  %r316 = load i32, ptr %r315
  %r317 = mul i32 %r316, %r314
  %r318 = add i32 %r313, %r317
  %r319 = load i32, ptr %r318
  %r320 = add i32 0, 94 ; loadint
  %r321 = icmp eq i32 %r319, %r320
  store i32 %r321, ptr %r279
  br label %B122

B122:
  %r323 = load i32, ptr %r279
  br i1 %r323, label %B112, label %B113

B123:
  %r324 = call i32 @find()
  %r325 = add i32 0, 0 ; loadint
  %r326 = icmp eq i32 %r324, %r325
  br i1 %r326, label %B124, label %B125

B124:
  br label %B113

B125:
  br label %B111

B127:
  %r329 = loadaddr @get#0
  %r330 = add i32 0, 4 ; loadint
  %r331 = loadaddr @i#0
  %r332 = load i32, ptr %r331
  %r333 = mul i32 %r332, %r330
  %r334 = add i32 %r329, %r333
  %r335 = load i32, ptr %r334
  %r336 = add i32 0, 47 ; loadint
  %r337 = icmp eq i32 %r335, %r336
  br i1 %r337, label %B128, label %B129

B128:
  br label %B130

B129:
  br label %B146

B130:
  %r338 = alloca int, 4
  %r339 = alloca int, 4
  %r340 = alloca int, 4
  %r341 = loadaddr @chas#0
  %r342 = add i32 0, 4 ; loadint
  %r343 = loadaddr @chat#0
  %r344 = load i32, ptr %r343
  %r345 = mul i32 %r344, %r342
  %r346 = add i32 %r341, %r345
  %r347 = load i32, ptr %r346
  %r348 = add i32 0, 42 ; loadint
  %r349 = icmp eq i32 %r347, %r348
  br i1 %r349, label %B133, label %B134

B131:
  br label %B142

B132:
  %r387 = add i32 0, 47 ; loadint
  %r386 = call@chapush(i32 %r387)
  br label %B129

B133:
  %r359 = add i32 0, 1 ; loadint
  store i32 %r359, ptr %r340
  br label %B135

B134:
  %r350 = loadaddr @chas#0
  %r351 = add i32 0, 4 ; loadint
  %r352 = loadaddr @chat#0
  %r353 = load i32, ptr %r352
  %r354 = mul i32 %r353, %r351
  %r355 = add i32 %r350, %r354
  %r356 = load i32, ptr %r355
  %r357 = add i32 0, 47 ; loadint
  %r358 = icmp eq i32 %r356, %r357
  store i32 %r358, ptr %r340
  br label %B135

B135:
  %r360 = load i32, ptr %r340
  br i1 %r360, label %B136, label %B137

B136:
  %r370 = add i32 0, 1 ; loadint
  store i32 %r370, ptr %r339
  br label %B138

B137:
  %r361 = loadaddr @chas#0
  %r362 = add i32 0, 4 ; loadint
  %r363 = loadaddr @chat#0
  %r364 = load i32, ptr %r363
  %r365 = mul i32 %r364, %r362
  %r366 = add i32 %r361, %r365
  %r367 = load i32, ptr %r366
  %r368 = add i32 0, 37 ; loadint
  %r369 = icmp eq i32 %r367, %r368
  store i32 %r369, ptr %r339
  br label %B138

B138:
  %r371 = load i32, ptr %r339
  br i1 %r371, label %B139, label %B140

B139:
  %r381 = add i32 0, 1 ; loadint
  store i32 %r381, ptr %r338
  br label %B141

B140:
  %r372 = loadaddr @chas#0
  %r373 = add i32 0, 4 ; loadint
  %r374 = loadaddr @chat#0
  %r375 = load i32, ptr %r374
  %r376 = mul i32 %r375, %r373
  %r377 = add i32 %r372, %r376
  %r378 = load i32, ptr %r377
  %r379 = add i32 0, 94 ; loadint
  %r380 = icmp eq i32 %r378, %r379
  store i32 %r380, ptr %r338
  br label %B141

B141:
  %r382 = load i32, ptr %r338
  br i1 %r382, label %B131, label %B132

B142:
  %r383 = call i32 @find()
  %r384 = add i32 0, 0 ; loadint
  %r385 = icmp eq i32 %r383, %r384
  br i1 %r385, label %B143, label %B144

B143:
  br label %B132

B144:
  br label %B130

B146:
  %r388 = loadaddr @get#0
  %r389 = add i32 0, 4 ; loadint
  %r390 = loadaddr @i#0
  %r391 = load i32, ptr %r390
  %r392 = mul i32 %r391, %r389
  %r393 = add i32 %r388, %r392
  %r394 = load i32, ptr %r393
  %r395 = add i32 0, 37 ; loadint
  %r396 = icmp eq i32 %r394, %r395
  br i1 %r396, label %B147, label %B148

B147:
  br label %B149

B148:
  %r447 = add i32 0, 32 ; loadint
  %r448 = loadaddr @get2#0
  %r449 = loadaddr @get2#0
  %r450 = add i32 0, 4 ; loadint
  %r451 = loadaddr @ii#0
  %r452 = load i32, ptr %r451
  %r453 = mul i32 %r452, %r450
  %r454 = add i32 %r449, %r453
  store i32 %r447, ptr %r454
  %r455 = loadaddr @ii#0
  %r456 = load i32, ptr %r455
  %r457 = add i32 0, 1 ; loadint
  %r458 = add i32 %r456, %r457
  %r459 = loadaddr @ii#0
  store i32 %r458, ptr %r459
  br label %B45

B149:
  %r397 = alloca int, 4
  %r398 = alloca int, 4
  %r399 = alloca int, 4
  %r400 = loadaddr @chas#0
  %r401 = add i32 0, 4 ; loadint
  %r402 = loadaddr @chat#0
  %r403 = load i32, ptr %r402
  %r404 = mul i32 %r403, %r401
  %r405 = add i32 %r400, %r404
  %r406 = load i32, ptr %r405
  %r407 = add i32 0, 42 ; loadint
  %r408 = icmp eq i32 %r406, %r407
  br i1 %r408, label %B152, label %B153

B150:
  br label %B161

B151:
  %r446 = add i32 0, 37 ; loadint
  %r445 = call@chapush(i32 %r446)
  br label %B148

B152:
  %r418 = add i32 0, 1 ; loadint
  store i32 %r418, ptr %r399
  br label %B154

B153:
  %r409 = loadaddr @chas#0
  %r410 = add i32 0, 4 ; loadint
  %r411 = loadaddr @chat#0
  %r412 = load i32, ptr %r411
  %r413 = mul i32 %r412, %r410
  %r414 = add i32 %r409, %r413
  %r415 = load i32, ptr %r414
  %r416 = add i32 0, 47 ; loadint
  %r417 = icmp eq i32 %r415, %r416
  store i32 %r417, ptr %r399
  br label %B154

B154:
  %r419 = load i32, ptr %r399
  br i1 %r419, label %B155, label %B156

B155:
  %r429 = add i32 0, 1 ; loadint
  store i32 %r429, ptr %r398
  br label %B157

B156:
  %r420 = loadaddr @chas#0
  %r421 = add i32 0, 4 ; loadint
  %r422 = loadaddr @chat#0
  %r423 = load i32, ptr %r422
  %r424 = mul i32 %r423, %r421
  %r425 = add i32 %r420, %r424
  %r426 = load i32, ptr %r425
  %r427 = add i32 0, 37 ; loadint
  %r428 = icmp eq i32 %r426, %r427
  store i32 %r428, ptr %r398
  br label %B157

B157:
  %r430 = load i32, ptr %r398
  br i1 %r430, label %B158, label %B159

B158:
  %r440 = add i32 0, 1 ; loadint
  store i32 %r440, ptr %r397
  br label %B160

B159:
  %r431 = loadaddr @chas#0
  %r432 = add i32 0, 4 ; loadint
  %r433 = loadaddr @chat#0
  %r434 = load i32, ptr %r433
  %r435 = mul i32 %r434, %r432
  %r436 = add i32 %r431, %r435
  %r437 = load i32, ptr %r436
  %r438 = add i32 0, 94 ; loadint
  %r439 = icmp eq i32 %r437, %r438
  store i32 %r439, ptr %r397
  br label %B160

B160:
  %r441 = load i32, ptr %r397
  br i1 %r441, label %B150, label %B151

B161:
  %r442 = call i32 @find()
  %r443 = add i32 0, 0 ; loadint
  %r444 = icmp eq i32 %r442, %r443
  br i1 %r444, label %B162, label %B163

B162:
  br label %B151

B163:
  br label %B149

B165:
  %r465 = loadaddr @chat#0
  %r466 = load i32, ptr %r465
  %r467 = add i32 0, 0 ; loadint
  %r468 = icmp sgt i32 %r466, %r467
  br i1 %r468, label %B166, label %B167

B166:
  %r469 = alloca int, 4
  %r470 = call i32 @chapop()
  store i32 %r470, ptr %r469
  %r471 = add i32 0, 32 ; loadint
  %r472 = loadaddr @get2#0
  %r473 = loadaddr @get2#0
  %r474 = add i32 0, 4 ; loadint
  %r475 = loadaddr @ii#0
  %r476 = load i32, ptr %r475
  %r477 = mul i32 %r476, %r474
  %r478 = add i32 %r473, %r477
  store i32 %r471, ptr %r478
  %r479 = load i32, ptr %r469
  %r480 = loadaddr @get2#0
  %r481 = loadaddr @get2#0
  %r482 = add i32 0, 4 ; loadint
  %r483 = loadaddr @ii#0
  %r484 = load i32, ptr %r483
  %r485 = add i32 0, 1 ; loadint
  %r486 = add i32 %r484, %r485
  %r487 = mul i32 %r486, %r482
  %r488 = add i32 %r481, %r487
  store i32 %r479, ptr %r488
  %r489 = loadaddr @ii#0
  %r490 = load i32, ptr %r489
  %r491 = add i32 0, 2 ; loadint
  %r492 = add i32 %r490, %r491
  %r493 = loadaddr @ii#0
  store i32 %r492, ptr %r493
  br label %B165

B167:
  %r494 = add i32 0, 64 ; loadint
  %r495 = loadaddr @get2#0
  %r496 = loadaddr @get2#0
  %r497 = add i32 0, 4 ; loadint
  %r498 = loadaddr @ii#0
  %r499 = load i32, ptr %r498
  %r500 = mul i32 %r499, %r497
  %r501 = add i32 %r496, %r500
  store i32 %r494, ptr %r501
  %r502 = add i32 0, 1 ; loadint
  %r503 = loadaddr @i#0
  store i32 %r502, ptr %r503
  br label %B168

B168:
  %r504 = loadaddr @get2#0
  %r505 = add i32 0, 4 ; loadint
  %r506 = loadaddr @i#0
  %r507 = load i32, ptr %r506
  %r508 = mul i32 %r507, %r505
  %r509 = add i32 %r504, %r508
  %r510 = load i32, ptr %r509
  %r511 = add i32 0, 64 ; loadint
  %r512 = icmp ne i32 %r510, %r511
  br i1 %r512, label %B169, label %B170

B169:
  br label %B171

B170:
  %r726 = loadaddr @ints#0
  %r727 = add i32 0, 4 ; loadint
  %r728 = add i32 0, 1 ; loadint
  %r729 = mul i32 %r728, %r727
  %r730 = add i32 %r726, %r729
  %r731 = load i32, ptr %r730
  %r725 = call i32 @putint(i32 %r731)
  %r732 = add i32 0, 0 ; loadint
  ret i32 %r732

B171:
  %r513 = alloca int, 4
  %r514 = alloca int, 4
  %r515 = alloca int, 4
  %r516 = alloca int, 4
  %r517 = alloca int, 4
  %r518 = loadaddr @get2#0
  %r519 = add i32 0, 4 ; loadint
  %r520 = loadaddr @i#0
  %r521 = load i32, ptr %r520
  %r522 = mul i32 %r521, %r519
  %r523 = add i32 %r518, %r522
  %r524 = load i32, ptr %r523
  %r525 = add i32 0, 43 ; loadint
  %r526 = icmp eq i32 %r524, %r525
  br i1 %r526, label %B172, label %B173

B172:
  %r536 = add i32 0, 1 ; loadint
  store i32 %r536, ptr %r517
  br label %B174

B173:
  %r527 = loadaddr @get2#0
  %r528 = add i32 0, 4 ; loadint
  %r529 = loadaddr @i#0
  %r530 = load i32, ptr %r529
  %r531 = mul i32 %r530, %r528
  %r532 = add i32 %r527, %r531
  %r533 = load i32, ptr %r532
  %r534 = add i32 0, 45 ; loadint
  %r535 = icmp eq i32 %r533, %r534
  store i32 %r535, ptr %r517
  br label %B174

B174:
  %r537 = load i32, ptr %r517
  br i1 %r537, label %B175, label %B176

B175:
  %r547 = add i32 0, 1 ; loadint
  store i32 %r547, ptr %r516
  br label %B177

B176:
  %r538 = loadaddr @get2#0
  %r539 = add i32 0, 4 ; loadint
  %r540 = loadaddr @i#0
  %r541 = load i32, ptr %r540
  %r542 = mul i32 %r541, %r539
  %r543 = add i32 %r538, %r542
  %r544 = load i32, ptr %r543
  %r545 = add i32 0, 42 ; loadint
  %r546 = icmp eq i32 %r544, %r545
  store i32 %r546, ptr %r516
  br label %B177

B177:
  %r548 = load i32, ptr %r516
  br i1 %r548, label %B178, label %B179

B178:
  %r558 = add i32 0, 1 ; loadint
  store i32 %r558, ptr %r515
  br label %B180

B179:
  %r549 = loadaddr @get2#0
  %r550 = add i32 0, 4 ; loadint
  %r551 = loadaddr @i#0
  %r552 = load i32, ptr %r551
  %r553 = mul i32 %r552, %r550
  %r554 = add i32 %r549, %r553
  %r555 = load i32, ptr %r554
  %r556 = add i32 0, 47 ; loadint
  %r557 = icmp eq i32 %r555, %r556
  store i32 %r557, ptr %r515
  br label %B180

B180:
  %r559 = load i32, ptr %r515
  br i1 %r559, label %B181, label %B182

B181:
  %r569 = add i32 0, 1 ; loadint
  store i32 %r569, ptr %r514
  br label %B183

B182:
  %r560 = loadaddr @get2#0
  %r561 = add i32 0, 4 ; loadint
  %r562 = loadaddr @i#0
  %r563 = load i32, ptr %r562
  %r564 = mul i32 %r563, %r561
  %r565 = add i32 %r560, %r564
  %r566 = load i32, ptr %r565
  %r567 = add i32 0, 37 ; loadint
  %r568 = icmp eq i32 %r566, %r567
  store i32 %r568, ptr %r514
  br label %B183

B183:
  %r570 = load i32, ptr %r514
  br i1 %r570, label %B184, label %B185

B184:
  %r580 = add i32 0, 1 ; loadint
  store i32 %r580, ptr %r513
  br label %B186

B185:
  %r571 = loadaddr @get2#0
  %r572 = add i32 0, 4 ; loadint
  %r573 = loadaddr @i#0
  %r574 = load i32, ptr %r573
  %r575 = mul i32 %r574, %r572
  %r576 = add i32 %r571, %r575
  %r577 = load i32, ptr %r576
  %r578 = add i32 0, 94 ; loadint
  %r579 = icmp eq i32 %r577, %r578
  store i32 %r579, ptr %r513
  br label %B186

B186:
  %r581 = load i32, ptr %r513
  br i1 %r581, label %B187, label %B188

B187:
  %r582 = alloca int, 4
  %r583 = call i32 @intpop()
  store i32 %r583, ptr %r582
  %r584 = alloca int, 4
  %r585 = call i32 @intpop()
  store i32 %r585, ptr %r584
  %r586 = alloca int, 4
  br label %B190

B188:
  br label %B208

B189:
  %r720 = loadaddr @i#0
  %r721 = load i32, ptr %r720
  %r722 = add i32 0, 1 ; loadint
  %r723 = add i32 %r721, %r722
  %r724 = loadaddr @i#0
  store i32 %r723, ptr %r724
  br label %B168

B190:
  %r587 = loadaddr @get2#0
  %r588 = add i32 0, 4 ; loadint
  %r589 = loadaddr @i#0
  %r590 = load i32, ptr %r589
  %r591 = mul i32 %r590, %r588
  %r592 = add i32 %r587, %r591
  %r593 = load i32, ptr %r592
  %r594 = add i32 0, 43 ; loadint
  %r595 = icmp eq i32 %r593, %r594
  br i1 %r595, label %B191, label %B192

B191:
  %r596 = load i32, ptr %r582
  %r597 = load i32, ptr %r584
  %r598 = add i32 %r596, %r597
  store i32 %r598, ptr %r586
  br label %B192

B192:
  br label %B193

B193:
  %r599 = loadaddr @get2#0
  %r600 = add i32 0, 4 ; loadint
  %r601 = loadaddr @i#0
  %r602 = load i32, ptr %r601
  %r603 = mul i32 %r602, %r600
  %r604 = add i32 %r599, %r603
  %r605 = load i32, ptr %r604
  %r606 = add i32 0, 45 ; loadint
  %r607 = icmp eq i32 %r605, %r606
  br i1 %r607, label %B194, label %B195

B194:
  %r608 = load i32, ptr %r584
  %r609 = load i32, ptr %r582
  %r610 = sub i32 %r608, %r609
  store i32 %r610, ptr %r586
  br label %B195

B195:
  br label %B196

B196:
  %r611 = loadaddr @get2#0
  %r612 = add i32 0, 4 ; loadint
  %r613 = loadaddr @i#0
  %r614 = load i32, ptr %r613
  %r615 = mul i32 %r614, %r612
  %r616 = add i32 %r611, %r615
  %r617 = load i32, ptr %r616
  %r618 = add i32 0, 42 ; loadint
  %r619 = icmp eq i32 %r617, %r618
  br i1 %r619, label %B197, label %B198

B197:
  %r620 = load i32, ptr %r582
  %r621 = load i32, ptr %r584
  %r622 = mul i32 %r620, %r621
  store i32 %r622, ptr %r586
  br label %B198

B198:
  br label %B199

B199:
  %r623 = loadaddr @get2#0
  %r624 = add i32 0, 4 ; loadint
  %r625 = loadaddr @i#0
  %r626 = load i32, ptr %r625
  %r627 = mul i32 %r626, %r624
  %r628 = add i32 %r623, %r627
  %r629 = load i32, ptr %r628
  %r630 = add i32 0, 47 ; loadint
  %r631 = icmp eq i32 %r629, %r630
  br i1 %r631, label %B200, label %B201

B200:
  %r632 = load i32, ptr %r584
  %r633 = load i32, ptr %r582
  %r634 = sdiv i32 %r632, %r633
  store i32 %r634, ptr %r586
  br label %B201

B201:
  br label %B202

B202:
  %r635 = loadaddr @get2#0
  %r636 = add i32 0, 4 ; loadint
  %r637 = loadaddr @i#0
  %r638 = load i32, ptr %r637
  %r639 = mul i32 %r638, %r636
  %r640 = add i32 %r635, %r639
  %r641 = load i32, ptr %r640
  %r642 = add i32 0, 37 ; loadint
  %r643 = icmp eq i32 %r641, %r642
  br i1 %r643, label %B203, label %B204

B203:
  %r644 = load i32, ptr %r584
  %r645 = load i32, ptr %r582
  %r646 = srem i32 %r644, %r645
  store i32 %r646, ptr %r586
  br label %B204

B204:
  br label %B205

B205:
  %r647 = loadaddr @get2#0
  %r648 = add i32 0, 4 ; loadint
  %r649 = loadaddr @i#0
  %r650 = load i32, ptr %r649
  %r651 = mul i32 %r650, %r648
  %r652 = add i32 %r647, %r651
  %r653 = load i32, ptr %r652
  %r654 = add i32 0, 94 ; loadint
  %r655 = icmp eq i32 %r653, %r654
  br i1 %r655, label %B206, label %B207

B206:
  %r657 = load i32, ptr %r584
  %r658 = load i32, ptr %r582
  %r656 = call i32 @power(i32 %r657, i32 %r658)
  store i32 %r656, ptr %r586
  br label %B207

B207:
  %r660 = load i32, ptr %r586
  %r659 = call@intpush(i32 %r660)
  br label %B189

B208:
  %r661 = loadaddr @get2#0
  %r662 = add i32 0, 4 ; loadint
  %r663 = loadaddr @i#0
  %r664 = load i32, ptr %r663
  %r665 = mul i32 %r664, %r662
  %r666 = add i32 %r661, %r665
  %r667 = load i32, ptr %r666
  %r668 = add i32 0, 32 ; loadint
  %r669 = icmp ne i32 %r667, %r668
  br i1 %r669, label %B209, label %B210

B209:
  %r671 = loadaddr @get2#0
  %r672 = add i32 0, 4 ; loadint
  %r673 = loadaddr @i#0
  %r674 = load i32, ptr %r673
  %r675 = mul i32 %r674, %r672
  %r676 = add i32 %r671, %r675
  %r677 = load i32, ptr %r676
  %r678 = add i32 0, 48 ; loadint
  %r679 = sub i32 %r677, %r678
  %r670 = call@intpush(i32 %r679)
  %r680 = add i32 0, 1 ; loadint
  %r681 = loadaddr @ii#0
  store i32 %r680, ptr %r681
  br label %B211

B210:
  br label %B189

B211:
  %r682 = loadaddr @get2#0
  %r683 = add i32 0, 4 ; loadint
  %r684 = loadaddr @i#0
  %r685 = load i32, ptr %r684
  %r686 = loadaddr @ii#0
  %r687 = load i32, ptr %r686
  %r688 = add i32 %r685, %r687
  %r689 = mul i32 %r688, %r683
  %r690 = add i32 %r682, %r689
  %r691 = load i32, ptr %r690
  %r692 = add i32 0, 32 ; loadint
  %r693 = icmp ne i32 %r691, %r692
  br i1 %r693, label %B212, label %B213

B212:
  %r695 = loadaddr @get2#0
  %r696 = add i32 0, 4 ; loadint
  %r697 = loadaddr @i#0
  %r698 = load i32, ptr %r697
  %r699 = loadaddr @ii#0
  %r700 = load i32, ptr %r699
  %r701 = add i32 %r698, %r700
  %r702 = mul i32 %r701, %r696
  %r703 = add i32 %r695, %r702
  %r704 = load i32, ptr %r703
  %r705 = add i32 0, 48 ; loadint
  %r706 = sub i32 %r704, %r705
  %r694 = call@intadd(i32 %r706)
  %r707 = loadaddr @ii#0
  %r708 = load i32, ptr %r707
  %r709 = add i32 0, 1 ; loadint
  %r710 = add i32 %r708, %r709
  %r711 = loadaddr @ii#0
  store i32 %r710, ptr %r711
  br label %B211

B213:
  %r712 = loadaddr @i#0
  %r713 = load i32, ptr %r712
  %r714 = loadaddr @ii#0
  %r715 = load i32, ptr %r714
  %r716 = add i32 %r713, %r715
  %r717 = add i32 0, 1 ; loadint
  %r718 = sub i32 %r716, %r717
  %r719 = loadaddr @i#0
  store i32 %r718, ptr %r719
  br label %B210

}
define void @intadd(i32){
B30:
  %r2 = alloca int, 4
  store i32 %r1, ptr %r2
  %r3 = loadaddr @ints#0
  %r4 = add i32 0, 4 ; loadint
  %r5 = loadaddr @intt#0
  %r6 = load i32, ptr %r5
  %r7 = mul i32 %r6, %r4
  %r8 = add i32 %r3, %r7
  %r9 = load i32, ptr %r8
  %r10 = add i32 0, 10 ; loadint
  %r11 = mul i32 %r9, %r10
  %r12 = loadaddr @ints#0
  %r13 = loadaddr @ints#0
  %r14 = add i32 0, 4 ; loadint
  %r15 = loadaddr @intt#0
  %r16 = load i32, ptr %r15
  %r17 = mul i32 %r16, %r14
  %r18 = add i32 %r13, %r17
  store i32 %r11, ptr %r18
  %r19 = loadaddr @ints#0
  %r20 = add i32 0, 4 ; loadint
  %r21 = loadaddr @intt#0
  %r22 = load i32, ptr %r21
  %r23 = mul i32 %r22, %r20
  %r24 = add i32 %r19, %r23
  %r25 = load i32, ptr %r24
  %r26 = load i32, ptr %r2
  %r27 = add i32 %r25, %r26
  %r28 = loadaddr @ints#0
  %r29 = loadaddr @ints#0
  %r30 = add i32 0, 4 ; loadint
  %r31 = loadaddr @intt#0
  %r32 = load i32, ptr %r31
  %r33 = mul i32 %r32, %r30
  %r34 = add i32 %r29, %r33
  store i32 %r27, ptr %r34
  %r35 = add i32 0, 0 ; loadint
  ret i32 %r35

}
define void @intpush(i32){
B22:
  %r2 = alloca int, 4
  store i32 %r1, ptr %r2
  %r3 = loadaddr @intt#0
  %r4 = load i32, ptr %r3
  %r5 = add i32 0, 1 ; loadint
  %r6 = add i32 %r4, %r5
  %r7 = loadaddr @intt#0
  store i32 %r6, ptr %r7
  %r8 = load i32, ptr %r2
  %r9 = loadaddr @ints#0
  %r10 = loadaddr @ints#0
  %r11 = add i32 0, 4 ; loadint
  %r12 = loadaddr @intt#0
  %r13 = load i32, ptr %r12
  %r14 = mul i32 %r13, %r11
  %r15 = add i32 %r10, %r14
  store i32 %r8, ptr %r15
  %r16 = add i32 0, 0 ; loadint
  ret i32 %r16

}
define i32 @getstr(i32){
B14:
  %r2 = alloca int, 4
  %r3 = call i32 @getch()
  store i32 %r3, ptr %r2
  %r4 = alloca int, 4
  %r5 = add i32 0, 0 ; loadint
  store i32 %r5, ptr %r4
  br label %B15

B15:
  %r6 = alloca int, 4
  %r7 = load i32, ptr %r2
  %r8 = add i32 0, 13 ; loadint
  %r9 = icmp ne i32 %r7, %r8
  br i1 %r9, label %B18, label %B19

B16:
  %r15 = load i32, ptr %r2
  %r16 = add i32 0, 4 ; loadint
  %r17 = load i32, ptr %r4
  %r18 = mul i32 %r17, %r16
  %r19 = add i32 %r1, %r18
  store i32 %r15, ptr %r19
  %r20 = load i32, ptr %r4
  %r21 = add i32 0, 1 ; loadint
  %r22 = add i32 %r20, %r21
  store i32 %r22, ptr %r4
  %r23 = call i32 @getch()
  store i32 %r23, ptr %r2
  br label %B15

B17:
  %r24 = load i32, ptr %r4
  ret i32 %r24

B18:
  %r10 = load i32, ptr %r2
  %r11 = add i32 0, 10 ; loadint
  %r12 = icmp ne i32 %r10, %r11
  store i32 %r12, ptr %r6
  br label %B20

B19:
  %r13 = add i32 0, 0 ; loadint
  store i32 %r13, ptr %r6
  br label %B20

B20:
  %r14 = load i32, ptr %r6
  br i1 %r14, label %B16, label %B17

}
define i32 @power(i32, i32){
B9:
  %r3 = alloca int, 4
  store i32 %r1, ptr %r3
  %r4 = alloca int, 4
  store i32 %r2, ptr %r4
  %r5 = alloca int, 4
  %r6 = add i32 0, 1 ; loadint
  store i32 %r6, ptr %r5
  br label %B10

B10:
  %r7 = load i32, ptr %r4
  %r8 = add i32 0, 0 ; loadint
  %r9 = icmp ne i32 %r7, %r8
  br i1 %r9, label %B11, label %B12

B11:
  %r10 = load i32, ptr %r5
  %r11 = load i32, ptr %r3
  %r12 = mul i32 %r10, %r11
  store i32 %r12, ptr %r5
  %r13 = load i32, ptr %r4
  %r14 = add i32 0, 1 ; loadint
  %r15 = sub i32 %r13, %r14
  store i32 %r15, ptr %r4
  br label %B10

B12:
  %r16 = load i32, ptr %r5
  ret i32 %r16

}
define i32 @isdigit(i32){
B0:
  %r2 = alloca int, 4
  store i32 %r1, ptr %r2
  br label %B1

B1:
  %r3 = alloca int, 4
  %r4 = load i32, ptr %r2
  %r5 = add i32 0, 48 ; loadint
  %r6 = icmp sge i32 %r4, %r5
  br i1 %r6, label %B2, label %B3

B2:
  %r7 = load i32, ptr %r2
  %r8 = add i32 0, 57 ; loadint
  %r9 = icmp sle i32 %r7, %r8
  store i32 %r9, ptr %r3
  br label %B4

B3:
  %r10 = add i32 0, 0 ; loadint
  store i32 %r10, ptr %r3
  br label %B4

B4:
  %r11 = load i32, ptr %r3
  br i1 %r11, label %B5, label %B6

B5:
  %r12 = add i32 0, 1 ; loadint
  ret i32 %r12

B6:
  %r13 = add i32 0, 0 ; loadint
  ret i32 %r13

}
