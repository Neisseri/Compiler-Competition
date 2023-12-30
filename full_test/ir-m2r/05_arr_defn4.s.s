; module
define i32 @main(){
B0:
  %r1 = alloca const int [4,2], 32
  %r2 = add i32 0, 1 ; loadint
  %r4 = add i32 0, 0 ; loadint
  %r3 = add i32 %r1, %r4
  store i32 %r2, ptr %r3
  %r5 = add i32 0, 2 ; loadint
  %r7 = add i32 0, 4 ; loadint
  %r6 = add i32 %r1, %r7
  store i32 %r5, ptr %r6
  %r8 = add i32 0, 3 ; loadint
  %r10 = add i32 0, 8 ; loadint
  %r9 = add i32 %r1, %r10
  store i32 %r8, ptr %r9
  %r11 = add i32 0, 4 ; loadint
  %r13 = add i32 0, 12 ; loadint
  %r12 = add i32 %r1, %r13
  store i32 %r11, ptr %r12
  %r14 = add i32 0, 0 ; loadint
  %r16 = add i32 0, 16 ; loadint
  %r15 = add i32 %r1, %r16
  store i32 %r14, ptr %r15
  %r17 = add i32 0, 0 ; loadint
  %r19 = add i32 0, 20 ; loadint
  %r18 = add i32 %r1, %r19
  store i32 %r17, ptr %r18
  %r20 = add i32 0, 7 ; loadint
  %r22 = add i32 0, 24 ; loadint
  %r21 = add i32 %r1, %r22
  store i32 %r20, ptr %r21
  %r23 = add i32 0, 0 ; loadint
  %r25 = add i32 0, 28 ; loadint
  %r24 = add i32 %r1, %r25
  store i32 %r23, ptr %r24
  %r27 = add i32 0, 3 ; loadint
  %r28 = alloca int [4,2], 32
  %r29 = add i32 0, 0 ; loadint
  %r31 = add i32 0, 0 ; loadint
  %r30 = add i32 %r28, %r31
  store i32 %r29, ptr %r30
  %r32 = add i32 0, 0 ; loadint
  %r34 = add i32 0, 4 ; loadint
  %r33 = add i32 %r28, %r34
  store i32 %r32, ptr %r33
  %r35 = add i32 0, 0 ; loadint
  %r37 = add i32 0, 8 ; loadint
  %r36 = add i32 %r28, %r37
  store i32 %r35, ptr %r36
  %r38 = add i32 0, 0 ; loadint
  %r40 = add i32 0, 12 ; loadint
  %r39 = add i32 %r28, %r40
  store i32 %r38, ptr %r39
  %r41 = add i32 0, 0 ; loadint
  %r43 = add i32 0, 16 ; loadint
  %r42 = add i32 %r28, %r43
  store i32 %r41, ptr %r42
  %r44 = add i32 0, 0 ; loadint
  %r46 = add i32 0, 20 ; loadint
  %r45 = add i32 %r28, %r46
  store i32 %r44, ptr %r45
  %r47 = add i32 0, 0 ; loadint
  %r49 = add i32 0, 24 ; loadint
  %r48 = add i32 %r28, %r49
  store i32 %r47, ptr %r48
  %r50 = add i32 0, 0 ; loadint
  %r52 = add i32 0, 28 ; loadint
  %r51 = add i32 %r28, %r52
  store i32 %r50, ptr %r51
  %r53 = alloca int [4,2], 32
  %r54 = add i32 0, 1 ; loadint
  %r56 = add i32 0, 0 ; loadint
  %r55 = add i32 %r53, %r56
  store i32 %r54, ptr %r55
  %r57 = add i32 0, 2 ; loadint
  %r59 = add i32 0, 4 ; loadint
  %r58 = add i32 %r53, %r59
  store i32 %r57, ptr %r58
  %r60 = add i32 0, 3 ; loadint
  %r62 = add i32 0, 8 ; loadint
  %r61 = add i32 %r53, %r62
  store i32 %r60, ptr %r61
  %r63 = add i32 0, 4 ; loadint
  %r65 = add i32 0, 12 ; loadint
  %r64 = add i32 %r53, %r65
  store i32 %r63, ptr %r64
  %r66 = add i32 0, 5 ; loadint
  %r68 = add i32 0, 16 ; loadint
  %r67 = add i32 %r53, %r68
  store i32 %r66, ptr %r67
  %r69 = add i32 0, 6 ; loadint
  %r71 = add i32 0, 20 ; loadint
  %r70 = add i32 %r53, %r71
  store i32 %r69, ptr %r70
  %r72 = add i32 0, 7 ; loadint
  %r74 = add i32 0, 24 ; loadint
  %r73 = add i32 %r53, %r74
  store i32 %r72, ptr %r73
  %r75 = add i32 0, 8 ; loadint
  %r77 = add i32 0, 28 ; loadint
  %r76 = add i32 %r53, %r77
  store i32 %r75, ptr %r76
  %r78 = alloca int [4,2], 32
  %r79 = add i32 0, 1 ; loadint
  %r81 = add i32 0, 0 ; loadint
  %r80 = add i32 %r78, %r81
  store i32 %r79, ptr %r80
  %r82 = add i32 0, 2 ; loadint
  %r84 = add i32 0, 4 ; loadint
  %r83 = add i32 %r78, %r84
  store i32 %r82, ptr %r83
  %r85 = add i32 0, 3 ; loadint
  %r87 = add i32 0, 8 ; loadint
  %r86 = add i32 %r78, %r87
  store i32 %r85, ptr %r86
  %r88 = add i32 0, 0 ; loadint
  %r90 = add i32 0, 12 ; loadint
  %r89 = add i32 %r78, %r90
  store i32 %r88, ptr %r89
  %r91 = add i32 0, 5 ; loadint
  %r93 = add i32 0, 16 ; loadint
  %r92 = add i32 %r78, %r93
  store i32 %r91, ptr %r92
  %r94 = add i32 0, 0 ; loadint
  %r96 = add i32 0, 20 ; loadint
  %r95 = add i32 %r78, %r96
  store i32 %r94, ptr %r95
  %r97 = add i32 0, 4 ; loadint
  %r98 = add i32 0, 0 ; loadint
  %r99 = mul i32 %r98, %r97
  %r100 = add i32 %r1, %r99
  %r101 = add i32 0, 2 ; loadint
  %r102 = mul i32 %r97, %r101
  %r103 = add i32 0, 3 ; loadint
  %r104 = mul i32 %r103, %r102
  %r105 = add i32 %r100, %r104
  %r106 = load i32, ptr %r105
  %r108 = add i32 0, 24 ; loadint
  %r107 = add i32 %r78, %r108
  store i32 %r106, ptr %r107
  %r109 = add i32 0, 8 ; loadint
  %r111 = add i32 0, 28 ; loadint
  %r110 = add i32 %r78, %r111
  store i32 %r109, ptr %r110
  %r112 = alloca int [4,2,1], 32
  %r113 = add i32 0, 4 ; loadint
  %r114 = add i32 0, 1 ; loadint
  %r115 = mul i32 %r114, %r113
  %r116 = add i32 %r78, %r115
  %r117 = add i32 0, 2 ; loadint
  %r118 = mul i32 %r113, %r117
  %r119 = add i32 0, 2 ; loadint
  %r120 = mul i32 %r119, %r118
  %r121 = add i32 %r116, %r120
  %r122 = load i32, ptr %r121
  %r124 = add i32 0, 0 ; loadint
  %r123 = add i32 %r112, %r124
  store i32 %r122, ptr %r123
  %r125 = add i32 0, 4 ; loadint
  %r126 = add i32 0, 1 ; loadint
  %r127 = mul i32 %r126, %r125
  %r128 = add i32 %r53, %r127
  %r129 = add i32 0, 2 ; loadint
  %r130 = mul i32 %r125, %r129
  %r131 = add i32 0, 2 ; loadint
  %r132 = mul i32 %r131, %r130
  %r133 = add i32 %r128, %r132
  %r134 = load i32, ptr %r133
  %r136 = add i32 0, 4 ; loadint
  %r135 = add i32 %r112, %r136
  store i32 %r134, ptr %r135
  %r137 = add i32 0, 3 ; loadint
  %r139 = add i32 0, 8 ; loadint
  %r138 = add i32 %r112, %r139
  store i32 %r137, ptr %r138
  %r140 = add i32 0, 4 ; loadint
  %r142 = add i32 0, 12 ; loadint
  %r141 = add i32 %r112, %r142
  store i32 %r140, ptr %r141
  %r143 = add i32 0, 5 ; loadint
  %r145 = add i32 0, 16 ; loadint
  %r144 = add i32 %r112, %r145
  store i32 %r143, ptr %r144
  %r146 = add i32 0, 6 ; loadint
  %r148 = add i32 0, 20 ; loadint
  %r147 = add i32 %r112, %r148
  store i32 %r146, ptr %r147
  %r149 = add i32 0, 7 ; loadint
  %r151 = add i32 0, 24 ; loadint
  %r150 = add i32 %r112, %r151
  store i32 %r149, ptr %r150
  %r152 = add i32 0, 8 ; loadint
  %r154 = add i32 0, 28 ; loadint
  %r153 = add i32 %r112, %r154
  store i32 %r152, ptr %r153
  %r155 = add i32 0, 4 ; loadint
  %r156 = add i32 0, 0 ; loadint
  %r157 = mul i32 %r156, %r155
  %r158 = add i32 %r112, %r157
  %r159 = add i32 0, 1 ; loadint
  %r160 = mul i32 %r155, %r159
  %r161 = add i32 0, 1 ; loadint
  %r162 = mul i32 %r161, %r160
  %r163 = add i32 %r158, %r162
  %r164 = add i32 0, 2 ; loadint
  %r165 = mul i32 %r160, %r164
  %r166 = add i32 0, 3 ; loadint
  %r167 = mul i32 %r166, %r165
  %r168 = add i32 %r163, %r167
  %r169 = load i32, ptr %r168
  %r170 = add i32 0, 4 ; loadint
  %r171 = add i32 0, 0 ; loadint
  %r172 = mul i32 %r171, %r170
  %r173 = add i32 %r112, %r172
  %r174 = add i32 0, 1 ; loadint
  %r175 = mul i32 %r170, %r174
  %r176 = add i32 0, 0 ; loadint
  %r177 = mul i32 %r176, %r175
  %r178 = add i32 %r173, %r177
  %r179 = add i32 0, 2 ; loadint
  %r180 = mul i32 %r175, %r179
  %r181 = add i32 0, 0 ; loadint
  %r182 = mul i32 %r181, %r180
  %r183 = add i32 %r178, %r182
  %r184 = load i32, ptr %r183
  %r185 = add i32 %r169, %r184
  %r186 = add i32 0, 4 ; loadint
  %r187 = add i32 0, 0 ; loadint
  %r188 = mul i32 %r187, %r186
  %r189 = add i32 %r112, %r188
  %r190 = add i32 0, 1 ; loadint
  %r191 = mul i32 %r186, %r190
  %r192 = add i32 0, 1 ; loadint
  %r193 = mul i32 %r192, %r191
  %r194 = add i32 %r189, %r193
  %r195 = add i32 0, 2 ; loadint
  %r196 = mul i32 %r191, %r195
  %r197 = add i32 0, 0 ; loadint
  %r198 = mul i32 %r197, %r196
  %r199 = add i32 %r194, %r198
  %r200 = load i32, ptr %r199
  %r201 = add i32 %r185, %r200
  %r202 = add i32 0, 4 ; loadint
  %r203 = add i32 0, 0 ; loadint
  %r204 = mul i32 %r203, %r202
  %r205 = add i32 %r78, %r204
  %r206 = add i32 0, 2 ; loadint
  %r207 = mul i32 %r202, %r206
  %r208 = add i32 0, 3 ; loadint
  %r209 = mul i32 %r208, %r207
  %r210 = add i32 %r205, %r209
  %r211 = load i32, ptr %r210
  %r212 = add i32 %r201, %r211
  ret i32 %r212

}
