; module
define i32 @main(){
B0:
  %r1 = alloca i32, i32 4
  %r2 = alloca i32, i32 4
  %r3 = alloca i32, i32 4
  %r4 = alloca i32, i32 4
  %r5 = alloca i32, i32 4
  %r6 = add i32 0, 5 ; loadint
  store i32 %r6, ptr %r1
  %r7 = add i32 0, 5 ; loadint
  store i32 %r7, ptr %r2
  %r8 = add i32 0, 1 ; loadint
  store i32 %r8, ptr %r3
  %r9 = add i32 0, 2 ; loadint
  %r11 = add i32 0, 0 ; loadint
  %r10 = sub i32 %r11, %r9
  store i32 %r10, ptr %r4
  %r12 = add i32 0, 2 ; loadint
  store i32 %r12, ptr %r5
  br label %B1

B1:
  %r13 = alloca i32, i32 4
  %r14 = load i32, ptr %r4
  %r15 = add i32 0, 1 ; loadint
  %r16 = mul i32 %r14, %r15
  %r17 = add i32 0, 2 ; loadint
  %r18 = sdiv i32 %r16, %r17
  %r19 = add i32 0, 0 ; loadint
  %r20 = icmp slt i32 %r18, %r19
  br i1 %r20, label %B2, label %B3

B2:
  %r36 = add i32 0, 1 ; loadint
  store i32 %r36, ptr %r13
  br label %B4

B3:
  %r21 = alloca i32, i32 4
  %r22 = load i32, ptr %r1
  %r23 = load i32, ptr %r2
  %r24 = sub i32 %r22, %r23
  %r25 = add i32 0, 0 ; loadint
  %r26 = icmp ne i32 %r24, %r25
  br i1 %r26, label %B5, label %B6

B4:
  %r37 = load i32, ptr %r13
  br i1 %r37, label %B8, label %B9

B5:
  %r27 = load i32, ptr %r3
  %r28 = add i32 0, 3 ; loadint
  %r29 = add i32 %r27, %r28
  %r30 = add i32 0, 2 ; loadint
  %r31 = srem i32 %r29, %r30
  %r32 = add i32 0, 0 ; loadint
  %r33 = icmp ne i32 %r31, %r32
  store i32 %r33, ptr %r21
  br label %B7

B6:
  %r34 = add i32 0, 0 ; loadint
  store i32 %r34, ptr %r21
  br label %B7

B7:
  %r35 = load i32, ptr %r21
  store i32 %r35, ptr %r13
  br label %B4

B8:
  %r39 = load i32, ptr %r5
  %r38 = call i32 @putint(i32 %r39)
  br label %B9

B9:
  br label %B10

B10:
  %r40 = alloca i32, i32 4
  %r41 = load i32, ptr %r4
  %r42 = add i32 0, 2 ; loadint
  %r43 = srem i32 %r41, %r42
  %r44 = add i32 0, 67 ; loadint
  %r45 = add i32 %r43, %r44
  %r46 = add i32 0, 0 ; loadint
  %r47 = icmp slt i32 %r45, %r46
  br i1 %r47, label %B11, label %B12

B11:
  %r63 = add i32 0, 1 ; loadint
  store i32 %r63, ptr %r40
  br label %B13

B12:
  %r48 = alloca i32, i32 4
  %r49 = load i32, ptr %r1
  %r50 = load i32, ptr %r2
  %r51 = sub i32 %r49, %r50
  %r52 = add i32 0, 0 ; loadint
  %r53 = icmp ne i32 %r51, %r52
  br i1 %r53, label %B14, label %B15

B13:
  %r64 = load i32, ptr %r40
  br i1 %r64, label %B17, label %B18

B14:
  %r54 = load i32, ptr %r3
  %r55 = add i32 0, 2 ; loadint
  %r56 = add i32 %r54, %r55
  %r57 = add i32 0, 2 ; loadint
  %r58 = srem i32 %r56, %r57
  %r59 = add i32 0, 0 ; loadint
  %r60 = icmp ne i32 %r58, %r59
  store i32 %r60, ptr %r48
  br label %B16

B15:
  %r61 = add i32 0, 0 ; loadint
  store i32 %r61, ptr %r48
  br label %B16

B16:
  %r62 = load i32, ptr %r48
  store i32 %r62, ptr %r40
  br label %B13

B17:
  %r65 = add i32 0, 4 ; loadint
  store i32 %r65, ptr %r5
  %r67 = load i32, ptr %r5
  %r66 = call i32 @putint(i32 %r67)
  br label %B18

B18:
  %r68 = add i32 0, 0 ; loadint
  ret i32 %r68

}
