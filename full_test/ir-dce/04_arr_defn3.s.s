; module
define i32 @main(){
B0:
  %r1 = alloca int [4,2], 32
  %r2 = add i32 0, 0 ; loadint
  %r4 = add i32 0, 0 ; loadint
  %r3 = add i32 %r1, %r4
  store i32 %r2, ptr %r3
  %r5 = add i32 0, 0 ; loadint
  %r7 = add i32 0, 4 ; loadint
  %r6 = add i32 %r1, %r7
  store i32 %r5, ptr %r6
  %r8 = add i32 0, 0 ; loadint
  %r10 = add i32 0, 8 ; loadint
  %r9 = add i32 %r1, %r10
  store i32 %r8, ptr %r9
  %r11 = add i32 0, 0 ; loadint
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
  %r20 = add i32 0, 0 ; loadint
  %r22 = add i32 0, 24 ; loadint
  %r21 = add i32 %r1, %r22
  store i32 %r20, ptr %r21
  %r23 = add i32 0, 0 ; loadint
  %r25 = add i32 0, 28 ; loadint
  %r24 = add i32 %r1, %r25
  store i32 %r23, ptr %r24
  %r26 = alloca int [4,2], 32
  %r27 = add i32 0, 1 ; loadint
  %r29 = add i32 0, 0 ; loadint
  %r28 = add i32 %r26, %r29
  store i32 %r27, ptr %r28
  %r30 = add i32 0, 2 ; loadint
  %r32 = add i32 0, 4 ; loadint
  %r31 = add i32 %r26, %r32
  store i32 %r30, ptr %r31
  %r33 = add i32 0, 3 ; loadint
  %r35 = add i32 0, 8 ; loadint
  %r34 = add i32 %r26, %r35
  store i32 %r33, ptr %r34
  %r36 = add i32 0, 4 ; loadint
  %r38 = add i32 0, 12 ; loadint
  %r37 = add i32 %r26, %r38
  store i32 %r36, ptr %r37
  %r39 = add i32 0, 5 ; loadint
  %r41 = add i32 0, 16 ; loadint
  %r40 = add i32 %r26, %r41
  store i32 %r39, ptr %r40
  %r42 = add i32 0, 6 ; loadint
  %r44 = add i32 0, 20 ; loadint
  %r43 = add i32 %r26, %r44
  store i32 %r42, ptr %r43
  %r45 = add i32 0, 7 ; loadint
  %r47 = add i32 0, 24 ; loadint
  %r46 = add i32 %r26, %r47
  store i32 %r45, ptr %r46
  %r48 = add i32 0, 8 ; loadint
  %r50 = add i32 0, 28 ; loadint
  %r49 = add i32 %r26, %r50
  store i32 %r48, ptr %r49
  %r51 = alloca int [4,2], 32
  %r52 = add i32 0, 1 ; loadint
  %r54 = add i32 0, 0 ; loadint
  %r53 = add i32 %r51, %r54
  store i32 %r52, ptr %r53
  %r55 = add i32 0, 2 ; loadint
  %r57 = add i32 0, 4 ; loadint
  %r56 = add i32 %r51, %r57
  store i32 %r55, ptr %r56
  %r58 = add i32 0, 3 ; loadint
  %r60 = add i32 0, 8 ; loadint
  %r59 = add i32 %r51, %r60
  store i32 %r58, ptr %r59
  %r61 = add i32 0, 4 ; loadint
  %r63 = add i32 0, 12 ; loadint
  %r62 = add i32 %r51, %r63
  store i32 %r61, ptr %r62
  %r64 = add i32 0, 5 ; loadint
  %r66 = add i32 0, 16 ; loadint
  %r65 = add i32 %r51, %r66
  store i32 %r64, ptr %r65
  %r67 = add i32 0, 6 ; loadint
  %r69 = add i32 0, 20 ; loadint
  %r68 = add i32 %r51, %r69
  store i32 %r67, ptr %r68
  %r70 = add i32 0, 7 ; loadint
  %r72 = add i32 0, 24 ; loadint
  %r71 = add i32 %r51, %r72
  store i32 %r70, ptr %r71
  %r73 = add i32 0, 8 ; loadint
  %r75 = add i32 0, 28 ; loadint
  %r74 = add i32 %r51, %r75
  store i32 %r73, ptr %r74
  %r76 = alloca int [4,2], 32
  %r77 = add i32 0, 1 ; loadint
  %r79 = add i32 0, 0 ; loadint
  %r78 = add i32 %r76, %r79
  store i32 %r77, ptr %r78
  %r80 = add i32 0, 2 ; loadint
  %r82 = add i32 0, 4 ; loadint
  %r81 = add i32 %r76, %r82
  store i32 %r80, ptr %r81
  %r83 = add i32 0, 3 ; loadint
  %r85 = add i32 0, 8 ; loadint
  %r84 = add i32 %r76, %r85
  store i32 %r83, ptr %r84
  %r86 = add i32 0, 0 ; loadint
  %r88 = add i32 0, 12 ; loadint
  %r87 = add i32 %r76, %r88
  store i32 %r86, ptr %r87
  %r89 = add i32 0, 5 ; loadint
  %r91 = add i32 0, 16 ; loadint
  %r90 = add i32 %r76, %r91
  store i32 %r89, ptr %r90
  %r92 = add i32 0, 0 ; loadint
  %r94 = add i32 0, 20 ; loadint
  %r93 = add i32 %r76, %r94
  store i32 %r92, ptr %r93
  %r95 = add i32 0, 7 ; loadint
  %r97 = add i32 0, 24 ; loadint
  %r96 = add i32 %r76, %r97
  store i32 %r95, ptr %r96
  %r98 = add i32 0, 8 ; loadint
  %r100 = add i32 0, 28 ; loadint
  %r99 = add i32 %r76, %r100
  store i32 %r98, ptr %r99
  %r101 = alloca int [4,2], 32
  %r102 = add i32 0, 4 ; loadint
  %r103 = add i32 0, 1 ; loadint
  %r104 = mul i32 %r103, %r102
  %r105 = add i32 %r76, %r104
  %r106 = add i32 0, 2 ; loadint
  %r107 = mul i32 %r102, %r106
  %r108 = add i32 0, 2 ; loadint
  %r109 = mul i32 %r108, %r107
  %r110 = add i32 %r105, %r109
  %r111 = load i32, ptr %r110
  %r113 = add i32 0, 0 ; loadint
  %r112 = add i32 %r101, %r113
  store i32 %r111, ptr %r112
  %r114 = add i32 0, 4 ; loadint
  %r115 = add i32 0, 1 ; loadint
  %r116 = mul i32 %r115, %r114
  %r117 = add i32 %r51, %r116
  %r118 = add i32 0, 2 ; loadint
  %r119 = mul i32 %r114, %r118
  %r120 = add i32 0, 2 ; loadint
  %r121 = mul i32 %r120, %r119
  %r122 = add i32 %r117, %r121
  %r123 = load i32, ptr %r122
  %r125 = add i32 0, 4 ; loadint
  %r124 = add i32 %r101, %r125
  store i32 %r123, ptr %r124
  %r126 = add i32 0, 3 ; loadint
  %r128 = add i32 0, 8 ; loadint
  %r127 = add i32 %r101, %r128
  store i32 %r126, ptr %r127
  %r129 = add i32 0, 4 ; loadint
  %r131 = add i32 0, 12 ; loadint
  %r130 = add i32 %r101, %r131
  store i32 %r129, ptr %r130
  %r132 = add i32 0, 5 ; loadint
  %r134 = add i32 0, 16 ; loadint
  %r133 = add i32 %r101, %r134
  store i32 %r132, ptr %r133
  %r135 = add i32 0, 6 ; loadint
  %r137 = add i32 0, 20 ; loadint
  %r136 = add i32 %r101, %r137
  store i32 %r135, ptr %r136
  %r138 = add i32 0, 7 ; loadint
  %r140 = add i32 0, 24 ; loadint
  %r139 = add i32 %r101, %r140
  store i32 %r138, ptr %r139
  %r141 = add i32 0, 8 ; loadint
  %r143 = add i32 0, 28 ; loadint
  %r142 = add i32 %r101, %r143
  store i32 %r141, ptr %r142
  %r144 = add i32 0, 4 ; loadint
  %r145 = add i32 0, 1 ; loadint
  %r146 = mul i32 %r145, %r144
  %r147 = add i32 %r101, %r146
  %r148 = add i32 0, 2 ; loadint
  %r149 = mul i32 %r144, %r148
  %r150 = add i32 0, 3 ; loadint
  %r151 = mul i32 %r150, %r149
  %r152 = add i32 %r147, %r151
  %r153 = load i32, ptr %r152
  %r154 = add i32 0, 4 ; loadint
  %r155 = add i32 0, 0 ; loadint
  %r156 = mul i32 %r155, %r154
  %r157 = add i32 %r101, %r156
  %r158 = add i32 0, 2 ; loadint
  %r159 = mul i32 %r154, %r158
  %r160 = add i32 0, 0 ; loadint
  %r161 = mul i32 %r160, %r159
  %r162 = add i32 %r157, %r161
  %r163 = load i32, ptr %r162
  %r164 = add i32 %r153, %r163
  %r165 = add i32 0, 4 ; loadint
  %r166 = add i32 0, 1 ; loadint
  %r167 = mul i32 %r166, %r165
  %r168 = add i32 %r101, %r167
  %r169 = add i32 0, 2 ; loadint
  %r170 = mul i32 %r165, %r169
  %r171 = add i32 0, 0 ; loadint
  %r172 = mul i32 %r171, %r170
  %r173 = add i32 %r168, %r172
  %r174 = load i32, ptr %r173
  %r175 = add i32 %r164, %r174
  %r176 = add i32 0, 4 ; loadint
  %r177 = add i32 0, 0 ; loadint
  %r178 = mul i32 %r177, %r176
  %r179 = add i32 %r1, %r178
  %r180 = add i32 0, 2 ; loadint
  %r181 = mul i32 %r176, %r180
  %r182 = add i32 0, 2 ; loadint
  %r183 = mul i32 %r182, %r181
  %r184 = add i32 %r179, %r183
  %r185 = load i32, ptr %r184
  %r186 = add i32 %r175, %r185
  ret i32 %r186

}
