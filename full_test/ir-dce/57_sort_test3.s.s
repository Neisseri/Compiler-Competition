; module
@n#0 = global int, 4
define i32 @main(){
B26:
  %r1 = add i32 0, 10 ; loadint
  %r2 = loadaddr @n#0
  store i32 %r1, ptr %r2
  %r3 = alloca int [10], 40
  %r4 = add i32 0, 4 ; loadint
  %r5 = add i32 0, 4 ; loadint
  %r6 = add i32 0, 0 ; loadint
  %r7 = mul i32 %r6, %r5
  %r8 = add i32 %r3, %r7
  store i32 %r4, ptr %r8
  %r9 = add i32 0, 3 ; loadint
  %r10 = add i32 0, 4 ; loadint
  %r11 = add i32 0, 1 ; loadint
  %r12 = mul i32 %r11, %r10
  %r13 = add i32 %r3, %r12
  store i32 %r9, ptr %r13
  %r14 = add i32 0, 9 ; loadint
  %r15 = add i32 0, 4 ; loadint
  %r16 = add i32 0, 2 ; loadint
  %r17 = mul i32 %r16, %r15
  %r18 = add i32 %r3, %r17
  store i32 %r14, ptr %r18
  %r19 = add i32 0, 2 ; loadint
  %r20 = add i32 0, 4 ; loadint
  %r21 = add i32 0, 3 ; loadint
  %r22 = mul i32 %r21, %r20
  %r23 = add i32 %r3, %r22
  store i32 %r19, ptr %r23
  %r24 = add i32 0, 0 ; loadint
  %r25 = add i32 0, 4 ; loadint
  %r26 = add i32 0, 4 ; loadint
  %r27 = mul i32 %r26, %r25
  %r28 = add i32 %r3, %r27
  store i32 %r24, ptr %r28
  %r29 = add i32 0, 1 ; loadint
  %r30 = add i32 0, 4 ; loadint
  %r31 = add i32 0, 5 ; loadint
  %r32 = mul i32 %r31, %r30
  %r33 = add i32 %r3, %r32
  store i32 %r29, ptr %r33
  %r34 = add i32 0, 6 ; loadint
  %r35 = add i32 0, 4 ; loadint
  %r36 = add i32 0, 6 ; loadint
  %r37 = mul i32 %r36, %r35
  %r38 = add i32 %r3, %r37
  store i32 %r34, ptr %r38
  %r39 = add i32 0, 5 ; loadint
  %r40 = add i32 0, 4 ; loadint
  %r41 = add i32 0, 7 ; loadint
  %r42 = mul i32 %r41, %r40
  %r43 = add i32 %r3, %r42
  store i32 %r39, ptr %r43
  %r44 = add i32 0, 7 ; loadint
  %r45 = add i32 0, 4 ; loadint
  %r46 = add i32 0, 8 ; loadint
  %r47 = mul i32 %r46, %r45
  %r48 = add i32 %r3, %r47
  store i32 %r44, ptr %r48
  %r49 = add i32 0, 8 ; loadint
  %r50 = add i32 0, 4 ; loadint
  %r51 = add i32 0, 9 ; loadint
  %r52 = mul i32 %r51, %r50
  %r53 = add i32 %r3, %r52
  store i32 %r49, ptr %r53
  %r54 = alloca int, 4
  %r55 = add i32 0, 0 ; loadint
  store i32 %r55, ptr %r54
  %r56 = alloca int, 4
  %r57 = add i32 0, 9 ; loadint
  store i32 %r57, ptr %r56
  %r59 = load i32, ptr %r54
  %r60 = load i32, ptr %r56
  %r58 = call i32 @QuickSort(i32 %r3, i32 %r59, i32 %r60)
  store i32 %r58, ptr %r54
  br label %B27

B27:
  %r61 = load i32, ptr %r54
  %r62 = loadaddr @n#0
  %r63 = load i32, ptr %r62
  %r64 = icmp slt i32 %r61, %r63
  br i1 %r64, label %B28, label %B29

B28:
  %r65 = alloca int, 4
  %r66 = add i32 0, 4 ; loadint
  %r67 = load i32, ptr %r54
  %r68 = mul i32 %r67, %r66
  %r69 = add i32 %r3, %r68
  %r70 = load i32, ptr %r69
  store i32 %r70, ptr %r65
  %r72 = load i32, ptr %r65
  %r71 = call i32 @putint(i32 %r72)
  %r73 = add i32 0, 10 ; loadint
  store i32 %r73, ptr %r65
  %r75 = load i32, ptr %r65
  %r74 = call i32 @putch(i32 %r75)
  %r76 = load i32, ptr %r54
  %r77 = add i32 0, 1 ; loadint
  %r78 = add i32 %r76, %r77
  store i32 %r78, ptr %r54
  br label %B27

B29:
  %r79 = add i32 0, 0 ; loadint
  ret i32 %r79

}
define i32 @QuickSort(i32, i32, i32){
B0:
  %r4 = alloca int, 4
  store i32 %r2, ptr %r4
  %r5 = alloca int, 4
  store i32 %r3, ptr %r5
  br label %B1

B1:
  %r6 = load i32, ptr %r4
  %r7 = load i32, ptr %r5
  %r8 = icmp slt i32 %r6, %r7
  br i1 %r8, label %B2, label %B3

B2:
  %r9 = alloca int, 4
  %r10 = load i32, ptr %r4
  store i32 %r10, ptr %r9
  %r11 = alloca int, 4
  %r12 = load i32, ptr %r5
  store i32 %r12, ptr %r11
  %r13 = alloca int, 4
  %r14 = add i32 0, 4 ; loadint
  %r15 = load i32, ptr %r4
  %r16 = mul i32 %r15, %r14
  %r17 = add i32 %r1, %r16
  %r18 = load i32, ptr %r17
  store i32 %r18, ptr %r13
  br label %B4

B3:
  %r104 = add i32 0, 0 ; loadint
  ret i32 %r104

B4:
  %r19 = load i32, ptr %r9
  %r20 = load i32, ptr %r11
  %r21 = icmp slt i32 %r19, %r20
  br i1 %r21, label %B5, label %B6

B5:
  br label %B7

B6:
  %r86 = load i32, ptr %r13
  %r87 = add i32 0, 4 ; loadint
  %r88 = load i32, ptr %r9
  %r89 = mul i32 %r88, %r87
  %r90 = add i32 %r1, %r89
  store i32 %r86, ptr %r90
  %r91 = alloca int, 4
  %r92 = load i32, ptr %r9
  %r93 = add i32 0, 1 ; loadint
  %r94 = sub i32 %r92, %r93
  store i32 %r94, ptr %r91
  %r96 = load i32, ptr %r4
  %r97 = load i32, ptr %r91
  %r95 = call i32 @QuickSort(i32 %r1, i32 %r96, i32 %r97)
  store i32 %r95, ptr %r91
  %r98 = load i32, ptr %r9
  %r99 = add i32 0, 1 ; loadint
  %r100 = add i32 %r98, %r99
  store i32 %r100, ptr %r91
  %r102 = load i32, ptr %r91
  %r103 = load i32, ptr %r5
  %r101 = call i32 @QuickSort(i32 %r1, i32 %r102, i32 %r103)
  store i32 %r101, ptr %r91
  br label %B3

B7:
  %r22 = alloca int, 4
  %r23 = load i32, ptr %r9
  %r24 = load i32, ptr %r11
  %r25 = icmp slt i32 %r23, %r24
  br i1 %r25, label %B10, label %B11

B8:
  %r37 = load i32, ptr %r11
  %r38 = add i32 0, 1 ; loadint
  %r39 = sub i32 %r37, %r38
  store i32 %r39, ptr %r11
  br label %B7

B9:
  br label %B13

B10:
  %r26 = add i32 0, 4 ; loadint
  %r27 = load i32, ptr %r11
  %r28 = mul i32 %r27, %r26
  %r29 = add i32 %r1, %r28
  %r30 = load i32, ptr %r29
  %r31 = load i32, ptr %r13
  %r32 = add i32 0, 1 ; loadint
  %r33 = sub i32 %r31, %r32
  %r34 = icmp sgt i32 %r30, %r33
  store i32 %r34, ptr %r22
  br label %B12

B11:
  %r35 = add i32 0, 0 ; loadint
  store i32 %r35, ptr %r22
  br label %B12

B12:
  %r36 = load i32, ptr %r22
  br i1 %r36, label %B8, label %B9

B13:
  %r40 = load i32, ptr %r9
  %r41 = load i32, ptr %r11
  %r42 = icmp slt i32 %r40, %r41
  br i1 %r42, label %B14, label %B15

B14:
  %r43 = add i32 0, 4 ; loadint
  %r44 = load i32, ptr %r11
  %r45 = mul i32 %r44, %r43
  %r46 = add i32 %r1, %r45
  %r47 = load i32, ptr %r46
  %r48 = add i32 0, 4 ; loadint
  %r49 = load i32, ptr %r9
  %r50 = mul i32 %r49, %r48
  %r51 = add i32 %r1, %r50
  store i32 %r47, ptr %r51
  %r52 = load i32, ptr %r9
  %r53 = add i32 0, 1 ; loadint
  %r54 = add i32 %r52, %r53
  store i32 %r54, ptr %r9
  br label %B15

B15:
  br label %B16

B16:
  %r55 = alloca int, 4
  %r56 = load i32, ptr %r9
  %r57 = load i32, ptr %r11
  %r58 = icmp slt i32 %r56, %r57
  br i1 %r58, label %B19, label %B20

B17:
  %r68 = load i32, ptr %r9
  %r69 = add i32 0, 1 ; loadint
  %r70 = add i32 %r68, %r69
  store i32 %r70, ptr %r9
  br label %B16

B18:
  br label %B22

B19:
  %r59 = add i32 0, 4 ; loadint
  %r60 = load i32, ptr %r9
  %r61 = mul i32 %r60, %r59
  %r62 = add i32 %r1, %r61
  %r63 = load i32, ptr %r62
  %r64 = load i32, ptr %r13
  %r65 = icmp slt i32 %r63, %r64
  store i32 %r65, ptr %r55
  br label %B21

B20:
  %r66 = add i32 0, 0 ; loadint
  store i32 %r66, ptr %r55
  br label %B21

B21:
  %r67 = load i32, ptr %r55
  br i1 %r67, label %B17, label %B18

B22:
  %r71 = load i32, ptr %r9
  %r72 = load i32, ptr %r11
  %r73 = icmp slt i32 %r71, %r72
  br i1 %r73, label %B23, label %B24

B23:
  %r74 = add i32 0, 4 ; loadint
  %r75 = load i32, ptr %r9
  %r76 = mul i32 %r75, %r74
  %r77 = add i32 %r1, %r76
  %r78 = load i32, ptr %r77
  %r79 = add i32 0, 4 ; loadint
  %r80 = load i32, ptr %r11
  %r81 = mul i32 %r80, %r79
  %r82 = add i32 %r1, %r81
  store i32 %r78, ptr %r82
  %r83 = load i32, ptr %r11
  %r84 = add i32 0, 1 ; loadint
  %r85 = sub i32 %r83, %r84
  store i32 %r85, ptr %r11
  br label %B24

B24:
  br label %B4

}