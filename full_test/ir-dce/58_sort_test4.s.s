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
  %r57 = loadaddr @n#0
  %r58 = load i32, ptr %r57
  %r56 = call i32 @select_sort(i32 %r3, i32 %r58)
  store i32 %r56, ptr %r54
  br label %B15

B15:
  %r59 = load i32, ptr %r54
  %r60 = loadaddr @n#0
  %r61 = load i32, ptr %r60
  %r62 = icmp slt i32 %r59, %r61
  br i1 %r62, label %B16, label %B17

B16:
  %r63 = alloca int, 4
  %r64 = add i32 0, 4 ; loadint
  %r65 = load i32, ptr %r54
  %r66 = mul i32 %r65, %r64
  %r67 = add i32 %r3, %r66
  %r68 = load i32, ptr %r67
  store i32 %r68, ptr %r63
  %r70 = load i32, ptr %r63
  %r69 = call i32 @putint(i32 %r70)
  %r71 = add i32 0, 10 ; loadint
  store i32 %r71, ptr %r63
  %r73 = load i32, ptr %r63
  %r72 = call i32 @putch(i32 %r73)
  %r74 = load i32, ptr %r54
  %r75 = add i32 0, 1 ; loadint
  %r76 = add i32 %r74, %r75
  store i32 %r76, ptr %r54
  br label %B15

B17:
  %r77 = add i32 0, 0 ; loadint
  ret i32 %r77

}
define i32 @select_sort(i32, i32){
B0:
  %r3 = alloca int, 4
  store i32 %r2, ptr %r3
  %r4 = alloca int, 4
  %r5 = alloca int, 4
  %r6 = alloca int, 4
  %r7 = add i32 0, 0 ; loadint
  store i32 %r7, ptr %r4
  br label %B1

B1:
  %r8 = load i32, ptr %r4
  %r9 = load i32, ptr %r3
  %r10 = add i32 0, 1 ; loadint
  %r11 = sub i32 %r9, %r10
  %r12 = icmp slt i32 %r8, %r11
  br i1 %r12, label %B2, label %B3

B2:
  %r13 = load i32, ptr %r4
  store i32 %r13, ptr %r6
  %r14 = load i32, ptr %r4
  %r15 = add i32 0, 1 ; loadint
  %r16 = add i32 %r14, %r15
  store i32 %r16, ptr %r5
  br label %B4

B3:
  %r61 = add i32 0, 0 ; loadint
  ret i32 %r61

B4:
  %r17 = load i32, ptr %r5
  %r18 = load i32, ptr %r3
  %r19 = icmp slt i32 %r17, %r18
  br i1 %r19, label %B5, label %B6

B5:
  br label %B7

B6:
  br label %B10

B7:
  %r20 = add i32 0, 4 ; loadint
  %r21 = load i32, ptr %r6
  %r22 = mul i32 %r21, %r20
  %r23 = add i32 %r1, %r22
  %r24 = load i32, ptr %r23
  %r25 = add i32 0, 4 ; loadint
  %r26 = load i32, ptr %r5
  %r27 = mul i32 %r26, %r25
  %r28 = add i32 %r1, %r27
  %r29 = load i32, ptr %r28
  %r30 = icmp sgt i32 %r24, %r29
  br i1 %r30, label %B8, label %B9

B8:
  %r31 = load i32, ptr %r5
  store i32 %r31, ptr %r6
  br label %B9

B9:
  %r32 = load i32, ptr %r5
  %r33 = add i32 0, 1 ; loadint
  %r34 = add i32 %r32, %r33
  store i32 %r34, ptr %r5
  br label %B4

B10:
  %r35 = load i32, ptr %r6
  %r36 = load i32, ptr %r4
  %r37 = icmp ne i32 %r35, %r36
  br i1 %r37, label %B11, label %B12

B11:
  %r38 = alloca int, 4
  %r39 = add i32 0, 4 ; loadint
  %r40 = load i32, ptr %r6
  %r41 = mul i32 %r40, %r39
  %r42 = add i32 %r1, %r41
  %r43 = load i32, ptr %r42
  store i32 %r43, ptr %r38
  %r44 = add i32 0, 4 ; loadint
  %r45 = load i32, ptr %r4
  %r46 = mul i32 %r45, %r44
  %r47 = add i32 %r1, %r46
  %r48 = load i32, ptr %r47
  %r49 = add i32 0, 4 ; loadint
  %r50 = load i32, ptr %r6
  %r51 = mul i32 %r50, %r49
  %r52 = add i32 %r1, %r51
  store i32 %r48, ptr %r52
  %r53 = load i32, ptr %r38
  %r54 = add i32 0, 4 ; loadint
  %r55 = load i32, ptr %r4
  %r56 = mul i32 %r55, %r54
  %r57 = add i32 %r1, %r56
  store i32 %r53, ptr %r57
  br label %B12

B12:
  %r58 = load i32, ptr %r4
  %r59 = add i32 0, 1 ; loadint
  %r60 = add i32 %r58, %r59
  store i32 %r60, ptr %r4
  br label %B1

}
