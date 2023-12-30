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
  %r55 = call i32 @bubblesort(i32 %r3)
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
define i32 @bubblesort(i32){
B0:
  %r2 = alloca int, 4
  %r3 = alloca int, 4
  %r4 = add i32 0, 0 ; loadint
  store i32 %r4, ptr %r2
  br label %B1

B1:
  %r5 = load i32, ptr %r2
  %r6 = loadaddr @n#0
  %r7 = load i32, ptr %r6
  %r8 = add i32 0, 1 ; loadint
  %r9 = sub i32 %r7, %r8
  %r10 = icmp slt i32 %r5, %r9
  br i1 %r10, label %B2, label %B3

B2:
  %r11 = add i32 0, 0 ; loadint
  store i32 %r11, ptr %r3
  br label %B4

B3:
  %r63 = add i32 0, 0 ; loadint
  ret i32 %r63

B4:
  %r12 = load i32, ptr %r3
  %r13 = loadaddr @n#0
  %r14 = load i32, ptr %r13
  %r15 = load i32, ptr %r2
  %r16 = sub i32 %r14, %r15
  %r17 = add i32 0, 1 ; loadint
  %r18 = sub i32 %r16, %r17
  %r19 = icmp slt i32 %r12, %r18
  br i1 %r19, label %B5, label %B6

B5:
  br label %B7

B6:
  %r60 = load i32, ptr %r2
  %r61 = add i32 0, 1 ; loadint
  %r62 = add i32 %r60, %r61
  store i32 %r62, ptr %r2
  br label %B1

B7:
  %r20 = add i32 0, 4 ; loadint
  %r21 = load i32, ptr %r3
  %r22 = mul i32 %r21, %r20
  %r23 = add i32 %r1, %r22
  %r24 = load i32, ptr %r23
  %r25 = add i32 0, 4 ; loadint
  %r26 = load i32, ptr %r3
  %r27 = add i32 0, 1 ; loadint
  %r28 = add i32 %r26, %r27
  %r29 = mul i32 %r28, %r25
  %r30 = add i32 %r1, %r29
  %r31 = load i32, ptr %r30
  %r32 = icmp sgt i32 %r24, %r31
  br i1 %r32, label %B8, label %B9

B8:
  %r33 = alloca int, 4
  %r34 = add i32 0, 4 ; loadint
  %r35 = load i32, ptr %r3
  %r36 = add i32 0, 1 ; loadint
  %r37 = add i32 %r35, %r36
  %r38 = mul i32 %r37, %r34
  %r39 = add i32 %r1, %r38
  %r40 = load i32, ptr %r39
  store i32 %r40, ptr %r33
  %r41 = add i32 0, 4 ; loadint
  %r42 = load i32, ptr %r3
  %r43 = mul i32 %r42, %r41
  %r44 = add i32 %r1, %r43
  %r45 = load i32, ptr %r44
  %r46 = add i32 0, 4 ; loadint
  %r47 = load i32, ptr %r3
  %r48 = add i32 0, 1 ; loadint
  %r49 = add i32 %r47, %r48
  %r50 = mul i32 %r49, %r46
  %r51 = add i32 %r1, %r50
  store i32 %r45, ptr %r51
  %r52 = load i32, ptr %r33
  %r53 = add i32 0, 4 ; loadint
  %r54 = load i32, ptr %r3
  %r55 = mul i32 %r54, %r53
  %r56 = add i32 %r1, %r55
  store i32 %r52, ptr %r56
  br label %B9

B9:
  %r57 = load i32, ptr %r3
  %r58 = add i32 0, 1 ; loadint
  %r59 = add i32 %r57, %r58
  store i32 %r59, ptr %r3
  br label %B4

}
