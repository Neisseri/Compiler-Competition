; module
@g#0 = global int, 4
@h#0 = global int, 4
@f#0 = global int, 4
@e#0 = global int, 4
define i32 @main(){
B26:
  %r1 = add i32 0, 1 ; loadint
  %r2 = loadaddr @g#0
  store i32 %r1, ptr %r2
  %r3 = add i32 0, 2 ; loadint
  %r4 = loadaddr @h#0
  store i32 %r3, ptr %r4
  %r5 = add i32 0, 4 ; loadint
  %r6 = loadaddr @e#0
  store i32 %r5, ptr %r6
  %r7 = add i32 0, 6 ; loadint
  %r8 = loadaddr @f#0
  store i32 %r7, ptr %r8
  %r9 = call i32 @EightWhile()
  ret i32 %r9

}
define i32 @EightWhile(){
B0:
  %r1 = alloca int, 4
  %r2 = add i32 0, 5 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca int, 4
  %r4 = alloca int, 4
  %r5 = add i32 0, 6 ; loadint
  store i32 %r5, ptr %r3
  %r6 = add i32 0, 7 ; loadint
  store i32 %r6, ptr %r4
  %r7 = alloca int, 4
  %r8 = add i32 0, 10 ; loadint
  store i32 %r8, ptr %r7
  br label %B1

B1:
  %r9 = load i32, ptr %r1
  %r10 = add i32 0, 20 ; loadint
  %r11 = icmp slt i32 %r9, %r10
  br i1 %r11, label %B2, label %B3

B2:
  %r12 = load i32, ptr %r1
  %r13 = add i32 0, 3 ; loadint
  %r14 = add i32 %r12, %r13
  store i32 %r14, ptr %r1
  br label %B4

B3:
  %r98 = load i32, ptr %r1
  %r99 = load i32, ptr %r3
  %r100 = load i32, ptr %r7
  %r101 = add i32 %r99, %r100
  %r102 = add i32 %r98, %r101
  %r103 = load i32, ptr %r4
  %r104 = add i32 %r102, %r103
  %r105 = loadaddr @e#0
  %r106 = load i32, ptr %r105
  %r107 = load i32, ptr %r7
  %r108 = add i32 %r106, %r107
  %r109 = loadaddr @g#0
  %r110 = load i32, ptr %r109
  %r111 = sub i32 %r108, %r110
  %r112 = loadaddr @h#0
  %r113 = load i32, ptr %r112
  %r114 = add i32 %r111, %r113
  %r115 = sub i32 %r104, %r114
  ret i32 %r115

B4:
  %r15 = load i32, ptr %r3
  %r16 = add i32 0, 10 ; loadint
  %r17 = icmp slt i32 %r15, %r16
  br i1 %r17, label %B5, label %B6

B5:
  %r18 = load i32, ptr %r3
  %r19 = add i32 0, 1 ; loadint
  %r20 = add i32 %r18, %r19
  store i32 %r20, ptr %r3
  br label %B7

B6:
  %r95 = load i32, ptr %r3
  %r96 = add i32 0, 2 ; loadint
  %r97 = sub i32 %r95, %r96
  store i32 %r97, ptr %r3
  br label %B1

B7:
  %r21 = load i32, ptr %r4
  %r22 = add i32 0, 7 ; loadint
  %r23 = icmp eq i32 %r21, %r22
  br i1 %r23, label %B8, label %B9

B8:
  %r24 = load i32, ptr %r4
  %r25 = add i32 0, 1 ; loadint
  %r26 = sub i32 %r24, %r25
  store i32 %r26, ptr %r4
  br label %B10

B9:
  %r92 = load i32, ptr %r4
  %r93 = add i32 0, 1 ; loadint
  %r94 = add i32 %r92, %r93
  store i32 %r94, ptr %r4
  br label %B4

B10:
  %r27 = load i32, ptr %r7
  %r28 = add i32 0, 20 ; loadint
  %r29 = icmp slt i32 %r27, %r28
  br i1 %r29, label %B11, label %B12

B11:
  %r30 = load i32, ptr %r7
  %r31 = add i32 0, 3 ; loadint
  %r32 = add i32 %r30, %r31
  store i32 %r32, ptr %r7
  br label %B13

B12:
  %r89 = load i32, ptr %r7
  %r90 = add i32 0, 1 ; loadint
  %r91 = sub i32 %r89, %r90
  store i32 %r91, ptr %r7
  br label %B7

B13:
  %r33 = loadaddr @e#0
  %r34 = load i32, ptr %r33
  %r35 = add i32 0, 1 ; loadint
  %r36 = icmp sgt i32 %r34, %r35
  br i1 %r36, label %B14, label %B15

B14:
  %r37 = loadaddr @e#0
  %r38 = load i32, ptr %r37
  %r39 = add i32 0, 1 ; loadint
  %r40 = sub i32 %r38, %r39
  %r41 = loadaddr @e#0
  store i32 %r40, ptr %r41
  br label %B16

B15:
  %r84 = loadaddr @e#0
  %r85 = load i32, ptr %r84
  %r86 = add i32 0, 1 ; loadint
  %r87 = add i32 %r85, %r86
  %r88 = loadaddr @e#0
  store i32 %r87, ptr %r88
  br label %B10

B16:
  %r42 = loadaddr @f#0
  %r43 = load i32, ptr %r42
  %r44 = add i32 0, 2 ; loadint
  %r45 = icmp sgt i32 %r43, %r44
  br i1 %r45, label %B17, label %B18

B17:
  %r46 = loadaddr @f#0
  %r47 = load i32, ptr %r46
  %r48 = add i32 0, 2 ; loadint
  %r49 = sub i32 %r47, %r48
  %r50 = loadaddr @f#0
  store i32 %r49, ptr %r50
  br label %B19

B18:
  %r79 = loadaddr @f#0
  %r80 = load i32, ptr %r79
  %r81 = add i32 0, 1 ; loadint
  %r82 = add i32 %r80, %r81
  %r83 = loadaddr @f#0
  store i32 %r82, ptr %r83
  br label %B13

B19:
  %r51 = loadaddr @g#0
  %r52 = load i32, ptr %r51
  %r53 = add i32 0, 3 ; loadint
  %r54 = icmp slt i32 %r52, %r53
  br i1 %r54, label %B20, label %B21

B20:
  %r55 = loadaddr @g#0
  %r56 = load i32, ptr %r55
  %r57 = add i32 0, 10 ; loadint
  %r58 = add i32 %r56, %r57
  %r59 = loadaddr @g#0
  store i32 %r58, ptr %r59
  br label %B22

B21:
  %r74 = loadaddr @g#0
  %r75 = load i32, ptr %r74
  %r76 = add i32 0, 8 ; loadint
  %r77 = sub i32 %r75, %r76
  %r78 = loadaddr @g#0
  store i32 %r77, ptr %r78
  br label %B16

B22:
  %r60 = loadaddr @h#0
  %r61 = load i32, ptr %r60
  %r62 = add i32 0, 10 ; loadint
  %r63 = icmp slt i32 %r61, %r62
  br i1 %r63, label %B23, label %B24

B23:
  %r64 = loadaddr @h#0
  %r65 = load i32, ptr %r64
  %r66 = add i32 0, 8 ; loadint
  %r67 = add i32 %r65, %r66
  %r68 = loadaddr @h#0
  store i32 %r67, ptr %r68
  br label %B22

B24:
  %r69 = loadaddr @h#0
  %r70 = load i32, ptr %r69
  %r71 = add i32 0, 1 ; loadint
  %r72 = sub i32 %r70, %r71
  %r73 = loadaddr @h#0
  store i32 %r72, ptr %r73
  br label %B19

}
