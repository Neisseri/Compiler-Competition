; module
@array#0 = global int [110], 440
@n#0 = global int, 4
define i32 @main(){
B17:
  %r5 = add i32 0, 1 ; loadint
  br label %B18

B18:
  %r269 = phi i32 [ %r5, %B17 ], [ %r9, %B68 ]
  %r273 = add i32 0, %r272 ; assign
  %r268 = add i32 0, %r12 ; assign
  %r267 = add i32 0, %r266 ; assign
  %r263 = add i32 0, %r262 ; assign
  %r259 = add i32 0, %r258 ; assign
  %r255 = add i32 0, %r254 ; assign
  %r251 = add i32 0, %r250 ; assign
  %r247 = add i32 0, %r246 ; assign
  %r243 = add i32 0, %r242 ; assign
  %r240 = add i32 0, %r27 ; assign
  %r238 = add i32 0, %r239 ; assign
  %r234 = add i32 0, %r237 ; assign
  %r233 = add i32 0, %r232 ; assign
  %r231 = add i32 0, %r230 ; assign
  br i1 %r269, label %B19, label %B20

B19:
  %r8 = add i32 0, 1 ; loadint
  %r9 = sub i32 %r269, %r8
  %r10 = add i32 0, 4 ; loadint
  %r11 = loadaddr @n#0
  store i32 %r10, ptr %r11
  %r12 = add i32 0, 10 ; loadint
  %r14 = add i32 0, 0 ; loadint
  %r16 = add i32 0, 0 ; loadint
  %r18 = loadaddr @n#0
  %r19 = load i32, ptr %r18
  %r17 = call i32 @init(i32 %r19)
  %r21 = loadaddr @n#0
  %r22 = load i32, ptr %r21
  %r23 = loadaddr @n#0
  %r24 = load i32, ptr %r23
  %r25 = mul i32 %r22, %r24
  %r26 = add i32 0, 1 ; loadint
  %r27 = add i32 %r25, %r26
  br label %B21

B20:
  %r229 = add i32 0, 0 ; loadint
  ret i32 %r229

B21:
  %r272 = phi i32 [ %r273, %B19 ], [ %r271, %B26 ]
  %r266 = phi i32 [ %r267, %B19 ], [ %r265, %B26 ]
  %r262 = phi i32 [ %r263, %B19 ], [ %r261, %B26 ]
  %r258 = phi i32 [ %r259, %B19 ], [ %r257, %B26 ]
  %r254 = phi i32 [ %r255, %B19 ], [ %r253, %B26 ]
  %r250 = phi i32 [ %r251, %B19 ], [ %r249, %B26 ]
  %r246 = phi i32 [ %r247, %B19 ], [ %r245, %B26 ]
  %r242 = phi i32 [ %r243, %B19 ], [ %r241, %B26 ]
  %r239 = phi i32 [ %r14, %B19 ], [ %r219, %B26 ]
  %r237 = phi i32 [ %r16, %B19 ], [ %r236, %B26 ]
  %r232 = phi i32 [ %r233, %B19 ], [ %r32, %B26 ]
  %r230 = phi i32 [ %r231, %B19 ], [ %r31, %B26 ]
  %r30 = icmp slt i32 %r239, %r12
  br i1 %r30, label %B22, label %B23

B22:
  %r31 = call i32 @getint()
  %r32 = call i32 @getint()
  br label %B24

B23:
  br label %B66

B24:
  %r35 = add i32 0, 0 ; loadint
  %r34 = icmp eq i32 %r35, %r237
  br i1 %r34, label %B25, label %B26

B25:
  %r37 = loadaddr @n#0
  %r38 = load i32, ptr %r37
  %r40 = add i32 0, 1 ; loadint
  %r41 = sub i32 %r31, %r40
  %r42 = mul i32 %r38, %r41
  %r44 = add i32 %r42, %r32
  %r46 = loadaddr @array#0
  %r47 = loadaddr @array#0
  %r48 = add i32 0, 4 ; loadint
  %r50 = mul i32 %r44, %r48
  %r51 = add i32 %r47, %r50
  store i32 %r44, ptr %r51
  br label %B27

B26:
  %r271 = phi i32 [ %r272, %B24 ], [ %r270, %B65 ]
  %r265 = phi i32 [ %r266, %B24 ], [ %r264, %B65 ]
  %r261 = phi i32 [ %r262, %B24 ], [ %r260, %B65 ]
  %r257 = phi i32 [ %r258, %B24 ], [ %r256, %B65 ]
  %r253 = phi i32 [ %r254, %B24 ], [ %r252, %B65 ]
  %r249 = phi i32 [ %r250, %B24 ], [ %r248, %B65 ]
  %r245 = phi i32 [ %r246, %B24 ], [ %r244, %B65 ]
  %r241 = phi i32 [ %r242, %B24 ], [ %r44, %B65 ]
  %r236 = phi i32 [ %r237, %B24 ], [ %r235, %B65 ]
  %r218 = add i32 0, 1 ; loadint
  %r219 = add i32 %r239, %r218
  br label %B21

B27:
  %r53 = add i32 0, 1 ; loadint
  %r54 = icmp eq i32 %r31, %r53
  br i1 %r54, label %B28, label %B29

B28:
  %r55 = add i32 0, 0 ; loadint
  %r56 = loadaddr @array#0
  %r57 = loadaddr @array#0
  %r58 = add i32 0, 4 ; loadint
  %r59 = add i32 0, 0 ; loadint
  %r60 = mul i32 %r59, %r58
  %r61 = add i32 %r57, %r60
  store i32 %r55, ptr %r61
  %r64 = add i32 0, 0 ; loadint
  %r62 = call i32 @mmerge(i32 %r44, i32 %r64)
  br label %B29

B29:
  br label %B30

B30:
  %r66 = loadaddr @n#0
  %r67 = load i32, ptr %r66
  %r68 = icmp eq i32 %r31, %r67
  br i1 %r68, label %B31, label %B32

B31:
  %r70 = loadaddr @array#0
  %r71 = loadaddr @array#0
  %r72 = add i32 0, 4 ; loadint
  %r74 = mul i32 %r27, %r72
  %r75 = add i32 %r71, %r74
  store i32 %r27, ptr %r75
  %r76 = call i32 @mmerge(i32 %r44, i32 %r27)
  br label %B32

B32:
  br label %B33

B33:
  %r81 = loadaddr @n#0
  %r82 = load i32, ptr %r81
  %r83 = icmp slt i32 %r32, %r82
  br i1 %r83, label %B34, label %B35

B34:
  %r84 = loadaddr @array#0
  %r85 = add i32 0, 4 ; loadint
  %r87 = add i32 0, 1 ; loadint
  %r88 = add i32 %r44, %r87
  %r89 = mul i32 %r88, %r85
  %r90 = add i32 %r84, %r89
  %r91 = load i32, ptr %r90
  %r92 = add i32 0, 1 ; loadint
  %r94 = add i32 0, 0 ; loadint
  %r93 = sub i32 %r94, %r92
  %r95 = icmp ne i32 %r91, %r93
  br label %B36

B35:
  %r96 = add i32 0, 0 ; loadint
  br label %B36

B36:
  %r264 = phi i32 [ %r95, %B34 ], [ %r96, %B35 ]
  br i1 %r264, label %B37, label %B38

B37:
  %r101 = add i32 0, 1 ; loadint
  %r102 = add i32 %r44, %r101
  %r98 = call i32 @mmerge(i32 %r44, i32 %r102)
  br label %B38

B38:
  br label %B39

B39:
  %r105 = add i32 0, 1 ; loadint
  %r106 = icmp sgt i32 %r32, %r105
  br i1 %r106, label %B40, label %B41

B40:
  %r107 = loadaddr @array#0
  %r108 = add i32 0, 4 ; loadint
  %r110 = add i32 0, 1 ; loadint
  %r111 = sub i32 %r44, %r110
  %r112 = mul i32 %r111, %r108
  %r113 = add i32 %r107, %r112
  %r114 = load i32, ptr %r113
  %r115 = add i32 0, 1 ; loadint
  %r117 = add i32 0, 0 ; loadint
  %r116 = sub i32 %r117, %r115
  %r118 = icmp ne i32 %r114, %r116
  br label %B42

B41:
  %r119 = add i32 0, 0 ; loadint
  br label %B42

B42:
  %r244 = phi i32 [ %r118, %B40 ], [ %r119, %B41 ]
  br i1 %r244, label %B43, label %B44

B43:
  %r124 = add i32 0, 1 ; loadint
  %r125 = sub i32 %r44, %r124
  %r121 = call i32 @mmerge(i32 %r44, i32 %r125)
  br label %B44

B44:
  br label %B45

B45:
  %r128 = loadaddr @n#0
  %r129 = load i32, ptr %r128
  %r130 = icmp slt i32 %r31, %r129
  br i1 %r130, label %B46, label %B47

B46:
  %r131 = loadaddr @array#0
  %r132 = add i32 0, 4 ; loadint
  %r134 = loadaddr @n#0
  %r135 = load i32, ptr %r134
  %r136 = add i32 %r44, %r135
  %r137 = mul i32 %r136, %r132
  %r138 = add i32 %r131, %r137
  %r139 = load i32, ptr %r138
  %r140 = add i32 0, 1 ; loadint
  %r142 = add i32 0, 0 ; loadint
  %r141 = sub i32 %r142, %r140
  %r143 = icmp ne i32 %r139, %r141
  br label %B48

B47:
  %r144 = add i32 0, 0 ; loadint
  br label %B48

B48:
  %r248 = phi i32 [ %r143, %B46 ], [ %r144, %B47 ]
  br i1 %r248, label %B49, label %B50

B49:
  %r149 = loadaddr @n#0
  %r150 = load i32, ptr %r149
  %r151 = add i32 %r44, %r150
  %r146 = call i32 @mmerge(i32 %r44, i32 %r151)
  br label %B50

B50:
  br label %B51

B51:
  %r154 = add i32 0, 1 ; loadint
  %r155 = icmp sgt i32 %r31, %r154
  br i1 %r155, label %B52, label %B53

B52:
  %r156 = loadaddr @array#0
  %r157 = add i32 0, 4 ; loadint
  %r159 = loadaddr @n#0
  %r160 = load i32, ptr %r159
  %r161 = sub i32 %r44, %r160
  %r162 = mul i32 %r161, %r157
  %r163 = add i32 %r156, %r162
  %r164 = load i32, ptr %r163
  %r165 = add i32 0, 1 ; loadint
  %r167 = add i32 0, 0 ; loadint
  %r166 = sub i32 %r167, %r165
  %r168 = icmp ne i32 %r164, %r166
  br label %B54

B53:
  %r169 = add i32 0, 0 ; loadint
  br label %B54

B54:
  %r252 = phi i32 [ %r168, %B52 ], [ %r169, %B53 ]
  br i1 %r252, label %B55, label %B56

B55:
  %r174 = loadaddr @n#0
  %r175 = load i32, ptr %r174
  %r176 = sub i32 %r44, %r175
  %r171 = call i32 @mmerge(i32 %r44, i32 %r176)
  br label %B56

B56:
  br label %B57

B57:
  %r179 = loadaddr @array#0
  %r180 = add i32 0, 4 ; loadint
  %r181 = add i32 0, 0 ; loadint
  %r182 = mul i32 %r181, %r180
  %r183 = add i32 %r179, %r182
  %r184 = load i32, ptr %r183
  %r185 = add i32 0, 1 ; loadint
  %r187 = add i32 0, 0 ; loadint
  %r186 = sub i32 %r187, %r185
  %r188 = icmp ne i32 %r184, %r186
  br i1 %r188, label %B58, label %B59

B58:
  %r189 = loadaddr @array#0
  %r190 = add i32 0, 4 ; loadint
  %r192 = mul i32 %r27, %r190
  %r193 = add i32 %r189, %r192
  %r194 = load i32, ptr %r193
  %r195 = add i32 0, 1 ; loadint
  %r197 = add i32 0, 0 ; loadint
  %r196 = sub i32 %r197, %r195
  %r198 = icmp ne i32 %r194, %r196
  br label %B60

B59:
  %r199 = add i32 0, 0 ; loadint
  br label %B60

B60:
  %r260 = phi i32 [ %r198, %B58 ], [ %r199, %B59 ]
  br i1 %r260, label %B61, label %B62

B61:
  %r202 = add i32 0, 0 ; loadint
  %r201 = call i32 @findfa(i32 %r202)
  %r203 = call i32 @findfa(i32 %r27)
  %r205 = icmp eq i32 %r201, %r203
  br label %B63

B62:
  %r206 = add i32 0, 0 ; loadint
  br label %B63

B63:
  %r256 = phi i32 [ %r205, %B61 ], [ %r206, %B62 ]
  br i1 %r256, label %B64, label %B65

B64:
  %r208 = add i32 0, 1 ; loadint
  %r211 = add i32 0, 1 ; loadint
  %r212 = add i32 %r239, %r211
  %r213 = call i32 @putint(i32 %r212)
  %r216 = add i32 0, 10 ; loadint
  %r215 = call i32 @putch(i32 %r216)
  br label %B65

B65:
  %r270 = phi i32 [ %r272, %B63 ], [ %r212, %B64 ]
  %r235 = phi i32 [ %r237, %B63 ], [ %r208, %B64 ]
  br label %B26

B66:
  %r222 = add i32 0, 0 ; loadint
  %r221 = icmp eq i32 %r222, %r237
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
define void @mmerge(i32, i32){
B12:
  %r6 = call i32 @findfa(i32 %r1)
  %r9 = call i32 @findfa(i32 %r2)
  br label %B13

B13:
  %r13 = icmp ne i32 %r6, %r9
  br i1 %r13, label %B14, label %B15

B14:
  %r15 = loadaddr @array#0
  %r16 = loadaddr @array#0
  %r17 = add i32 0, 4 ; loadint
  %r19 = mul i32 %r6, %r17
  %r20 = add i32 %r16, %r19
  store i32 %r9, ptr %r20
  br label %B15

B15:
  %r21 = add i32 0, 0 ; loadint
  ret i32 %r21

}
define i32 @findfa(i32){
B5:
  br label %B6

B6:
  %r3 = loadaddr @array#0
  %r4 = add i32 0, 4 ; loadint
  %r6 = mul i32 %r1, %r4
  %r7 = add i32 %r3, %r6
  %r8 = load i32, ptr %r7
  %r10 = icmp eq i32 %r8, %r1
  br i1 %r10, label %B7, label %B8

B7:
  ret i32 %r1

B8:
  %r13 = loadaddr @array#0
  %r14 = add i32 0, 4 ; loadint
  %r16 = mul i32 %r1, %r14
  %r17 = add i32 %r13, %r16
  %r18 = load i32, ptr %r17
  %r12 = call i32 @findfa(i32 %r18)
  %r19 = loadaddr @array#0
  %r20 = loadaddr @array#0
  %r21 = add i32 0, 4 ; loadint
  %r23 = mul i32 %r1, %r21
  %r24 = add i32 %r20, %r23
  store i32 %r12, ptr %r24
  %r25 = loadaddr @array#0
  %r26 = add i32 0, 4 ; loadint
  %r28 = mul i32 %r1, %r26
  %r29 = add i32 %r25, %r28
  %r30 = load i32, ptr %r29
  ret i32 %r30

}
define void @init(i32){
B0:
  %r4 = add i32 0, 1 ; loadint
  br label %B1

B1:
  %r25 = phi i32 [ %r4, %B0 ], [ %r23, %B2 ]
  %r8 = mul i32 %r1, %r1
  %r9 = add i32 0, 1 ; loadint
  %r10 = add i32 %r8, %r9
  %r11 = icmp sle i32 %r25, %r10
  br i1 %r11, label %B2, label %B3

B2:
  %r12 = add i32 0, 1 ; loadint
  %r14 = add i32 0, 0 ; loadint
  %r13 = sub i32 %r14, %r12
  %r15 = loadaddr @array#0
  %r16 = loadaddr @array#0
  %r17 = add i32 0, 4 ; loadint
  %r19 = mul i32 %r25, %r17
  %r20 = add i32 %r16, %r19
  store i32 %r13, ptr %r20
  %r22 = add i32 0, 1 ; loadint
  %r23 = add i32 %r25, %r22
  br label %B1

B3:
  %r24 = add i32 0, 0 ; loadint
  ret i32 %r24

}
