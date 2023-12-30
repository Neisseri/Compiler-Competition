; module
@buf#0 = global int [2,100], 800
define i32 @main(){
B24:
  %r3 = loadaddr @buf#0
  %r4 = add i32 0, 4 ; loadint
  %r5 = add i32 0, 100 ; loadint
  %r6 = mul i32 %r4, %r5
  %r7 = add i32 0, 0 ; loadint
  %r8 = mul i32 %r7, %r6
  %r9 = add i32 %r3, %r8
  %r2 = call i32 @getarray(i32 %r9)
  %r11 = add i32 0, 0 ; loadint
  %r10 = call i32 @merge_sort(i32 %r11, i32 %r2)
  %r15 = loadaddr @buf#0
  %r16 = add i32 0, 4 ; loadint
  %r17 = add i32 0, 100 ; loadint
  %r18 = mul i32 %r16, %r17
  %r19 = add i32 0, 0 ; loadint
  %r20 = mul i32 %r19, %r18
  %r21 = add i32 %r15, %r20
  %r13 = call i32 @putarray(i32 %r2, i32 %r21)
  %r22 = add i32 0, 0 ; loadint
  ret i32 %r22

}
define void @merge_sort(i32, i32){
B0:
  br label %B1

B1:
  %r6 = add i32 0, 1 ; loadint
  %r7 = add i32 %r1, %r6
  %r9 = icmp sge i32 %r7, %r2
  br i1 %r9, label %B2, label %B3

B2:
  %r10 = add i32 0, 0 ; loadint
  ret i32 %r10

B3:
  %r14 = add i32 %r1, %r2
  %r15 = add i32 0, 2 ; loadint
  %r16 = sdiv i32 %r14, %r15
  %r17 = call i32 @merge_sort(i32 %r1, i32 %r16)
  %r20 = call i32 @merge_sort(i32 %r16, i32 %r2)
  br label %B5

B5:
  %r210 = phi i32 [ %r1, %B3 ], [ %r113, %B14 ]
  %r208 = phi i32 [ %r16, %B3 ], [ %r207, %B14 ]
  %r205 = phi i32 [ %r1, %B3 ], [ %r204, %B14 ]
  %r215 = add i32 0, %r214 ; assign
  %r32 = icmp slt i32 %r210, %r208
  br i1 %r32, label %B8, label %B9

B6:
  br label %B11

B7:
  br label %B15

B8:
  %r35 = icmp slt i32 %r208, %r2
  br label %B10

B9:
  %r36 = add i32 0, 0 ; loadint
  br label %B10

B10:
  %r214 = phi i32 [ %r35, %B8 ], [ %r36, %B9 ]
  br i1 %r214, label %B6, label %B7

B11:
  %r38 = loadaddr @buf#0
  %r39 = add i32 0, 4 ; loadint
  %r41 = mul i32 %r205, %r39
  %r42 = add i32 %r38, %r41
  %r43 = add i32 0, 100 ; loadint
  %r44 = mul i32 %r39, %r43
  %r45 = add i32 0, 0 ; loadint
  %r46 = mul i32 %r45, %r44
  %r47 = add i32 %r42, %r46
  %r48 = load i32, ptr %r47
  %r49 = loadaddr @buf#0
  %r50 = add i32 0, 4 ; loadint
  %r52 = mul i32 %r208, %r50
  %r53 = add i32 %r49, %r52
  %r54 = add i32 0, 100 ; loadint
  %r55 = mul i32 %r50, %r54
  %r56 = add i32 0, 0 ; loadint
  %r57 = mul i32 %r56, %r55
  %r58 = add i32 %r53, %r57
  %r59 = load i32, ptr %r58
  %r60 = icmp slt i32 %r48, %r59
  br i1 %r60, label %B12, label %B13

B12:
  %r61 = loadaddr @buf#0
  %r62 = add i32 0, 4 ; loadint
  %r64 = mul i32 %r205, %r62
  %r65 = add i32 %r61, %r64
  %r66 = add i32 0, 100 ; loadint
  %r67 = mul i32 %r62, %r66
  %r68 = add i32 0, 0 ; loadint
  %r69 = mul i32 %r68, %r67
  %r70 = add i32 %r65, %r69
  %r71 = load i32, ptr %r70
  %r72 = loadaddr @buf#0
  %r73 = loadaddr @buf#0
  %r74 = add i32 0, 4 ; loadint
  %r76 = mul i32 %r210, %r74
  %r77 = add i32 %r73, %r76
  %r78 = add i32 0, 100 ; loadint
  %r79 = mul i32 %r74, %r78
  %r80 = add i32 0, 1 ; loadint
  %r81 = mul i32 %r80, %r79
  %r82 = add i32 %r77, %r81
  store i32 %r71, ptr %r82
  %r84 = add i32 0, 1 ; loadint
  %r85 = add i32 %r205, %r84
  br label %B14

B13:
  %r86 = loadaddr @buf#0
  %r87 = add i32 0, 4 ; loadint
  %r89 = mul i32 %r208, %r87
  %r90 = add i32 %r86, %r89
  %r91 = add i32 0, 100 ; loadint
  %r92 = mul i32 %r87, %r91
  %r93 = add i32 0, 0 ; loadint
  %r94 = mul i32 %r93, %r92
  %r95 = add i32 %r90, %r94
  %r96 = load i32, ptr %r95
  %r97 = loadaddr @buf#0
  %r98 = loadaddr @buf#0
  %r99 = add i32 0, 4 ; loadint
  %r101 = mul i32 %r210, %r99
  %r102 = add i32 %r98, %r101
  %r103 = add i32 0, 100 ; loadint
  %r104 = mul i32 %r99, %r103
  %r105 = add i32 0, 1 ; loadint
  %r106 = mul i32 %r105, %r104
  %r107 = add i32 %r102, %r106
  store i32 %r96, ptr %r107
  %r109 = add i32 0, 1 ; loadint
  %r110 = add i32 %r208, %r109
  br label %B14

B14:
  %r207 = phi i32 [ %r208, %B12 ], [ %r110, %B13 ]
  %r204 = phi i32 [ %r85, %B12 ], [ %r205, %B13 ]
  %r112 = add i32 0, 1 ; loadint
  %r113 = add i32 %r210, %r112
  br label %B5

B15:
  %r211 = phi i32 [ %r210, %B7 ], [ %r144, %B16 ]
  %r206 = phi i32 [ %r205, %B7 ], [ %r141, %B16 ]
  %r116 = icmp slt i32 %r206, %r16
  br i1 %r116, label %B16, label %B17

B16:
  %r117 = loadaddr @buf#0
  %r118 = add i32 0, 4 ; loadint
  %r120 = mul i32 %r206, %r118
  %r121 = add i32 %r117, %r120
  %r122 = add i32 0, 100 ; loadint
  %r123 = mul i32 %r118, %r122
  %r124 = add i32 0, 0 ; loadint
  %r125 = mul i32 %r124, %r123
  %r126 = add i32 %r121, %r125
  %r127 = load i32, ptr %r126
  %r128 = loadaddr @buf#0
  %r129 = loadaddr @buf#0
  %r130 = add i32 0, 4 ; loadint
  %r132 = mul i32 %r211, %r130
  %r133 = add i32 %r129, %r132
  %r134 = add i32 0, 100 ; loadint
  %r135 = mul i32 %r130, %r134
  %r136 = add i32 0, 1 ; loadint
  %r137 = mul i32 %r136, %r135
  %r138 = add i32 %r133, %r137
  store i32 %r127, ptr %r138
  %r140 = add i32 0, 1 ; loadint
  %r141 = add i32 %r206, %r140
  %r143 = add i32 0, 1 ; loadint
  %r144 = add i32 %r211, %r143
  br label %B15

B17:
  br label %B18

B18:
  %r212 = phi i32 [ %r211, %B17 ], [ %r175, %B19 ]
  %r209 = phi i32 [ %r208, %B17 ], [ %r172, %B19 ]
  %r147 = icmp slt i32 %r209, %r2
  br i1 %r147, label %B19, label %B20

B19:
  %r148 = loadaddr @buf#0
  %r149 = add i32 0, 4 ; loadint
  %r151 = mul i32 %r209, %r149
  %r152 = add i32 %r148, %r151
  %r153 = add i32 0, 100 ; loadint
  %r154 = mul i32 %r149, %r153
  %r155 = add i32 0, 0 ; loadint
  %r156 = mul i32 %r155, %r154
  %r157 = add i32 %r152, %r156
  %r158 = load i32, ptr %r157
  %r159 = loadaddr @buf#0
  %r160 = loadaddr @buf#0
  %r161 = add i32 0, 4 ; loadint
  %r163 = mul i32 %r212, %r161
  %r164 = add i32 %r160, %r163
  %r165 = add i32 0, 100 ; loadint
  %r166 = mul i32 %r161, %r165
  %r167 = add i32 0, 1 ; loadint
  %r168 = mul i32 %r167, %r166
  %r169 = add i32 %r164, %r168
  store i32 %r158, ptr %r169
  %r171 = add i32 0, 1 ; loadint
  %r172 = add i32 %r209, %r171
  %r174 = add i32 0, 1 ; loadint
  %r175 = add i32 %r212, %r174
  br label %B18

B20:
  br label %B21

B21:
  %r213 = phi i32 [ %r1, %B20 ], [ %r203, %B22 ]
  %r178 = icmp slt i32 %r213, %r2
  br i1 %r178, label %B22, label %B23

B22:
  %r179 = loadaddr @buf#0
  %r180 = add i32 0, 4 ; loadint
  %r182 = mul i32 %r213, %r180
  %r183 = add i32 %r179, %r182
  %r184 = add i32 0, 100 ; loadint
  %r185 = mul i32 %r180, %r184
  %r186 = add i32 0, 1 ; loadint
  %r187 = mul i32 %r186, %r185
  %r188 = add i32 %r183, %r187
  %r189 = load i32, ptr %r188
  %r190 = loadaddr @buf#0
  %r191 = loadaddr @buf#0
  %r192 = add i32 0, 4 ; loadint
  %r194 = mul i32 %r213, %r192
  %r195 = add i32 %r191, %r194
  %r196 = add i32 0, 100 ; loadint
  %r197 = mul i32 %r192, %r196
  %r198 = add i32 0, 0 ; loadint
  %r199 = mul i32 %r198, %r197
  %r200 = add i32 %r195, %r199
  store i32 %r189, ptr %r200
  %r202 = add i32 0, 1 ; loadint
  %r203 = add i32 %r213, %r202
  br label %B21

B23:

}
