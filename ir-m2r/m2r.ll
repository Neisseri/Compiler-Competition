; module
@n = global i32, i32 4
define i32 @main(){
B26:
  %r1 = add i32 0, 10 ; loadint
  %r2 = loadaddr @n#0
  store n#0 i32 %r1, ptr %r2
  %r3 = alloca i32, i32 40
  %r4 = add i32 0, 4 ; loadint
  %r5 = add i32 0, 4 ; loadint
  %r6 = add i32 0, 0 ; loadint
  %r7 = mul i32 %r6, %r5
  %r8 = add i32 %r3, %r7
  store a#13 i32 %r4, ptr %r8
  %r9 = add i32 0, 3 ; loadint
  %r10 = add i32 0, 4 ; loadint
  %r11 = add i32 0, 1 ; loadint
  %r12 = mul i32 %r11, %r10
  %r13 = add i32 %r3, %r12
  store a#13 i32 %r9, ptr %r13
  %r14 = add i32 0, 9 ; loadint
  %r15 = add i32 0, 4 ; loadint
  %r16 = add i32 0, 2 ; loadint
  %r17 = mul i32 %r16, %r15
  %r18 = add i32 %r3, %r17
  store a#13 i32 %r14, ptr %r18
  %r19 = add i32 0, 2 ; loadint
  %r20 = add i32 0, 4 ; loadint
  %r21 = add i32 0, 3 ; loadint
  %r22 = mul i32 %r21, %r20
  %r23 = add i32 %r3, %r22
  store a#13 i32 %r19, ptr %r23
  %r24 = add i32 0, 0 ; loadint
  %r25 = add i32 0, 4 ; loadint
  %r26 = add i32 0, 4 ; loadint
  %r27 = mul i32 %r26, %r25
  %r28 = add i32 %r3, %r27
  store a#13 i32 %r24, ptr %r28
  %r29 = add i32 0, 1 ; loadint
  %r30 = add i32 0, 4 ; loadint
  %r31 = add i32 0, 5 ; loadint
  %r32 = mul i32 %r31, %r30
  %r33 = add i32 %r3, %r32
  store a#13 i32 %r29, ptr %r33
  %r34 = add i32 0, 6 ; loadint
  %r35 = add i32 0, 4 ; loadint
  %r36 = add i32 0, 6 ; loadint
  %r37 = mul i32 %r36, %r35
  %r38 = add i32 %r3, %r37
  store a#13 i32 %r34, ptr %r38
  %r39 = add i32 0, 5 ; loadint
  %r40 = add i32 0, 4 ; loadint
  %r41 = add i32 0, 7 ; loadint
  %r42 = mul i32 %r41, %r40
  %r43 = add i32 %r3, %r42
  store a#13 i32 %r39, ptr %r43
  %r44 = add i32 0, 7 ; loadint
  %r45 = add i32 0, 4 ; loadint
  %r46 = add i32 0, 8 ; loadint
  %r47 = mul i32 %r46, %r45
  %r48 = add i32 %r3, %r47
  store a#13 i32 %r44, ptr %r48
  %r49 = add i32 0, 8 ; loadint
  %r50 = add i32 0, 4 ; loadint
  %r51 = add i32 0, 9 ; loadint
  %r52 = mul i32 %r51, %r50
  %r53 = add i32 %r3, %r52
  store a#13 i32 %r49, ptr %r53
  %r55 = add i32 0, 0 ; loadint
  %r57 = add i32 0, 9 ; loadint
  %r58 = call i32 @QuickSort(i32 %r3, i32 %r55, i32 %r57)
  br label %B27

B27:
  %r81 = phi tmp#15 i32 [ %r73, %B28 ]
  %r80 = phi i#13 i32 [ %r58, %B26 ], [ %r78, %B28 ]
  %r62 = loadaddr @n#0
  %r63 = load n#0 i32, ptr %r62
  %r64 = icmp slt i32 %r80, %r63
  br i1 %r64, label %B28, label %B29

B28:
  %r66 = add i32 0, 4 ; loadint
  %r68 = mul i32 %r80, %r66
  %r69 = add i32 %r3, %r68
  %r70 = load a#13 i32, ptr %r69
  %r71 = call i32 @putint(i32 %r70)
  %r73 = add i32 0, 10 ; loadint
  %r74 = call i32 @putch(i32 %r73)
  %r77 = add i32 0, 1 ; loadint
  %r78 = add i32 %r80, %r77
  br label %B27

B29:
  %r79 = add i32 0, 0 ; loadint
  ret i32 %r79

}
define i32 @QuickSort(i32 %r1, i32 %r2, i32 %r3){
B0:
  br label %B1

B1:
  %r8 = icmp slt i32 %r2, %r3
  br i1 %r8, label %B2, label %B3

B2:
  %r14 = add i32 0, 4 ; loadint
  %r16 = mul i32 %r2, %r14
  %r17 = add i32 %r1, %r16
  %r18 = load arr#1 i32, ptr %r17
  br label %B4

B3:
  %r122 = phi tmp#3 i32 [ %r101, %B6 ]
  %r121 = phi logic_expr@#55 i32 [ %r119, %B6 ]
  %r117 = phi logic_expr@#22 i32 [ %r115, %B6 ]
  %r113 = phi k#3 i32 [ %r18, %B6 ]
  %r109 = phi j#3 i32 [ %r111, %B6 ]
  %r105 = phi i#3 i32 [ %r107, %B6 ]
  %r104 = add i32 0, 0 ; loadint
  ret i32 %r104

B4:
  %r119 = phi logic_expr@#55 i32 [ %r118, %B24 ]
  %r115 = phi logic_expr@#22 i32 [ %r114, %B24 ]
  %r111 = phi j#3 i32 [ %r3, %B2 ], [ %r112, %B24 ]
  %r107 = phi i#3 i32 [ %r2, %B2 ], [ %r108, %B24 ]
  %r21 = icmp slt i32 %r107, %r111
  br i1 %r21, label %B5, label %B6

B5:
  br label %B7

B6:
  %r87 = add i32 0, 4 ; loadint
  %r89 = mul i32 %r107, %r87
  %r90 = add i32 %r1, %r89
  store arr#1 i32 %r18, ptr %r90
  %r93 = add i32 0, 1 ; loadint
  %r94 = sub i32 %r107, %r93
  %r95 = call i32 @QuickSort(i32 %r1, i32 %r2, i32 %r94)
  %r99 = add i32 0, 1 ; loadint
  %r100 = add i32 %r107, %r99
  %r101 = call i32 @QuickSort(i32 %r1, i32 %r100, i32 %r3)
  br label %B3

B7:
  %r116 = phi logic_expr@#22 i32 [ %r115, %B5 ], [ %r114, %B8 ]
  %r110 = phi j#3 i32 [ %r111, %B5 ], [ %r39, %B8 ]
  %r25 = icmp slt i32 %r107, %r110
  br i1 %r25, label %B10, label %B11

B8:
  %r38 = add i32 0, 1 ; loadint
  %r39 = sub i32 %r110, %r38
  br label %B7

B9:
  br label %B13

B10:
  %r26 = add i32 0, 4 ; loadint
  %r28 = mul i32 %r110, %r26
  %r29 = add i32 %r1, %r28
  %r30 = load arr#1 i32, ptr %r29
  %r32 = add i32 0, 1 ; loadint
  %r33 = sub i32 %r18, %r32
  %r34 = icmp sgt i32 %r30, %r33
  br label %B12

B11:
  %r35 = add i32 0, 0 ; loadint
  br label %B12

B12:
  %r114 = phi logic_expr@#22 i32 [ %r34, %B10 ], [ %r35, %B11 ]
  br i1 %r114, label %B8, label %B9

B13:
  %r42 = icmp slt i32 %r107, %r110
  br i1 %r42, label %B14, label %B15

B14:
  %r43 = add i32 0, 4 ; loadint
  %r45 = mul i32 %r110, %r43
  %r46 = add i32 %r1, %r45
  %r47 = load arr#1 i32, ptr %r46
  %r48 = add i32 0, 4 ; loadint
  %r50 = mul i32 %r107, %r48
  %r51 = add i32 %r1, %r50
  store arr#1 i32 %r47, ptr %r51
  %r53 = add i32 0, 1 ; loadint
  %r54 = add i32 %r107, %r53
  br label %B15

B15:
  %r106 = phi i#3 i32 [ %r107, %B13 ], [ %r54, %B14 ]
  br label %B16

B16:
  %r120 = phi logic_expr@#55 i32 [ %r119, %B15 ], [ %r118, %B17 ]
  %r108 = phi i#3 i32 [ %r106, %B15 ], [ %r70, %B17 ]
  %r58 = icmp slt i32 %r108, %r110
  br i1 %r58, label %B19, label %B20

B17:
  %r69 = add i32 0, 1 ; loadint
  %r70 = add i32 %r108, %r69
  br label %B16

B18:
  br label %B22

B19:
  %r59 = add i32 0, 4 ; loadint
  %r61 = mul i32 %r108, %r59
  %r62 = add i32 %r1, %r61
  %r63 = load arr#1 i32, ptr %r62
  %r65 = icmp slt i32 %r63, %r18
  br label %B21

B20:
  %r66 = add i32 0, 0 ; loadint
  br label %B21

B21:
  %r118 = phi logic_expr@#55 i32 [ %r65, %B19 ], [ %r66, %B20 ]
  br i1 %r118, label %B17, label %B18

B22:
  %r73 = icmp slt i32 %r108, %r110
  br i1 %r73, label %B23, label %B24

B23:
  %r74 = add i32 0, 4 ; loadint
  %r76 = mul i32 %r108, %r74
  %r77 = add i32 %r1, %r76
  %r78 = load arr#1 i32, ptr %r77
  %r79 = add i32 0, 4 ; loadint
  %r81 = mul i32 %r110, %r79
  %r82 = add i32 %r1, %r81
  store arr#1 i32 %r78, ptr %r82
  %r84 = add i32 0, 1 ; loadint
  %r85 = sub i32 %r110, %r84
  br label %B24

B24:
  %r112 = phi j#3 i32 [ %r110, %B22 ], [ %r85, %B23 ]
  br label %B4

}
