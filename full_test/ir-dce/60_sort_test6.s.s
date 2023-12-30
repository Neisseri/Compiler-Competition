; module
@n#0 = global int, 4
define i32 @main(){
B14:
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
  %r56 = alloca int [10], 40
  %r58 = loadaddr @n#0
  %r59 = load i32, ptr %r58
  %r57 = call i32 @counting_sort(i32 %r3, i32 %r56, i32 %r59)
  store i32 %r57, ptr %r54
  br label %B15

B15:
  %r60 = load i32, ptr %r54
  %r61 = loadaddr @n#0
  %r62 = load i32, ptr %r61
  %r63 = icmp slt i32 %r60, %r62
  br i1 %r63, label %B16, label %B17

B16:
  %r64 = alloca int, 4
  %r65 = add i32 0, 4 ; loadint
  %r66 = load i32, ptr %r54
  %r67 = mul i32 %r66, %r65
  %r68 = add i32 %r56, %r67
  %r69 = load i32, ptr %r68
  store i32 %r69, ptr %r64
  %r71 = load i32, ptr %r64
  %r70 = call i32 @putint(i32 %r71)
  %r72 = add i32 0, 10 ; loadint
  store i32 %r72, ptr %r64
  %r74 = load i32, ptr %r64
  %r73 = call i32 @putch(i32 %r74)
  %r75 = load i32, ptr %r54
  %r76 = add i32 0, 1 ; loadint
  %r77 = add i32 %r75, %r76
  store i32 %r77, ptr %r54
  br label %B15

B17:
  %r78 = add i32 0, 0 ; loadint
  ret i32 %r78

}
define i32 @counting_sort(i32, i32, i32){
B0:
  %r4 = alloca int, 4
  store i32 %r3, ptr %r4
  %r5 = alloca int [10], 40
  %r6 = alloca int, 4
  %r7 = alloca int, 4
  %r8 = alloca int, 4
  %r9 = add i32 0, 0 ; loadint
  store i32 %r9, ptr %r8
  %r10 = add i32 0, 0 ; loadint
  store i32 %r10, ptr %r6
  %r11 = add i32 0, 0 ; loadint
  store i32 %r11, ptr %r7
  br label %B1

B1:
  %r12 = load i32, ptr %r8
  %r13 = add i32 0, 10 ; loadint
  %r14 = icmp slt i32 %r12, %r13
  br i1 %r14, label %B2, label %B3

B2:
  %r15 = add i32 0, 0 ; loadint
  %r16 = add i32 0, 4 ; loadint
  %r17 = load i32, ptr %r8
  %r18 = mul i32 %r17, %r16
  %r19 = add i32 %r5, %r18
  store i32 %r15, ptr %r19
  %r20 = load i32, ptr %r8
  %r21 = add i32 0, 1 ; loadint
  %r22 = add i32 %r20, %r21
  store i32 %r22, ptr %r8
  br label %B1

B3:
  br label %B4

B4:
  %r23 = load i32, ptr %r6
  %r24 = load i32, ptr %r4
  %r25 = icmp slt i32 %r23, %r24
  br i1 %r25, label %B5, label %B6

B5:
  %r26 = add i32 0, 4 ; loadint
  %r27 = add i32 0, 4 ; loadint
  %r28 = load i32, ptr %r6
  %r29 = mul i32 %r28, %r27
  %r30 = add i32 %r1, %r29
  %r31 = load i32, ptr %r30
  %r32 = mul i32 %r31, %r26
  %r33 = add i32 %r5, %r32
  %r34 = load i32, ptr %r33
  %r35 = add i32 0, 1 ; loadint
  %r36 = add i32 %r34, %r35
  %r37 = add i32 0, 4 ; loadint
  %r38 = add i32 0, 4 ; loadint
  %r39 = load i32, ptr %r6
  %r40 = mul i32 %r39, %r38
  %r41 = add i32 %r1, %r40
  %r42 = load i32, ptr %r41
  %r43 = mul i32 %r42, %r37
  %r44 = add i32 %r5, %r43
  store i32 %r36, ptr %r44
  %r45 = load i32, ptr %r6
  %r46 = add i32 0, 1 ; loadint
  %r47 = add i32 %r45, %r46
  store i32 %r47, ptr %r6
  br label %B4

B6:
  %r48 = add i32 0, 1 ; loadint
  store i32 %r48, ptr %r8
  br label %B7

B7:
  %r49 = load i32, ptr %r8
  %r50 = add i32 0, 10 ; loadint
  %r51 = icmp slt i32 %r49, %r50
  br i1 %r51, label %B8, label %B9

B8:
  %r52 = add i32 0, 4 ; loadint
  %r53 = load i32, ptr %r8
  %r54 = mul i32 %r53, %r52
  %r55 = add i32 %r5, %r54
  %r56 = load i32, ptr %r55
  %r57 = add i32 0, 4 ; loadint
  %r58 = load i32, ptr %r8
  %r59 = add i32 0, 1 ; loadint
  %r60 = sub i32 %r58, %r59
  %r61 = mul i32 %r60, %r57
  %r62 = add i32 %r5, %r61
  %r63 = load i32, ptr %r62
  %r64 = add i32 %r56, %r63
  %r65 = add i32 0, 4 ; loadint
  %r66 = load i32, ptr %r8
  %r67 = mul i32 %r66, %r65
  %r68 = add i32 %r5, %r67
  store i32 %r64, ptr %r68
  %r69 = load i32, ptr %r8
  %r70 = add i32 0, 1 ; loadint
  %r71 = add i32 %r69, %r70
  store i32 %r71, ptr %r8
  br label %B7

B9:
  %r72 = load i32, ptr %r4
  store i32 %r72, ptr %r7
  br label %B10

B10:
  %r73 = load i32, ptr %r7
  %r74 = add i32 0, 0 ; loadint
  %r75 = icmp sgt i32 %r73, %r74
  br i1 %r75, label %B11, label %B12

B11:
  %r76 = add i32 0, 4 ; loadint
  %r77 = add i32 0, 4 ; loadint
  %r78 = load i32, ptr %r7
  %r79 = add i32 0, 1 ; loadint
  %r80 = sub i32 %r78, %r79
  %r81 = mul i32 %r80, %r77
  %r82 = add i32 %r1, %r81
  %r83 = load i32, ptr %r82
  %r84 = mul i32 %r83, %r76
  %r85 = add i32 %r5, %r84
  %r86 = load i32, ptr %r85
  %r87 = add i32 0, 1 ; loadint
  %r88 = sub i32 %r86, %r87
  %r89 = add i32 0, 4 ; loadint
  %r90 = add i32 0, 4 ; loadint
  %r91 = load i32, ptr %r7
  %r92 = add i32 0, 1 ; loadint
  %r93 = sub i32 %r91, %r92
  %r94 = mul i32 %r93, %r90
  %r95 = add i32 %r1, %r94
  %r96 = load i32, ptr %r95
  %r97 = mul i32 %r96, %r89
  %r98 = add i32 %r5, %r97
  store i32 %r88, ptr %r98
  %r99 = add i32 0, 4 ; loadint
  %r100 = load i32, ptr %r7
  %r101 = add i32 0, 1 ; loadint
  %r102 = sub i32 %r100, %r101
  %r103 = mul i32 %r102, %r99
  %r104 = add i32 %r1, %r103
  %r105 = load i32, ptr %r104
  %r106 = add i32 0, 4 ; loadint
  %r107 = add i32 0, 4 ; loadint
  %r108 = add i32 0, 4 ; loadint
  %r109 = load i32, ptr %r7
  %r110 = add i32 0, 1 ; loadint
  %r111 = sub i32 %r109, %r110
  %r112 = mul i32 %r111, %r108
  %r113 = add i32 %r1, %r112
  %r114 = load i32, ptr %r113
  %r115 = mul i32 %r114, %r107
  %r116 = add i32 %r5, %r115
  %r117 = load i32, ptr %r116
  %r118 = mul i32 %r117, %r106
  %r119 = add i32 %r2, %r118
  store i32 %r105, ptr %r119
  %r120 = load i32, ptr %r7
  %r121 = add i32 0, 1 ; loadint
  %r122 = sub i32 %r120, %r121
  store i32 %r122, ptr %r7
  br label %B10

B12:
  %r123 = add i32 0, 0 ; loadint
  ret i32 %r123

}
