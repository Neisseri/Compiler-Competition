; module
@ascii_0#0 = global const int 48, 4
define i32 @main(){
B33:
  %r1 = alloca int, 4
  %r2 = call i32 @my_getint()
  store i32 %r2, ptr %r1
  br label %B34

B34:
  %r3 = load i32, ptr %r1
  %r4 = add i32 0, 0 ; loadint
  %r5 = icmp sgt i32 %r3, %r4
  br i1 %r5, label %B35, label %B36

B35:
  %r6 = alloca int, 4
  %r7 = call i32 @my_getint()
  store i32 %r7, ptr %r6
  %r9 = load i32, ptr %r6
  %r8 = call@my_putint(i32 %r9)
  %r11 = add i32 0, 10 ; loadint
  %r10 = call i32 @putch(i32 %r11)
  %r12 = load i32, ptr %r1
  %r13 = add i32 0, 1 ; loadint
  %r14 = sub i32 %r12, %r13
  store i32 %r14, ptr %r1
  br label %B34

B36:
  %r15 = add i32 0, 0 ; loadint
  ret i32 %r15

}
define void @my_putint(i32){
B25:
  %r2 = alloca int, 4
  store i32 %r1, ptr %r2
  %r3 = alloca int [16], 64
  %r4 = alloca int, 4
  %r5 = add i32 0, 0 ; loadint
  store i32 %r5, ptr %r4
  br label %B26

B26:
  %r6 = load i32, ptr %r2
  %r7 = add i32 0, 0 ; loadint
  %r8 = icmp sgt i32 %r6, %r7
  br i1 %r8, label %B27, label %B28

B27:
  %r9 = load i32, ptr %r2
  %r10 = add i32 0, 10 ; loadint
  %r11 = srem i32 %r9, %r10
  %r12 = loadaddr @ascii_0#0
  %r13 = load i32, ptr %r12
  %r14 = add i32 %r11, %r13
  %r15 = add i32 0, 4 ; loadint
  %r16 = load i32, ptr %r4
  %r17 = mul i32 %r16, %r15
  %r18 = add i32 %r3, %r17
  store i32 %r14, ptr %r18
  %r19 = load i32, ptr %r2
  %r20 = add i32 0, 10 ; loadint
  %r21 = sdiv i32 %r19, %r20
  store i32 %r21, ptr %r2
  %r22 = load i32, ptr %r4
  %r23 = add i32 0, 1 ; loadint
  %r24 = add i32 %r22, %r23
  store i32 %r24, ptr %r4
  br label %B26

B28:
  br label %B29

B29:
  %r25 = load i32, ptr %r4
  %r26 = add i32 0, 0 ; loadint
  %r27 = icmp sgt i32 %r25, %r26
  br i1 %r27, label %B30, label %B31

B30:
  %r28 = load i32, ptr %r4
  %r29 = add i32 0, 1 ; loadint
  %r30 = sub i32 %r28, %r29
  store i32 %r30, ptr %r4
  %r32 = add i32 0, 4 ; loadint
  %r33 = load i32, ptr %r4
  %r34 = mul i32 %r33, %r32
  %r35 = add i32 %r3, %r34
  %r36 = load i32, ptr %r35
  %r31 = call i32 @putch(i32 %r36)
  br label %B29

B31:
  %r37 = add i32 0, 0 ; loadint
  ret i32 %r37

}
define i32 @my_getint(){
B0:
  %r1 = alloca int, 4
  %r2 = add i32 0, 0 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca int, 4
  br label %B1

B1:
  br i1 %r4, label %B2, label %B3

B2:
  %r5 = call i32 @getch()
  %r6 = loadaddr @ascii_0#0
  %r7 = load i32, ptr %r6
  %r8 = sub i32 %r5, %r7
  store i32 %r8, ptr %r3
  br label %B4

B3:
  %r18 = load i32, ptr %r3
  store i32 %r18, ptr %r1
  br label %B13

B4:
  %r9 = alloca int, 4
  %r10 = load i32, ptr %r3
  %r11 = add i32 0, 0 ; loadint
  %r12 = icmp slt i32 %r10, %r11
  br i1 %r12, label %B5, label %B6

B5:
  %r16 = add i32 0, 1 ; loadint
  store i32 %r16, ptr %r9
  br label %B7

B6:
  %r13 = load i32, ptr %r3
  %r14 = add i32 0, 9 ; loadint
  %r15 = icmp sgt i32 %r13, %r14
  store i32 %r15, ptr %r9
  br label %B7

B7:
  %r17 = load i32, ptr %r9
  br i1 %r17, label %B8, label %B9

B8:
  br label %B1

B9:
  br label %B3

B13:
  br i1 %r19, label %B14, label %B15

B14:
  %r20 = call i32 @getch()
  %r21 = loadaddr @ascii_0#0
  %r22 = load i32, ptr %r21
  %r23 = sub i32 %r20, %r22
  store i32 %r23, ptr %r3
  br label %B16

B15:
  %r38 = load i32, ptr %r1
  ret i32 %r38

B16:
  %r24 = alloca int, 4
  %r25 = load i32, ptr %r3
  %r26 = add i32 0, 0 ; loadint
  %r27 = icmp sge i32 %r25, %r26
  br i1 %r27, label %B17, label %B18

B17:
  %r28 = load i32, ptr %r3
  %r29 = add i32 0, 9 ; loadint
  %r30 = icmp sle i32 %r28, %r29
  store i32 %r30, ptr %r24
  br label %B19

B18:
  %r31 = add i32 0, 0 ; loadint
  store i32 %r31, ptr %r24
  br label %B19

B19:
  %r32 = load i32, ptr %r24
  br i1 %r32, label %B20, label %B21

B20:
  %r33 = load i32, ptr %r1
  %r34 = add i32 0, 10 ; loadint
  %r35 = mul i32 %r33, %r34
  %r36 = load i32, ptr %r3
  %r37 = add i32 %r35, %r36
  store i32 %r37, ptr %r1
  br label %B22

B21:
  br label %B15

B22:
  br label %B13

}
