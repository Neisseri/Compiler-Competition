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
  %r54 = alloca int, 4
  %r55 = call i32 @insertsort(i32 %r3)
  store i32 %r55, ptr %r54
  br label %B12

B12:
  %r56 = load i32, ptr %r54
  %r57 = loadaddr @n#0
  %r58 = load i32, ptr %r57
  %r59 = icmp slt i32 %r56, %r58
  br i1 %r59, label %B13, label %B14

B13:
  %r60 = alloca int, 4
  %r61 = add i32 0, 4 ; loadint
  %r62 = load i32, ptr %r54
  %r63 = mul i32 %r62, %r61
  %r64 = add i32 %r3, %r63
  %r65 = load i32, ptr %r64
  store i32 %r65, ptr %r60
  %r67 = load i32, ptr %r60
  %r66 = call i32 @putint(i32 %r67)
  %r68 = add i32 0, 10 ; loadint
  store i32 %r68, ptr %r60
  %r70 = load i32, ptr %r60
  %r69 = call i32 @putch(i32 %r70)
  %r71 = load i32, ptr %r54
  %r72 = add i32 0, 1 ; loadint
  %r73 = add i32 %r71, %r72
  store i32 %r73, ptr %r54
  br label %B12

B14:
  %r74 = add i32 0, 0 ; loadint
  ret i32 %r74

}
define i32 @insertsort(i32){
B0:
  %r2 = alloca int, 4
  %r3 = add i32 0, 1 ; loadint
  store i32 %r3, ptr %r2
  br label %B1

B1:
  %r4 = load i32, ptr %r2
  %r5 = loadaddr @n#0
  %r6 = load i32, ptr %r5
  %r7 = icmp slt i32 %r4, %r6
  br i1 %r7, label %B2, label %B3

B2:
  %r8 = alloca int, 4
  %r9 = add i32 0, 4 ; loadint
  %r10 = load i32, ptr %r2
  %r11 = mul i32 %r10, %r9
  %r12 = add i32 %r1, %r11
  %r13 = load i32, ptr %r12
  store i32 %r13, ptr %r8
  %r14 = alloca int, 4
  %r15 = load i32, ptr %r2
  %r16 = add i32 0, 1 ; loadint
  %r17 = sub i32 %r15, %r16
  store i32 %r17, ptr %r14
  br label %B4

B3:
  %r57 = add i32 0, 0 ; loadint
  ret i32 %r57

B4:
  %r18 = alloca int, 4
  %r19 = load i32, ptr %r14
  %r20 = add i32 0, 1 ; loadint
  %r22 = add i32 0, 0 ; loadint
  %r21 = sub i32 %r22, %r20
  %r23 = icmp sgt i32 %r19, %r21
  br i1 %r23, label %B7, label %B8

B5:
  %r33 = add i32 0, 4 ; loadint
  %r34 = load i32, ptr %r14
  %r35 = mul i32 %r34, %r33
  %r36 = add i32 %r1, %r35
  %r37 = load i32, ptr %r36
  %r38 = add i32 0, 4 ; loadint
  %r39 = load i32, ptr %r14
  %r40 = add i32 0, 1 ; loadint
  %r41 = add i32 %r39, %r40
  %r42 = mul i32 %r41, %r38
  %r43 = add i32 %r1, %r42
  store i32 %r37, ptr %r43
  %r44 = load i32, ptr %r14
  %r45 = add i32 0, 1 ; loadint
  %r46 = sub i32 %r44, %r45
  store i32 %r46, ptr %r14
  br label %B4

B6:
  %r47 = load i32, ptr %r8
  %r48 = add i32 0, 4 ; loadint
  %r49 = load i32, ptr %r14
  %r50 = add i32 0, 1 ; loadint
  %r51 = add i32 %r49, %r50
  %r52 = mul i32 %r51, %r48
  %r53 = add i32 %r1, %r52
  store i32 %r47, ptr %r53
  %r54 = load i32, ptr %r2
  %r55 = add i32 0, 1 ; loadint
  %r56 = add i32 %r54, %r55
  store i32 %r56, ptr %r2
  br label %B1

B7:
  %r24 = load i32, ptr %r8
  %r25 = add i32 0, 4 ; loadint
  %r26 = load i32, ptr %r14
  %r27 = mul i32 %r26, %r25
  %r28 = add i32 %r1, %r27
  %r29 = load i32, ptr %r28
  %r30 = icmp slt i32 %r24, %r29
  store i32 %r30, ptr %r18
  br label %B9

B8:
  %r31 = add i32 0, 0 ; loadint
  store i32 %r31, ptr %r18
  br label %B9

B9:
  %r32 = load i32, ptr %r18
  br i1 %r32, label %B5, label %B6

}
