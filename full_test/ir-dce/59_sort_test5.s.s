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
  %r54 = alloca int, 4
  %r55 = add i32 0, 0 ; loadint
  store i32 %r55, ptr %r54
  %r57 = loadaddr @n#0
  %r58 = load i32, ptr %r57
  %r56 = call i32 @heap_sort(i32 %r3, i32 %r58)
  store i32 %r56, ptr %r54
  br label %B27

B27:
  %r59 = load i32, ptr %r54
  %r60 = loadaddr @n#0
  %r61 = load i32, ptr %r60
  %r62 = icmp slt i32 %r59, %r61
  br i1 %r62, label %B28, label %B29

B28:
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
  br label %B27

B29:
  %r77 = add i32 0, 0 ; loadint
  ret i32 %r77

}
define i32 @heap_sort(i32, i32){
B18:
  %r3 = alloca int, 4
  store i32 %r2, ptr %r3
  %r4 = alloca int, 4
  %r5 = alloca int, 4
  %r6 = load i32, ptr %r3
  %r7 = add i32 0, 2 ; loadint
  %r8 = sdiv i32 %r6, %r7
  %r9 = add i32 0, 1 ; loadint
  %r10 = sub i32 %r8, %r9
  store i32 %r10, ptr %r4
  br label %B19

B19:
  %r11 = load i32, ptr %r4
  %r12 = add i32 0, 1 ; loadint
  %r14 = add i32 0, 0 ; loadint
  %r13 = sub i32 %r14, %r12
  %r15 = icmp sgt i32 %r11, %r13
  br i1 %r15, label %B20, label %B21

B20:
  %r16 = load i32, ptr %r3
  %r17 = add i32 0, 1 ; loadint
  %r18 = sub i32 %r16, %r17
  store i32 %r18, ptr %r5
  %r20 = load i32, ptr %r4
  %r21 = load i32, ptr %r5
  %r19 = call i32 @heap_ajust(i32 %r1, i32 %r20, i32 %r21)
  store i32 %r19, ptr %r5
  %r22 = load i32, ptr %r4
  %r23 = add i32 0, 1 ; loadint
  %r24 = sub i32 %r22, %r23
  store i32 %r24, ptr %r4
  br label %B19

B21:
  %r25 = load i32, ptr %r3
  %r26 = add i32 0, 1 ; loadint
  %r27 = sub i32 %r25, %r26
  store i32 %r27, ptr %r4
  br label %B22

B22:
  %r28 = load i32, ptr %r4
  %r29 = add i32 0, 0 ; loadint
  %r30 = icmp sgt i32 %r28, %r29
  br i1 %r30, label %B23, label %B24

B23:
  %r31 = alloca int, 4
  %r32 = add i32 0, 0 ; loadint
  store i32 %r32, ptr %r31
  %r34 = load i32, ptr %r31
  %r35 = load i32, ptr %r4
  %r33 = call i32 @swap(i32 %r1, i32 %r34, i32 %r35)
  store i32 %r33, ptr %r5
  %r36 = load i32, ptr %r4
  %r37 = add i32 0, 1 ; loadint
  %r38 = sub i32 %r36, %r37
  store i32 %r38, ptr %r5
  %r40 = load i32, ptr %r31
  %r41 = load i32, ptr %r5
  %r39 = call i32 @heap_ajust(i32 %r1, i32 %r40, i32 %r41)
  store i32 %r39, ptr %r5
  %r42 = load i32, ptr %r4
  %r43 = add i32 0, 1 ; loadint
  %r44 = sub i32 %r42, %r43
  store i32 %r44, ptr %r4
  br label %B22

B24:
  %r45 = add i32 0, 0 ; loadint
  ret i32 %r45

}
define i32 @heap_ajust(i32, i32, i32){
B2:
  %r4 = alloca int, 4
  store i32 %r2, ptr %r4
  %r5 = alloca int, 4
  store i32 %r3, ptr %r5
  %r6 = alloca int, 4
  %r7 = load i32, ptr %r4
  store i32 %r7, ptr %r6
  %r8 = alloca int, 4
  %r9 = load i32, ptr %r6
  %r10 = add i32 0, 2 ; loadint
  %r11 = mul i32 %r9, %r10
  %r12 = add i32 0, 1 ; loadint
  %r13 = add i32 %r11, %r12
  store i32 %r13, ptr %r8
  br label %B3

B3:
  %r14 = load i32, ptr %r8
  %r15 = load i32, ptr %r5
  %r16 = add i32 0, 1 ; loadint
  %r17 = add i32 %r15, %r16
  %r18 = icmp slt i32 %r14, %r17
  br i1 %r18, label %B4, label %B5

B4:
  br label %B6

B5:
  %r62 = add i32 0, 0 ; loadint
  ret i32 %r62

B6:
  %r19 = alloca int, 4
  %r20 = load i32, ptr %r8
  %r21 = load i32, ptr %r5
  %r22 = icmp slt i32 %r20, %r21
  br i1 %r22, label %B7, label %B8

B7:
  %r23 = add i32 0, 4 ; loadint
  %r24 = load i32, ptr %r8
  %r25 = mul i32 %r24, %r23
  %r26 = add i32 %r1, %r25
  %r27 = load i32, ptr %r26
  %r28 = add i32 0, 4 ; loadint
  %r29 = load i32, ptr %r8
  %r30 = add i32 0, 1 ; loadint
  %r31 = add i32 %r29, %r30
  %r32 = mul i32 %r31, %r28
  %r33 = add i32 %r1, %r32
  %r34 = load i32, ptr %r33
  %r35 = icmp slt i32 %r27, %r34
  store i32 %r35, ptr %r19
  br label %B9

B8:
  %r36 = add i32 0, 0 ; loadint
  store i32 %r36, ptr %r19
  br label %B9

B9:
  %r37 = load i32, ptr %r19
  br i1 %r37, label %B10, label %B11

B10:
  %r38 = load i32, ptr %r8
  %r39 = add i32 0, 1 ; loadint
  %r40 = add i32 %r38, %r39
  store i32 %r40, ptr %r8
  br label %B11

B11:
  br label %B12

B12:
  %r41 = add i32 0, 4 ; loadint
  %r42 = load i32, ptr %r6
  %r43 = mul i32 %r42, %r41
  %r44 = add i32 %r1, %r43
  %r45 = load i32, ptr %r44
  %r46 = add i32 0, 4 ; loadint
  %r47 = load i32, ptr %r8
  %r48 = mul i32 %r47, %r46
  %r49 = add i32 %r1, %r48
  %r50 = load i32, ptr %r49
  %r51 = icmp sgt i32 %r45, %r50
  br i1 %r51, label %B13, label %B14

B13:
  %r52 = add i32 0, 0 ; loadint
  ret i32 %r52

B14:
  %r54 = load i32, ptr %r6
  %r55 = load i32, ptr %r8
  %r53 = call i32 @swap(i32 %r1, i32 %r54, i32 %r55)
  store i32 %r53, ptr %r6
  %r56 = load i32, ptr %r8
  store i32 %r56, ptr %r6
  %r57 = load i32, ptr %r6
  %r58 = add i32 0, 2 ; loadint
  %r59 = mul i32 %r57, %r58
  %r60 = add i32 0, 1 ; loadint
  %r61 = add i32 %r59, %r60
  store i32 %r61, ptr %r8
  br label %B15

B15:
  br label %B3

}
define i32 @swap(i32, i32, i32){
B0:
  %r4 = alloca int, 4
  store i32 %r2, ptr %r4
  %r5 = alloca int, 4
  store i32 %r3, ptr %r5
  %r6 = alloca int, 4
  %r7 = add i32 0, 4 ; loadint
  %r8 = load i32, ptr %r4
  %r9 = mul i32 %r8, %r7
  %r10 = add i32 %r1, %r9
  %r11 = load i32, ptr %r10
  store i32 %r11, ptr %r6
  %r12 = add i32 0, 4 ; loadint
  %r13 = load i32, ptr %r5
  %r14 = mul i32 %r13, %r12
  %r15 = add i32 %r1, %r14
  %r16 = load i32, ptr %r15
  %r17 = add i32 0, 4 ; loadint
  %r18 = load i32, ptr %r4
  %r19 = mul i32 %r18, %r17
  %r20 = add i32 %r1, %r19
  store i32 %r16, ptr %r20
  %r21 = load i32, ptr %r6
  %r22 = add i32 0, 4 ; loadint
  %r23 = load i32, ptr %r5
  %r24 = mul i32 %r23, %r22
  %r25 = add i32 %r1, %r24
  store i32 %r21, ptr %r25
  %r26 = add i32 0, 0 ; loadint
  ret i32 %r26

}
