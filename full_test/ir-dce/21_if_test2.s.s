; module
define i32 @main(){
B24:
  %r2 = call i32 @ifElseIf()
  %r1 = call i32 @putint(i32 %r2)
  %r3 = add i32 0, 0 ; loadint
  ret i32 %r3

}
define i32 @ifElseIf(){
B0:
  %r1 = alloca int, 4
  %r2 = add i32 0, 5 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca int, 4
  %r4 = add i32 0, 10 ; loadint
  store i32 %r4, ptr %r3
  br label %B1

B1:
  %r5 = alloca int, 4
  %r6 = load i32, ptr %r1
  %r7 = add i32 0, 6 ; loadint
  %r8 = icmp eq i32 %r6, %r7
  br i1 %r8, label %B2, label %B3

B2:
  %r12 = add i32 0, 1 ; loadint
  store i32 %r12, ptr %r5
  br label %B4

B3:
  %r9 = load i32, ptr %r3
  %r10 = add i32 0, 11 ; loadint
  %r11 = icmp eq i32 %r9, %r10
  store i32 %r11, ptr %r5
  br label %B4

B4:
  %r13 = load i32, ptr %r5
  br i1 %r13, label %B5, label %B6

B5:
  %r14 = load i32, ptr %r1
  ret i32 %r14

B6:
  br label %B9

B7:
  %r42 = load i32, ptr %r1
  ret i32 %r42

B9:
  %r15 = alloca int, 4
  %r16 = load i32, ptr %r3
  %r17 = add i32 0, 10 ; loadint
  %r18 = icmp eq i32 %r16, %r17
  br i1 %r18, label %B10, label %B11

B10:
  %r19 = load i32, ptr %r1
  %r20 = add i32 0, 1 ; loadint
  %r21 = icmp eq i32 %r19, %r20
  store i32 %r21, ptr %r15
  br label %B12

B11:
  %r22 = add i32 0, 0 ; loadint
  store i32 %r22, ptr %r15
  br label %B12

B12:
  %r23 = load i32, ptr %r15
  br i1 %r23, label %B13, label %B14

B13:
  %r24 = add i32 0, 25 ; loadint
  store i32 %r24, ptr %r1
  br label %B15

B14:
  br label %B16

B15:
  br label %B7

B16:
  %r25 = alloca int, 4
  %r26 = load i32, ptr %r3
  %r27 = add i32 0, 10 ; loadint
  %r28 = icmp eq i32 %r26, %r27
  br i1 %r28, label %B17, label %B18

B17:
  %r29 = load i32, ptr %r1
  %r30 = add i32 0, 5 ; loadint
  %r32 = add i32 0, 0 ; loadint
  %r31 = sub i32 %r32, %r30
  %r33 = icmp eq i32 %r29, %r31
  store i32 %r33, ptr %r25
  br label %B19

B18:
  %r34 = add i32 0, 0 ; loadint
  store i32 %r34, ptr %r25
  br label %B19

B19:
  %r35 = load i32, ptr %r25
  br i1 %r35, label %B20, label %B21

B20:
  %r36 = load i32, ptr %r1
  %r37 = add i32 0, 15 ; loadint
  %r38 = add i32 %r36, %r37
  store i32 %r38, ptr %r1
  br label %B22

B21:
  %r39 = load i32, ptr %r1
  %r41 = add i32 0, 0 ; loadint
  %r40 = sub i32 %r41, %r39
  store i32 %r40, ptr %r1
  br label %B22

B22:
  br label %B15

}
