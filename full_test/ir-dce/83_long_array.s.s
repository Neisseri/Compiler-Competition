; module
@N#0 = global const int 10000, 4
define i32 @main(){
B36:
  %r2 = add i32 0, 9 ; loadint
  %r1 = call i32 @long_array(i32 %r2)
  ret i32 %r1

}
define i32 @long_array(i32){
B0:
  %r2 = alloca int, 4
  store i32 %r1, ptr %r2
  %r3 = alloca int [10000], 40000
  %r4 = alloca int [10000], 40000
  %r5 = alloca int [10000], 40000
  %r6 = alloca int, 4
  %r7 = add i32 0, 0 ; loadint
  store i32 %r7, ptr %r6
  br label %B1

B1:
  %r8 = load i32, ptr %r6
  %r9 = loadaddr @N#0
  %r10 = load i32, ptr %r9
  %r11 = icmp slt i32 %r8, %r10
  br i1 %r11, label %B2, label %B3

B2:
  %r12 = load i32, ptr %r6
  %r13 = load i32, ptr %r6
  %r14 = mul i32 %r12, %r13
  %r15 = add i32 0, 10 ; loadint
  %r16 = srem i32 %r14, %r15
  %r17 = add i32 0, 4 ; loadint
  %r18 = load i32, ptr %r6
  %r19 = mul i32 %r18, %r17
  %r20 = add i32 %r3, %r19
  store i32 %r16, ptr %r20
  %r21 = load i32, ptr %r6
  %r22 = add i32 0, 1 ; loadint
  %r23 = add i32 %r21, %r22
  store i32 %r23, ptr %r6
  br label %B1

B3:
  %r24 = add i32 0, 0 ; loadint
  store i32 %r24, ptr %r6
  br label %B4

B4:
  %r25 = load i32, ptr %r6
  %r26 = loadaddr @N#0
  %r27 = load i32, ptr %r26
  %r28 = icmp slt i32 %r25, %r27
  br i1 %r28, label %B5, label %B6

B5:
  %r29 = add i32 0, 4 ; loadint
  %r30 = load i32, ptr %r6
  %r31 = mul i32 %r30, %r29
  %r32 = add i32 %r3, %r31
  %r33 = load i32, ptr %r32
  %r34 = add i32 0, 4 ; loadint
  %r35 = load i32, ptr %r6
  %r36 = mul i32 %r35, %r34
  %r37 = add i32 %r3, %r36
  %r38 = load i32, ptr %r37
  %r39 = mul i32 %r33, %r38
  %r40 = add i32 0, 10 ; loadint
  %r41 = srem i32 %r39, %r40
  %r42 = add i32 0, 4 ; loadint
  %r43 = load i32, ptr %r6
  %r44 = mul i32 %r43, %r42
  %r45 = add i32 %r4, %r44
  store i32 %r41, ptr %r45
  %r46 = load i32, ptr %r6
  %r47 = add i32 0, 1 ; loadint
  %r48 = add i32 %r46, %r47
  store i32 %r48, ptr %r6
  br label %B4

B6:
  %r49 = add i32 0, 0 ; loadint
  store i32 %r49, ptr %r6
  br label %B7

B7:
  %r50 = load i32, ptr %r6
  %r51 = loadaddr @N#0
  %r52 = load i32, ptr %r51
  %r53 = icmp slt i32 %r50, %r52
  br i1 %r53, label %B8, label %B9

B8:
  %r54 = add i32 0, 4 ; loadint
  %r55 = load i32, ptr %r6
  %r56 = mul i32 %r55, %r54
  %r57 = add i32 %r4, %r56
  %r58 = load i32, ptr %r57
  %r59 = add i32 0, 4 ; loadint
  %r60 = load i32, ptr %r6
  %r61 = mul i32 %r60, %r59
  %r62 = add i32 %r4, %r61
  %r63 = load i32, ptr %r62
  %r64 = mul i32 %r58, %r63
  %r65 = add i32 0, 100 ; loadint
  %r66 = srem i32 %r64, %r65
  %r67 = add i32 0, 4 ; loadint
  %r68 = load i32, ptr %r6
  %r69 = mul i32 %r68, %r67
  %r70 = add i32 %r3, %r69
  %r71 = load i32, ptr %r70
  %r72 = add i32 %r66, %r71
  %r73 = add i32 0, 4 ; loadint
  %r74 = load i32, ptr %r6
  %r75 = mul i32 %r74, %r73
  %r76 = add i32 %r5, %r75
  store i32 %r72, ptr %r76
  %r77 = load i32, ptr %r6
  %r78 = add i32 0, 1 ; loadint
  %r79 = add i32 %r77, %r78
  store i32 %r79, ptr %r6
  br label %B7

B9:
  %r80 = alloca int, 4
  %r81 = add i32 0, 0 ; loadint
  store i32 %r81, ptr %r80
  %r82 = add i32 0, 0 ; loadint
  store i32 %r82, ptr %r6
  br label %B10

B10:
  %r83 = load i32, ptr %r6
  %r84 = loadaddr @N#0
  %r85 = load i32, ptr %r84
  %r86 = icmp slt i32 %r83, %r85
  br i1 %r86, label %B11, label %B12

B11:
  br label %B13

B12:
  %r196 = load i32, ptr %r80
  ret i32 %r196

B13:
  %r87 = load i32, ptr %r6
  %r88 = add i32 0, 10 ; loadint
  %r89 = icmp slt i32 %r87, %r88
  br i1 %r89, label %B14, label %B15

B14:
  %r90 = load i32, ptr %r80
  %r91 = add i32 0, 4 ; loadint
  %r92 = load i32, ptr %r6
  %r93 = mul i32 %r92, %r91
  %r94 = add i32 %r5, %r93
  %r95 = load i32, ptr %r94
  %r96 = add i32 %r90, %r95
  %r97 = add i32 0, 1333 ; loadint
  %r98 = srem i32 %r96, %r97
  store i32 %r98, ptr %r80
  %r100 = load i32, ptr %r80
  %r99 = call i32 @putint(i32 %r100)
  br label %B16

B15:
  br label %B17

B16:
  %r193 = load i32, ptr %r6
  %r194 = add i32 0, 1 ; loadint
  %r195 = add i32 %r193, %r194
  store i32 %r195, ptr %r6
  br label %B10

B17:
  %r101 = load i32, ptr %r6
  %r102 = add i32 0, 20 ; loadint
  %r103 = icmp slt i32 %r101, %r102
  br i1 %r103, label %B18, label %B19

B18:
  %r104 = alloca int, 4
  %r105 = loadaddr @N#0
  %r106 = load i32, ptr %r105
  %r107 = add i32 0, 2 ; loadint
  %r108 = sdiv i32 %r106, %r107
  store i32 %r108, ptr %r104
  br label %B21

B19:
  br label %B24

B20:
  br label %B16

B21:
  %r109 = load i32, ptr %r104
  %r110 = loadaddr @N#0
  %r111 = load i32, ptr %r110
  %r112 = icmp slt i32 %r109, %r111
  br i1 %r112, label %B22, label %B23

B22:
  %r113 = load i32, ptr %r80
  %r114 = add i32 0, 4 ; loadint
  %r115 = load i32, ptr %r6
  %r116 = mul i32 %r115, %r114
  %r117 = add i32 %r5, %r116
  %r118 = load i32, ptr %r117
  %r119 = add i32 %r113, %r118
  %r120 = add i32 0, 4 ; loadint
  %r121 = load i32, ptr %r104
  %r122 = mul i32 %r121, %r120
  %r123 = add i32 %r3, %r122
  %r124 = load i32, ptr %r123
  %r125 = sub i32 %r119, %r124
  store i32 %r125, ptr %r80
  %r126 = load i32, ptr %r104
  %r127 = add i32 0, 1 ; loadint
  %r128 = add i32 %r126, %r127
  store i32 %r128, ptr %r104
  br label %B21

B23:
  %r130 = load i32, ptr %r80
  %r129 = call i32 @putint(i32 %r130)
  br label %B20

B24:
  %r131 = load i32, ptr %r6
  %r132 = add i32 0, 30 ; loadint
  %r133 = icmp slt i32 %r131, %r132
  br i1 %r133, label %B25, label %B26

B25:
  %r134 = alloca int, 4
  %r135 = loadaddr @N#0
  %r136 = load i32, ptr %r135
  %r137 = add i32 0, 2 ; loadint
  %r138 = sdiv i32 %r136, %r137
  store i32 %r138, ptr %r134
  br label %B28

B26:
  %r182 = load i32, ptr %r80
  %r183 = add i32 0, 4 ; loadint
  %r184 = load i32, ptr %r6
  %r185 = mul i32 %r184, %r183
  %r186 = add i32 %r5, %r185
  %r187 = load i32, ptr %r186
  %r188 = load i32, ptr %r2
  %r189 = mul i32 %r187, %r188
  %r190 = add i32 %r182, %r189
  %r191 = add i32 0, 99988 ; loadint
  %r192 = srem i32 %r190, %r191
  store i32 %r192, ptr %r80
  br label %B27

B27:
  br label %B20

B28:
  %r139 = load i32, ptr %r134
  %r140 = loadaddr @N#0
  %r141 = load i32, ptr %r140
  %r142 = icmp slt i32 %r139, %r141
  br i1 %r142, label %B29, label %B30

B29:
  br label %B31

B30:
  %r181 = load i32, ptr %r80
  %r180 = call i32 @putint(i32 %r181)
  br label %B27

B31:
  %r143 = load i32, ptr %r134
  %r144 = add i32 0, 2233 ; loadint
  %r145 = icmp sgt i32 %r143, %r144
  br i1 %r145, label %B32, label %B33

B32:
  %r146 = load i32, ptr %r80
  %r147 = add i32 0, 4 ; loadint
  %r148 = load i32, ptr %r6
  %r149 = mul i32 %r148, %r147
  %r150 = add i32 %r4, %r149
  %r151 = load i32, ptr %r150
  %r152 = add i32 %r146, %r151
  %r153 = add i32 0, 4 ; loadint
  %r154 = load i32, ptr %r134
  %r155 = mul i32 %r154, %r153
  %r156 = add i32 %r3, %r155
  %r157 = load i32, ptr %r156
  %r158 = sub i32 %r152, %r157
  store i32 %r158, ptr %r80
  %r159 = load i32, ptr %r134
  %r160 = add i32 0, 1 ; loadint
  %r161 = add i32 %r159, %r160
  store i32 %r161, ptr %r134
  br label %B34

B33:
  %r162 = load i32, ptr %r80
  %r163 = add i32 0, 4 ; loadint
  %r164 = load i32, ptr %r6
  %r165 = mul i32 %r164, %r163
  %r166 = add i32 %r3, %r165
  %r167 = load i32, ptr %r166
  %r168 = add i32 %r162, %r167
  %r169 = add i32 0, 4 ; loadint
  %r170 = load i32, ptr %r134
  %r171 = mul i32 %r170, %r169
  %r172 = add i32 %r5, %r171
  %r173 = load i32, ptr %r172
  %r174 = add i32 %r168, %r173
  %r175 = add i32 0, 13333 ; loadint
  %r176 = srem i32 %r174, %r175
  store i32 %r176, ptr %r80
  %r177 = load i32, ptr %r134
  %r178 = add i32 0, 2 ; loadint
  %r179 = add i32 %r177, %r178
  store i32 %r179, ptr %r134
  br label %B34

B34:
  br label %B28

}
