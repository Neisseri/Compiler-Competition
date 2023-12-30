; module
define i32 @main(){
B14:
  %r1 = alloca int, 4
  %r2 = add i32 0, 2 ; loadint
  store i32 %r2, ptr %r1
  %r4 = load i32, ptr %r1
  %r5 = load i32, ptr %r1
  %r3 = call i32 @deepWhileBr(i32 %r4, i32 %r5)
  ret i32 %r3

}
define i32 @deepWhileBr(i32, i32){
B0:
  %r3 = alloca int, 4
  store i32 %r1, ptr %r3
  %r4 = alloca int, 4
  store i32 %r2, ptr %r4
  %r5 = alloca int, 4
  %r6 = load i32, ptr %r3
  %r7 = load i32, ptr %r4
  %r8 = add i32 %r6, %r7
  store i32 %r8, ptr %r5
  br label %B1

B1:
  %r9 = load i32, ptr %r5
  %r10 = add i32 0, 75 ; loadint
  %r11 = icmp slt i32 %r9, %r10
  br i1 %r11, label %B2, label %B3

B2:
  %r12 = alloca int, 4
  %r13 = add i32 0, 42 ; loadint
  store i32 %r13, ptr %r12
  br label %B4

B3:
  %r33 = load i32, ptr %r5
  ret i32 %r33

B4:
  %r14 = load i32, ptr %r5
  %r15 = add i32 0, 100 ; loadint
  %r16 = icmp slt i32 %r14, %r15
  br i1 %r16, label %B5, label %B6

B5:
  %r17 = load i32, ptr %r5
  %r18 = load i32, ptr %r12
  %r19 = add i32 %r17, %r18
  store i32 %r19, ptr %r5
  br label %B7

B6:
  br label %B1

B7:
  %r20 = load i32, ptr %r5
  %r21 = add i32 0, 99 ; loadint
  %r22 = icmp sgt i32 %r20, %r21
  br i1 %r22, label %B8, label %B9

B8:
  %r23 = alloca int, 4
  %r24 = load i32, ptr %r12
  %r25 = add i32 0, 2 ; loadint
  %r26 = mul i32 %r24, %r25
  store i32 %r26, ptr %r23
  br label %B10

B9:
  br label %B6

B10:
  %r27 = add i32 0, 1 ; loadint
  %r28 = add i32 0, 1 ; loadint
  %r29 = icmp eq i32 %r27, %r28
  br i1 %r29, label %B11, label %B12

B11:
  %r30 = load i32, ptr %r23
  %r31 = add i32 0, 2 ; loadint
  %r32 = mul i32 %r30, %r31
  store i32 %r32, ptr %r5
  br label %B12

B12:
  br label %B9

}
