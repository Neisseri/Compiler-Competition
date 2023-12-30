; module
define i32 @main(){
B16:
  %r1 = alloca int, 4
  %r2 = add i32 0, 2 ; loadint
  store i32 %r2, ptr %r1
  %r4 = load i32, ptr %r1
  %r5 = load i32, ptr %r1
  %r3 = call i32 @deepWhileBr(i32 %r4, i32 %r5)
  store i32 %r3, ptr %r1
  %r7 = load i32, ptr %r1
  %r6 = call i32 @putint(i32 %r7)
  %r8 = add i32 0, 0 ; loadint
  ret i32 %r8

}
define i32 @deepWhileBr(i32, i32){
B2:
  %r3 = alloca int, 4
  store i32 %r1, ptr %r3
  %r4 = alloca int, 4
  store i32 %r2, ptr %r4
  %r5 = alloca int, 4
  %r6 = load i32, ptr %r3
  %r7 = load i32, ptr %r4
  %r8 = add i32 %r6, %r7
  store i32 %r8, ptr %r5
  br label %B3

B3:
  %r9 = load i32, ptr %r5
  %r10 = add i32 0, 75 ; loadint
  %r11 = icmp slt i32 %r9, %r10
  br i1 %r11, label %B4, label %B5

B4:
  %r12 = alloca int, 4
  %r13 = add i32 0, 42 ; loadint
  store i32 %r13, ptr %r12
  br label %B6

B5:
  %r34 = load i32, ptr %r5
  ret i32 %r34

B6:
  %r14 = load i32, ptr %r5
  %r15 = add i32 0, 100 ; loadint
  %r16 = icmp slt i32 %r14, %r15
  br i1 %r16, label %B7, label %B8

B7:
  %r17 = load i32, ptr %r5
  %r18 = load i32, ptr %r12
  %r19 = add i32 %r17, %r18
  store i32 %r19, ptr %r5
  br label %B9

B8:
  br label %B3

B9:
  %r20 = load i32, ptr %r5
  %r21 = add i32 0, 99 ; loadint
  %r22 = icmp sgt i32 %r20, %r21
  br i1 %r22, label %B10, label %B11

B10:
  %r23 = alloca int, 4
  %r24 = load i32, ptr %r12
  %r25 = add i32 0, 2 ; loadint
  %r26 = mul i32 %r24, %r25
  store i32 %r26, ptr %r23
  br label %B12

B11:
  br label %B8

B12:
  %r28 = add i32 0, 0 ; loadint
  %r27 = call i32 @get_one(i32 %r28)
  %r29 = add i32 0, 1 ; loadint
  %r30 = icmp eq i32 %r27, %r29
  br i1 %r30, label %B13, label %B14

B13:
  %r31 = load i32, ptr %r23
  %r32 = add i32 0, 2 ; loadint
  %r33 = mul i32 %r31, %r32
  store i32 %r33, ptr %r5
  br label %B14

B14:
  br label %B11

}
define i32 @get_one(i32){
B0:
  %r2 = alloca int, 4
  store i32 %r1, ptr %r2
  %r3 = add i32 0, 1 ; loadint
  ret i32 %r3

}
