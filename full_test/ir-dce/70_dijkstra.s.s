; module
@INF#0 = global const int 65535, 4
@e#0 = global int [16,16], 1024
@book#0 = global int [16], 64
@dis#0 = global int [16], 64
@n#0 = global int, 4
@m#0 = global int, 4
@v1#0 = global int, 4
@v2#0 = global int, 4
@w#0 = global int, 4
define i32 @main(){
B26:
  %r1 = alloca int, 4
  %r2 = call i32 @getint()
  %r3 = loadaddr @n#0
  store i32 %r2, ptr %r3
  %r4 = call i32 @getint()
  %r5 = loadaddr @m#0
  store i32 %r4, ptr %r5
  %r6 = add i32 0, 1 ; loadint
  store i32 %r6, ptr %r1
  br label %B27

B27:
  %r7 = load i32, ptr %r1
  %r8 = loadaddr @n#0
  %r9 = load i32, ptr %r8
  %r10 = icmp sle i32 %r7, %r9
  br i1 %r10, label %B28, label %B29

B28:
  %r11 = alloca int, 4
  %r12 = add i32 0, 1 ; loadint
  store i32 %r12, ptr %r11
  br label %B30

B29:
  %r51 = add i32 0, 1 ; loadint
  store i32 %r51, ptr %r1
  br label %B37

B30:
  %r13 = load i32, ptr %r11
  %r14 = loadaddr @n#0
  %r15 = load i32, ptr %r14
  %r16 = icmp sle i32 %r13, %r15
  br i1 %r16, label %B31, label %B32

B31:
  br label %B33

B32:
  %r48 = load i32, ptr %r1
  %r49 = add i32 0, 1 ; loadint
  %r50 = add i32 %r48, %r49
  store i32 %r50, ptr %r1
  br label %B27

B33:
  %r17 = load i32, ptr %r1
  %r18 = load i32, ptr %r11
  %r19 = icmp eq i32 %r17, %r18
  br i1 %r19, label %B34, label %B35

B34:
  %r20 = add i32 0, 0 ; loadint
  %r21 = loadaddr @e#0
  %r22 = loadaddr @e#0
  %r23 = add i32 0, 4 ; loadint
  %r24 = load i32, ptr %r11
  %r25 = mul i32 %r24, %r23
  %r26 = add i32 %r22, %r25
  %r27 = add i32 0, 16 ; loadint
  %r28 = mul i32 %r23, %r27
  %r29 = load i32, ptr %r1
  %r30 = mul i32 %r29, %r28
  %r31 = add i32 %r26, %r30
  store i32 %r20, ptr %r31
  br label %B36

B35:
  %r32 = loadaddr @INF#0
  %r33 = load i32, ptr %r32
  %r34 = loadaddr @e#0
  %r35 = loadaddr @e#0
  %r36 = add i32 0, 4 ; loadint
  %r37 = load i32, ptr %r11
  %r38 = mul i32 %r37, %r36
  %r39 = add i32 %r35, %r38
  %r40 = add i32 0, 16 ; loadint
  %r41 = mul i32 %r36, %r40
  %r42 = load i32, ptr %r1
  %r43 = mul i32 %r42, %r41
  %r44 = add i32 %r39, %r43
  store i32 %r33, ptr %r44
  br label %B36

B36:
  %r45 = load i32, ptr %r11
  %r46 = add i32 0, 1 ; loadint
  %r47 = add i32 %r45, %r46
  store i32 %r47, ptr %r11
  br label %B30

B37:
  %r52 = load i32, ptr %r1
  %r53 = loadaddr @m#0
  %r54 = load i32, ptr %r53
  %r55 = icmp sle i32 %r52, %r54
  br i1 %r55, label %B38, label %B39

B38:
  %r56 = alloca int, 4
  %r57 = call i32 @getint()
  store i32 %r57, ptr %r56
  %r58 = alloca int, 4
  %r59 = call i32 @getint()
  store i32 %r59, ptr %r58
  %r60 = call i32 @getint()
  %r61 = loadaddr @e#0
  %r62 = loadaddr @e#0
  %r63 = add i32 0, 4 ; loadint
  %r64 = load i32, ptr %r58
  %r65 = mul i32 %r64, %r63
  %r66 = add i32 %r62, %r65
  %r67 = add i32 0, 16 ; loadint
  %r68 = mul i32 %r63, %r67
  %r69 = load i32, ptr %r56
  %r70 = mul i32 %r69, %r68
  %r71 = add i32 %r66, %r70
  store i32 %r60, ptr %r71
  %r72 = load i32, ptr %r1
  %r73 = add i32 0, 1 ; loadint
  %r74 = add i32 %r72, %r73
  store i32 %r74, ptr %r1
  br label %B37

B39:
  %r75 = call@Dijkstra()
  %r76 = add i32 0, 1 ; loadint
  store i32 %r76, ptr %r1
  br label %B40

B40:
  %r77 = load i32, ptr %r1
  %r78 = loadaddr @n#0
  %r79 = load i32, ptr %r78
  %r80 = icmp sle i32 %r77, %r79
  br i1 %r80, label %B41, label %B42

B41:
  %r82 = loadaddr @dis#0
  %r83 = add i32 0, 4 ; loadint
  %r84 = load i32, ptr %r1
  %r85 = mul i32 %r84, %r83
  %r86 = add i32 %r82, %r85
  %r87 = load i32, ptr %r86
  %r81 = call i32 @putint(i32 %r87)
  %r89 = add i32 0, 32 ; loadint
  %r88 = call i32 @putch(i32 %r89)
  %r90 = load i32, ptr %r1
  %r91 = add i32 0, 1 ; loadint
  %r92 = add i32 %r90, %r91
  store i32 %r92, ptr %r1
  br label %B40

B42:
  %r94 = add i32 0, 10 ; loadint
  %r93 = call i32 @putch(i32 %r94)
  %r95 = add i32 0, 0 ; loadint
  ret i32 %r95

}
define void @Dijkstra(){
B0:
  %r1 = alloca int, 4
  %r2 = alloca int, 4
  %r3 = add i32 0, 1 ; loadint
  store i32 %r3, ptr %r1
  br label %B1

B1:
  %r4 = load i32, ptr %r1
  %r5 = loadaddr @n#0
  %r6 = load i32, ptr %r5
  %r7 = icmp sle i32 %r4, %r6
  br i1 %r7, label %B2, label %B3

B2:
  %r8 = loadaddr @e#0
  %r9 = add i32 0, 4 ; loadint
  %r10 = load i32, ptr %r1
  %r11 = mul i32 %r10, %r9
  %r12 = add i32 %r8, %r11
  %r13 = add i32 0, 16 ; loadint
  %r14 = mul i32 %r9, %r13
  %r15 = add i32 0, 1 ; loadint
  %r16 = mul i32 %r15, %r14
  %r17 = add i32 %r12, %r16
  %r18 = load i32, ptr %r17
  %r19 = loadaddr @dis#0
  %r20 = loadaddr @dis#0
  %r21 = add i32 0, 4 ; loadint
  %r22 = load i32, ptr %r1
  %r23 = mul i32 %r22, %r21
  %r24 = add i32 %r20, %r23
  store i32 %r18, ptr %r24
  %r25 = add i32 0, 0 ; loadint
  %r26 = loadaddr @book#0
  %r27 = loadaddr @book#0
  %r28 = add i32 0, 4 ; loadint
  %r29 = load i32, ptr %r1
  %r30 = mul i32 %r29, %r28
  %r31 = add i32 %r27, %r30
  store i32 %r25, ptr %r31
  %r32 = load i32, ptr %r1
  %r33 = add i32 0, 1 ; loadint
  %r34 = add i32 %r32, %r33
  store i32 %r34, ptr %r1
  br label %B1

B3:
  %r35 = add i32 0, 1 ; loadint
  %r36 = loadaddr @book#0
  %r37 = loadaddr @book#0
  %r38 = add i32 0, 4 ; loadint
  %r39 = add i32 0, 1 ; loadint
  %r40 = mul i32 %r39, %r38
  %r41 = add i32 %r37, %r40
  store i32 %r35, ptr %r41
  %r42 = add i32 0, 1 ; loadint
  store i32 %r42, ptr %r1
  br label %B4

B4:
  %r43 = load i32, ptr %r1
  %r44 = loadaddr @n#0
  %r45 = load i32, ptr %r44
  %r46 = add i32 0, 1 ; loadint
  %r47 = sub i32 %r45, %r46
  %r48 = icmp sle i32 %r43, %r47
  br i1 %r48, label %B5, label %B6

B5:
  %r49 = alloca int, 4
  %r50 = loadaddr @INF#0
  %r51 = load i32, ptr %r50
  store i32 %r51, ptr %r49
  %r52 = alloca int, 4
  %r53 = add i32 0, 0 ; loadint
  store i32 %r53, ptr %r52
  %r54 = alloca int, 4
  %r55 = add i32 0, 1 ; loadint
  store i32 %r55, ptr %r54
  br label %B7

B6:
  %r171 = add i32 0, 0 ; loadint
  ret i32 %r171

B7:
  %r56 = load i32, ptr %r54
  %r57 = loadaddr @n#0
  %r58 = load i32, ptr %r57
  %r59 = icmp sle i32 %r56, %r58
  br i1 %r59, label %B8, label %B9

B8:
  br label %B10

B9:
  %r89 = add i32 0, 1 ; loadint
  %r90 = loadaddr @book#0
  %r91 = loadaddr @book#0
  %r92 = add i32 0, 4 ; loadint
  %r93 = load i32, ptr %r52
  %r94 = mul i32 %r93, %r92
  %r95 = add i32 %r91, %r94
  store i32 %r89, ptr %r95
  %r96 = alloca int, 4
  %r97 = add i32 0, 1 ; loadint
  store i32 %r97, ptr %r96
  br label %B16

B10:
  %r60 = alloca int, 4
  %r61 = load i32, ptr %r49
  %r62 = loadaddr @dis#0
  %r63 = add i32 0, 4 ; loadint
  %r64 = load i32, ptr %r54
  %r65 = mul i32 %r64, %r63
  %r66 = add i32 %r62, %r65
  %r67 = load i32, ptr %r66
  %r68 = icmp sgt i32 %r61, %r67
  br i1 %r68, label %B11, label %B12

B11:
  %r69 = loadaddr @book#0
  %r70 = add i32 0, 4 ; loadint
  %r71 = load i32, ptr %r54
  %r72 = mul i32 %r71, %r70
  %r73 = add i32 %r69, %r72
  %r74 = load i32, ptr %r73
  %r75 = add i32 0, 0 ; loadint
  %r76 = icmp eq i32 %r74, %r75
  store i32 %r76, ptr %r60
  br label %B13

B12:
  %r77 = add i32 0, 0 ; loadint
  store i32 %r77, ptr %r60
  br label %B13

B13:
  %r78 = load i32, ptr %r60
  br i1 %r78, label %B14, label %B15

B14:
  %r79 = loadaddr @dis#0
  %r80 = add i32 0, 4 ; loadint
  %r81 = load i32, ptr %r54
  %r82 = mul i32 %r81, %r80
  %r83 = add i32 %r79, %r82
  %r84 = load i32, ptr %r83
  store i32 %r84, ptr %r49
  %r85 = load i32, ptr %r54
  store i32 %r85, ptr %r52
  br label %B15

B15:
  %r86 = load i32, ptr %r54
  %r87 = add i32 0, 1 ; loadint
  %r88 = add i32 %r86, %r87
  store i32 %r88, ptr %r54
  br label %B7

B16:
  %r98 = load i32, ptr %r96
  %r99 = loadaddr @n#0
  %r100 = load i32, ptr %r99
  %r101 = icmp sle i32 %r98, %r100
  br i1 %r101, label %B17, label %B18

B17:
  br label %B19

B18:
  %r168 = load i32, ptr %r1
  %r169 = add i32 0, 1 ; loadint
  %r170 = add i32 %r168, %r169
  store i32 %r170, ptr %r1
  br label %B4

B19:
  %r102 = loadaddr @e#0
  %r103 = add i32 0, 4 ; loadint
  %r104 = load i32, ptr %r96
  %r105 = mul i32 %r104, %r103
  %r106 = add i32 %r102, %r105
  %r107 = add i32 0, 16 ; loadint
  %r108 = mul i32 %r103, %r107
  %r109 = load i32, ptr %r52
  %r110 = mul i32 %r109, %r108
  %r111 = add i32 %r106, %r110
  %r112 = load i32, ptr %r111
  %r113 = loadaddr @INF#0
  %r114 = load i32, ptr %r113
  %r115 = icmp slt i32 %r112, %r114
  br i1 %r115, label %B20, label %B21

B20:
  br label %B22

B21:
  %r165 = load i32, ptr %r96
  %r166 = add i32 0, 1 ; loadint
  %r167 = add i32 %r165, %r166
  store i32 %r167, ptr %r96
  br label %B16

B22:
  %r116 = loadaddr @dis#0
  %r117 = add i32 0, 4 ; loadint
  %r118 = load i32, ptr %r96
  %r119 = mul i32 %r118, %r117
  %r120 = add i32 %r116, %r119
  %r121 = load i32, ptr %r120
  %r122 = loadaddr @dis#0
  %r123 = add i32 0, 4 ; loadint
  %r124 = load i32, ptr %r52
  %r125 = mul i32 %r124, %r123
  %r126 = add i32 %r122, %r125
  %r127 = load i32, ptr %r126
  %r128 = loadaddr @e#0
  %r129 = add i32 0, 4 ; loadint
  %r130 = load i32, ptr %r96
  %r131 = mul i32 %r130, %r129
  %r132 = add i32 %r128, %r131
  %r133 = add i32 0, 16 ; loadint
  %r134 = mul i32 %r129, %r133
  %r135 = load i32, ptr %r52
  %r136 = mul i32 %r135, %r134
  %r137 = add i32 %r132, %r136
  %r138 = load i32, ptr %r137
  %r139 = add i32 %r127, %r138
  %r140 = icmp sgt i32 %r121, %r139
  br i1 %r140, label %B23, label %B24

B23:
  %r141 = loadaddr @dis#0
  %r142 = add i32 0, 4 ; loadint
  %r143 = load i32, ptr %r52
  %r144 = mul i32 %r143, %r142
  %r145 = add i32 %r141, %r144
  %r146 = load i32, ptr %r145
  %r147 = loadaddr @e#0
  %r148 = add i32 0, 4 ; loadint
  %r149 = load i32, ptr %r96
  %r150 = mul i32 %r149, %r148
  %r151 = add i32 %r147, %r150
  %r152 = add i32 0, 16 ; loadint
  %r153 = mul i32 %r148, %r152
  %r154 = load i32, ptr %r52
  %r155 = mul i32 %r154, %r153
  %r156 = add i32 %r151, %r155
  %r157 = load i32, ptr %r156
  %r158 = add i32 %r146, %r157
  %r159 = loadaddr @dis#0
  %r160 = loadaddr @dis#0
  %r161 = add i32 0, 4 ; loadint
  %r162 = load i32, ptr %r96
  %r163 = mul i32 %r162, %r161
  %r164 = add i32 %r160, %r163
  store i32 %r158, ptr %r164
  br label %B24

B24:
  br label %B21

}
