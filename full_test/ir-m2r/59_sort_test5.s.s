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
  %r55 = add i32 0, 0 ; loadint
  %r57 = loadaddr @n#0
  %r58 = load i32, ptr %r57
  %r56 = call i32 @heap_sort(i32 %r3, i32 %r58)
  br label %B27

B27:
  %r78 = phi i32 [ %r56, %B26 ], [ %r76, %B28 ]
  %r79 = add i32 0, %r71 ; assign
  %r60 = loadaddr @n#0
  %r61 = load i32, ptr %r60
  %r62 = icmp slt i32 %r78, %r61
  br i1 %r62, label %B28, label %B29

B28:
  %r64 = add i32 0, 4 ; loadint
  %r66 = mul i32 %r78, %r64
  %r67 = add i32 %r3, %r66
  %r68 = load i32, ptr %r67
  %r69 = call i32 @putint(i32 %r68)
  %r71 = add i32 0, 10 ; loadint
  %r72 = call i32 @putch(i32 %r71)
  %r75 = add i32 0, 1 ; loadint
  %r76 = add i32 %r78, %r75
  br label %B27

B29:
  %r77 = add i32 0, 0 ; loadint
  ret i32 %r77

}
define i32 @heap_sort(i32, i32){
B18:
  %r7 = add i32 0, 2 ; loadint
  %r8 = sdiv i32 %r2, %r7
  %r9 = add i32 0, 1 ; loadint
  %r10 = sub i32 %r8, %r9
  br label %B19

B19:
  %r46 = phi i32 [ %r10, %B18 ], [ %r24, %B20 ]
  %r48 = add i32 0, %r19 ; assign
  %r12 = add i32 0, 1 ; loadint
  %r14 = add i32 0, 0 ; loadint
  %r13 = sub i32 %r14, %r12
  %r15 = icmp sgt i32 %r46, %r13
  br i1 %r15, label %B20, label %B21

B20:
  %r17 = add i32 0, 1 ; loadint
  %r18 = sub i32 %r2, %r17
  %r19 = call i32 @heap_ajust(i32 %r1, i32 %r46, i32 %r18)
  %r23 = add i32 0, 1 ; loadint
  %r24 = sub i32 %r46, %r23
  br label %B19

B21:
  %r26 = add i32 0, 1 ; loadint
  %r27 = sub i32 %r2, %r26
  br label %B22

B22:
  %r49 = phi i32 [ %r48, %B21 ], [ %r39, %B23 ]
  %r47 = phi i32 [ %r27, %B21 ], [ %r44, %B23 ]
  %r50 = add i32 0, %r32 ; assign
  %r29 = add i32 0, 0 ; loadint
  %r30 = icmp sgt i32 %r47, %r29
  br i1 %r30, label %B23, label %B24

B23:
  %r32 = add i32 0, 0 ; loadint
  %r33 = call i32 @swap(i32 %r1, i32 %r32, i32 %r47)
  %r37 = add i32 0, 1 ; loadint
  %r38 = sub i32 %r47, %r37
  %r39 = call i32 @heap_ajust(i32 %r1, i32 %r32, i32 %r38)
  %r43 = add i32 0, 1 ; loadint
  %r44 = sub i32 %r47, %r43
  br label %B22

B24:
  %r45 = add i32 0, 0 ; loadint
  ret i32 %r45

}
define i32 @heap_ajust(i32, i32, i32){
B2:
  %r10 = add i32 0, 2 ; loadint
  %r11 = mul i32 %r2, %r10
  %r12 = add i32 0, 1 ; loadint
  %r13 = add i32 %r11, %r12
  br label %B3

B3:
  %r67 = phi i32 [ %r13, %B2 ], [ %r61, %B15 ]
  %r63 = phi i32 [ %r2, %B2 ], [ %r66, %B15 ]
  %r65 = add i32 0, %r64 ; assign
  %r16 = add i32 0, 1 ; loadint
  %r17 = add i32 %r3, %r16
  %r18 = icmp slt i32 %r67, %r17
  br i1 %r18, label %B4, label %B5

B4:
  br label %B6

B5:
  %r62 = add i32 0, 0 ; loadint
  ret i32 %r62

B6:
  %r22 = icmp slt i32 %r67, %r3
  br i1 %r22, label %B7, label %B8

B7:
  %r23 = add i32 0, 4 ; loadint
  %r25 = mul i32 %r67, %r23
  %r26 = add i32 %r1, %r25
  %r27 = load i32, ptr %r26
  %r28 = add i32 0, 4 ; loadint
  %r30 = add i32 0, 1 ; loadint
  %r31 = add i32 %r67, %r30
  %r32 = mul i32 %r31, %r28
  %r33 = add i32 %r1, %r32
  %r34 = load i32, ptr %r33
  %r35 = icmp slt i32 %r27, %r34
  br label %B9

B8:
  %r36 = add i32 0, 0 ; loadint
  br label %B9

B9:
  %r64 = phi i32 [ %r35, %B7 ], [ %r36, %B8 ]
  br i1 %r64, label %B10, label %B11

B10:
  %r39 = add i32 0, 1 ; loadint
  %r40 = add i32 %r67, %r39
  br label %B11

B11:
  %r66 = phi i32 [ %r67, %B9 ], [ %r40, %B10 ]
  br label %B12

B12:
  %r41 = add i32 0, 4 ; loadint
  %r43 = mul i32 %r63, %r41
  %r44 = add i32 %r1, %r43
  %r45 = load i32, ptr %r44
  %r46 = add i32 0, 4 ; loadint
  %r48 = mul i32 %r66, %r46
  %r49 = add i32 %r1, %r48
  %r50 = load i32, ptr %r49
  %r51 = icmp sgt i32 %r45, %r50
  br i1 %r51, label %B13, label %B14

B13:
  %r52 = add i32 0, 0 ; loadint
  ret i32 %r52

B14:
  %r53 = call i32 @swap(i32 %r1, i32 %r63, i32 %r66)
  %r58 = add i32 0, 2 ; loadint
  %r59 = mul i32 %r66, %r58
  %r60 = add i32 0, 1 ; loadint
  %r61 = add i32 %r59, %r60
  br label %B15

B15:
  br label %B3

}
define i32 @swap(i32, i32, i32){
B0:
  %r7 = add i32 0, 4 ; loadint
  %r9 = mul i32 %r2, %r7
  %r10 = add i32 %r1, %r9
  %r11 = load i32, ptr %r10
  %r12 = add i32 0, 4 ; loadint
  %r14 = mul i32 %r3, %r12
  %r15 = add i32 %r1, %r14
  %r16 = load i32, ptr %r15
  %r17 = add i32 0, 4 ; loadint
  %r19 = mul i32 %r2, %r17
  %r20 = add i32 %r1, %r19
  store i32 %r16, ptr %r20
  %r22 = add i32 0, 4 ; loadint
  %r24 = mul i32 %r3, %r22
  %r25 = add i32 %r1, %r24
  store i32 %r11, ptr %r25
  %r26 = add i32 0, 0 ; loadint
  ret i32 %r26

}
