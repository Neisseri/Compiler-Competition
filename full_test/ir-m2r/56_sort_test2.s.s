; module
@n#0 = global int, 4
define i32 @main(){
B11:
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
  %r55 = call i32 @insertsort(i32 %r3)
  br label %B12

B12:
  %r75 = phi i32 [ %r55, %B11 ], [ %r73, %B13 ]
  %r76 = add i32 0, %r68 ; assign
  %r57 = loadaddr @n#0
  %r58 = load i32, ptr %r57
  %r59 = icmp slt i32 %r75, %r58
  br i1 %r59, label %B13, label %B14

B13:
  %r61 = add i32 0, 4 ; loadint
  %r63 = mul i32 %r75, %r61
  %r64 = add i32 %r3, %r63
  %r65 = load i32, ptr %r64
  %r66 = call i32 @putint(i32 %r65)
  %r68 = add i32 0, 10 ; loadint
  %r69 = call i32 @putch(i32 %r68)
  %r72 = add i32 0, 1 ; loadint
  %r73 = add i32 %r75, %r72
  br label %B12

B14:
  %r74 = add i32 0, 0 ; loadint
  ret i32 %r74

}
define i32 @insertsort(i32){
B0:
  %r3 = add i32 0, 1 ; loadint
  br label %B1

B1:
  %r58 = phi i32 [ %r3, %B0 ], [ %r56, %B6 ]
  %r64 = add i32 0, %r13 ; assign
  %r62 = add i32 0, %r61 ; assign
  %r59 = add i32 0, %r60 ; assign
  %r5 = loadaddr @n#0
  %r6 = load i32, ptr %r5
  %r7 = icmp slt i32 %r58, %r6
  br i1 %r7, label %B2, label %B3

B2:
  %r9 = add i32 0, 4 ; loadint
  %r11 = mul i32 %r58, %r9
  %r12 = add i32 %r1, %r11
  %r13 = load i32, ptr %r12
  %r16 = add i32 0, 1 ; loadint
  %r17 = sub i32 %r58, %r16
  br label %B4

B3:
  %r57 = add i32 0, 0 ; loadint
  ret i32 %r57

B4:
  %r63 = phi i32 [ %r62, %B2 ], [ %r61, %B5 ]
  %r60 = phi i32 [ %r17, %B2 ], [ %r46, %B5 ]
  %r20 = add i32 0, 1 ; loadint
  %r22 = add i32 0, 0 ; loadint
  %r21 = sub i32 %r22, %r20
  %r23 = icmp sgt i32 %r60, %r21
  br i1 %r23, label %B7, label %B8

B5:
  %r33 = add i32 0, 4 ; loadint
  %r35 = mul i32 %r60, %r33
  %r36 = add i32 %r1, %r35
  %r37 = load i32, ptr %r36
  %r38 = add i32 0, 4 ; loadint
  %r40 = add i32 0, 1 ; loadint
  %r41 = add i32 %r60, %r40
  %r42 = mul i32 %r41, %r38
  %r43 = add i32 %r1, %r42
  store i32 %r37, ptr %r43
  %r45 = add i32 0, 1 ; loadint
  %r46 = sub i32 %r60, %r45
  br label %B4

B6:
  %r48 = add i32 0, 4 ; loadint
  %r50 = add i32 0, 1 ; loadint
  %r51 = add i32 %r60, %r50
  %r52 = mul i32 %r51, %r48
  %r53 = add i32 %r1, %r52
  store i32 %r13, ptr %r53
  %r55 = add i32 0, 1 ; loadint
  %r56 = add i32 %r58, %r55
  br label %B1

B7:
  %r25 = add i32 0, 4 ; loadint
  %r27 = mul i32 %r60, %r25
  %r28 = add i32 %r1, %r27
  %r29 = load i32, ptr %r28
  %r30 = icmp slt i32 %r13, %r29
  br label %B9

B8:
  %r31 = add i32 0, 0 ; loadint
  br label %B9

B9:
  %r61 = phi i32 [ %r30, %B7 ], [ %r31, %B8 ]
  br i1 %r61, label %B5, label %B6

}
