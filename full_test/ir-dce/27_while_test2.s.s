; module
define i32 @main(){
B14:
  %r1 = call i32 @FourWhile()
  ret i32 %r1

}
define i32 @FourWhile(){
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
  %r42 = load i32, ptr %r1
  %r43 = load i32, ptr %r3
  %r44 = load i32, ptr %r7
  %r45 = add i32 %r43, %r44
  %r46 = add i32 %r42, %r45
  %r47 = load i32, ptr %r4
  %r48 = add i32 %r46, %r47
  ret i32 %r48

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
  %r39 = load i32, ptr %r3
  %r40 = add i32 0, 2 ; loadint
  %r41 = sub i32 %r39, %r40
  store i32 %r41, ptr %r3
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
  %r36 = load i32, ptr %r4
  %r37 = add i32 0, 1 ; loadint
  %r38 = add i32 %r36, %r37
  store i32 %r38, ptr %r4
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
  br label %B10

B12:
  %r33 = load i32, ptr %r7
  %r34 = add i32 0, 1 ; loadint
  %r35 = sub i32 %r33, %r34
  store i32 %r35, ptr %r7
  br label %B7

}
