; module
define i32 @main(){
B0:
  %r1 = alloca int, 4
  %r2 = add i32 0, 2 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca const int, 4
  %r4 = add i32 0, 20 ; loadint
  store i32 %r4, ptr %r3
  %r5 = alloca int [20], 80
  %r6 = add i32 0, 1 ; loadint
  %r8 = add i32 0, 0 ; loadint
  %r7 = add i32 %r5, %r8
  store i32 %r6, ptr %r7
  %r9 = add i32 0, 2 ; loadint
  %r11 = add i32 0, 4 ; loadint
  %r10 = add i32 %r5, %r11
  store i32 %r9, ptr %r10
  %r12 = add i32 0, 0 ; loadint
  %r14 = add i32 0, 8 ; loadint
  %r13 = add i32 %r5, %r14
  store i32 %r12, ptr %r13
  %r15 = add i32 0, 0 ; loadint
  %r17 = add i32 0, 12 ; loadint
  %r16 = add i32 %r5, %r17
  store i32 %r15, ptr %r16
  %r18 = add i32 0, 0 ; loadint
  %r20 = add i32 0, 16 ; loadint
  %r19 = add i32 %r5, %r20
  store i32 %r18, ptr %r19
  %r21 = add i32 0, 0 ; loadint
  %r23 = add i32 0, 20 ; loadint
  %r22 = add i32 %r5, %r23
  store i32 %r21, ptr %r22
  %r24 = add i32 0, 0 ; loadint
  %r26 = add i32 0, 24 ; loadint
  %r25 = add i32 %r5, %r26
  store i32 %r24, ptr %r25
  %r27 = add i32 0, 0 ; loadint
  %r29 = add i32 0, 28 ; loadint
  %r28 = add i32 %r5, %r29
  store i32 %r27, ptr %r28
  %r30 = add i32 0, 0 ; loadint
  %r32 = add i32 0, 32 ; loadint
  %r31 = add i32 %r5, %r32
  store i32 %r30, ptr %r31
  %r33 = add i32 0, 0 ; loadint
  %r35 = add i32 0, 36 ; loadint
  %r34 = add i32 %r5, %r35
  store i32 %r33, ptr %r34
  %r36 = add i32 0, 0 ; loadint
  %r38 = add i32 0, 40 ; loadint
  %r37 = add i32 %r5, %r38
  store i32 %r36, ptr %r37
  %r39 = add i32 0, 0 ; loadint
  %r41 = add i32 0, 44 ; loadint
  %r40 = add i32 %r5, %r41
  store i32 %r39, ptr %r40
  %r42 = add i32 0, 0 ; loadint
  %r44 = add i32 0, 48 ; loadint
  %r43 = add i32 %r5, %r44
  store i32 %r42, ptr %r43
  %r45 = add i32 0, 0 ; loadint
  %r47 = add i32 0, 52 ; loadint
  %r46 = add i32 %r5, %r47
  store i32 %r45, ptr %r46
  %r48 = add i32 0, 0 ; loadint
  %r50 = add i32 0, 56 ; loadint
  %r49 = add i32 %r5, %r50
  store i32 %r48, ptr %r49
  %r51 = add i32 0, 0 ; loadint
  %r53 = add i32 0, 60 ; loadint
  %r52 = add i32 %r5, %r53
  store i32 %r51, ptr %r52
  %r54 = add i32 0, 0 ; loadint
  %r56 = add i32 0, 64 ; loadint
  %r55 = add i32 %r5, %r56
  store i32 %r54, ptr %r55
  %r57 = add i32 0, 0 ; loadint
  %r59 = add i32 0, 68 ; loadint
  %r58 = add i32 %r5, %r59
  store i32 %r57, ptr %r58
  %r60 = add i32 0, 0 ; loadint
  %r62 = add i32 0, 72 ; loadint
  %r61 = add i32 %r5, %r62
  store i32 %r60, ptr %r61
  %r63 = add i32 0, 0 ; loadint
  %r65 = add i32 0, 76 ; loadint
  %r64 = add i32 %r5, %r65
  store i32 %r63, ptr %r64
  %r66 = alloca int, 4
  %r67 = add i32 0, 0 ; loadint
  store i32 %r67, ptr %r66
  br label %B1

B1:
  %r68 = load i32, ptr %r1
  %r69 = load i32, ptr %r3
  %r70 = icmp slt i32 %r68, %r69
  br i1 %r70, label %B2, label %B3

B2:
  %r71 = add i32 0, 4 ; loadint
  %r72 = load i32, ptr %r1
  %r73 = mul i32 %r72, %r71
  %r74 = add i32 %r5, %r73
  %r75 = load i32, ptr %r74
  %r76 = add i32 0, 4 ; loadint
  %r77 = load i32, ptr %r1
  %r78 = add i32 0, 1 ; loadint
  %r79 = sub i32 %r77, %r78
  %r80 = mul i32 %r79, %r76
  %r81 = add i32 %r5, %r80
  %r82 = load i32, ptr %r81
  %r83 = add i32 %r75, %r82
  %r84 = add i32 0, 4 ; loadint
  %r85 = load i32, ptr %r1
  %r86 = add i32 0, 2 ; loadint
  %r87 = sub i32 %r85, %r86
  %r88 = mul i32 %r87, %r84
  %r89 = add i32 %r5, %r88
  %r90 = load i32, ptr %r89
  %r91 = add i32 %r83, %r90
  %r92 = add i32 0, 4 ; loadint
  %r93 = load i32, ptr %r1
  %r94 = mul i32 %r93, %r92
  %r95 = add i32 %r5, %r94
  store i32 %r91, ptr %r95
  %r96 = load i32, ptr %r66
  %r97 = add i32 0, 4 ; loadint
  %r98 = load i32, ptr %r1
  %r99 = mul i32 %r98, %r97
  %r100 = add i32 %r5, %r99
  %r101 = load i32, ptr %r100
  %r102 = add i32 %r96, %r101
  store i32 %r102, ptr %r66
  %r104 = add i32 0, 4 ; loadint
  %r105 = load i32, ptr %r1
  %r106 = mul i32 %r105, %r104
  %r107 = add i32 %r5, %r106
  %r108 = load i32, ptr %r107
  %r103 = call i32 @putint(i32 %r108)
  %r110 = add i32 0, 10 ; loadint
  %r109 = call i32 @putch(i32 %r110)
  %r111 = load i32, ptr %r1
  %r112 = add i32 0, 1 ; loadint
  %r113 = add i32 %r111, %r112
  store i32 %r113, ptr %r1
  br label %B1

B3:
  %r114 = load i32, ptr %r66
  ret i32 %r114

}
