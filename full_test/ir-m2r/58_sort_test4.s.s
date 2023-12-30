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
  %r55 = add i32 0, 0 ; loadint
  %r57 = loadaddr @n#0
  %r58 = load i32, ptr %r57
  %r56 = call i32 @select_sort(i32 %r3, i32 %r58)
  br label %B15

B15:
  %r78 = phi i32 [ %r56, %B14 ], [ %r76, %B16 ]
  %r79 = add i32 0, %r71 ; assign
  %r60 = loadaddr @n#0
  %r61 = load i32, ptr %r60
  %r62 = icmp slt i32 %r78, %r61
  br i1 %r62, label %B16, label %B17

B16:
  %r64 = add i32 0, 4 ; loadint
  %r66 = mul i32 %r78, %r64
  %r67 = add i32 %r3, %r66
  %r68 = load i32, ptr %r67
  %r69 = call i32 @putint(i32 %r68)
  %r71 = add i32 0, 10 ; loadint
  %r72 = call i32 @putch(i32 %r71)
  %r75 = add i32 0, 1 ; loadint
  %r76 = add i32 %r78, %r75
  br label %B15

B17:
  %r77 = add i32 0, 0 ; loadint
  ret i32 %r77

}
define i32 @select_sort(i32, i32){
B0:
  %r7 = add i32 0, 0 ; loadint
  br label %B1

B1:
  %r62 = phi i32 [ %r7, %B0 ], [ %r60, %B12 ]
  %r69 = add i32 0, %r68 ; assign
  %r65 = add i32 0, %r67 ; assign
  %r63 = add i32 0, %r64 ; assign
  %r10 = add i32 0, 1 ; loadint
  %r11 = sub i32 %r2, %r10
  %r12 = icmp slt i32 %r62, %r11
  br i1 %r12, label %B2, label %B3

B2:
  %r15 = add i32 0, 1 ; loadint
  %r16 = add i32 %r62, %r15
  br label %B4

B3:
  %r61 = add i32 0, 0 ; loadint
  ret i32 %r61

B4:
  %r67 = phi i32 [ %r62, %B2 ], [ %r66, %B9 ]
  %r64 = phi i32 [ %r16, %B2 ], [ %r34, %B9 ]
  %r19 = icmp slt i32 %r64, %r2
  br i1 %r19, label %B5, label %B6

B5:
  br label %B7

B6:
  br label %B10

B7:
  %r20 = add i32 0, 4 ; loadint
  %r22 = mul i32 %r67, %r20
  %r23 = add i32 %r1, %r22
  %r24 = load i32, ptr %r23
  %r25 = add i32 0, 4 ; loadint
  %r27 = mul i32 %r64, %r25
  %r28 = add i32 %r1, %r27
  %r29 = load i32, ptr %r28
  %r30 = icmp sgt i32 %r24, %r29
  br i1 %r30, label %B8, label %B9

B8:
  br label %B9

B9:
  %r66 = phi i32 [ %r67, %B7 ], [ %r64, %B8 ]
  %r33 = add i32 0, 1 ; loadint
  %r34 = add i32 %r64, %r33
  br label %B4

B10:
  %r37 = icmp ne i32 %r67, %r62
  br i1 %r37, label %B11, label %B12

B11:
  %r39 = add i32 0, 4 ; loadint
  %r41 = mul i32 %r67, %r39
  %r42 = add i32 %r1, %r41
  %r43 = load i32, ptr %r42
  %r44 = add i32 0, 4 ; loadint
  %r46 = mul i32 %r62, %r44
  %r47 = add i32 %r1, %r46
  %r48 = load i32, ptr %r47
  %r49 = add i32 0, 4 ; loadint
  %r51 = mul i32 %r67, %r49
  %r52 = add i32 %r1, %r51
  store i32 %r48, ptr %r52
  %r54 = add i32 0, 4 ; loadint
  %r56 = mul i32 %r62, %r54
  %r57 = add i32 %r1, %r56
  store i32 %r43, ptr %r57
  br label %B12

B12:
  %r68 = phi i32 [ %r69, %B10 ], [ %r43, %B11 ]
  %r59 = add i32 0, 1 ; loadint
  %r60 = add i32 %r62, %r59
  br label %B1

}
