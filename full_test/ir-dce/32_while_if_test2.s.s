; module
define i32 @main(){
B12:
  %r1 = call i32 @ifWhile()
  ret i32 %r1

}
define i32 @ifWhile(){
B0:
  %r1 = alloca int, 4
  %r2 = add i32 0, 0 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca int, 4
  %r4 = add i32 0, 3 ; loadint
  store i32 %r4, ptr %r3
  br label %B1

B1:
  %r5 = load i32, ptr %r1
  %r6 = add i32 0, 5 ; loadint
  %r7 = icmp eq i32 %r5, %r6
  br i1 %r7, label %B2, label %B3

B2:
  br label %B5

B3:
  br label %B8

B4:
  %r26 = load i32, ptr %r3
  ret i32 %r26

B5:
  %r8 = load i32, ptr %r3
  %r9 = add i32 0, 2 ; loadint
  %r10 = icmp eq i32 %r8, %r9
  br i1 %r10, label %B6, label %B7

B6:
  %r11 = load i32, ptr %r3
  %r12 = add i32 0, 2 ; loadint
  %r13 = add i32 %r11, %r12
  store i32 %r13, ptr %r3
  br label %B5

B7:
  %r14 = load i32, ptr %r3
  %r15 = add i32 0, 25 ; loadint
  %r16 = add i32 %r14, %r15
  store i32 %r16, ptr %r3
  br label %B4

B8:
  %r17 = load i32, ptr %r1
  %r18 = add i32 0, 5 ; loadint
  %r19 = icmp slt i32 %r17, %r18
  br i1 %r19, label %B9, label %B10

B9:
  %r20 = load i32, ptr %r3
  %r21 = add i32 0, 2 ; loadint
  %r22 = mul i32 %r20, %r21
  store i32 %r22, ptr %r3
  %r23 = load i32, ptr %r1
  %r24 = add i32 0, 1 ; loadint
  %r25 = add i32 %r23, %r24
  store i32 %r25, ptr %r1
  br label %B8

B10:
  br label %B4

}
