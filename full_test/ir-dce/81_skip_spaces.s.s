; module
define i32 @main(){
B0:
  %r1 = alloca int [100], 400
  %r2 = alloca int, 4
  %r3 = add i32 0, 0 ; loadint
  store i32 %r3, ptr %r2
  %r4 = alloca int, 4
  %r5 = add i32 0, 0 ; loadint
  store i32 %r5, ptr %r4
  br label %B1

B1:
  %r6 = call i32 @getint()
  br i1 %r6, label %B2, label %B3

B2:
  %r7 = call i32 @getint()
  %r8 = add i32 0, 4 ; loadint
  %r9 = load i32, ptr %r2
  %r10 = mul i32 %r9, %r8
  %r11 = add i32 %r1, %r10
  store i32 %r7, ptr %r11
  %r12 = load i32, ptr %r2
  %r13 = add i32 0, 1 ; loadint
  %r14 = add i32 %r12, %r13
  store i32 %r14, ptr %r2
  br label %B1

B3:
  br label %B4

B4:
  %r15 = load i32, ptr %r2
  br i1 %r15, label %B5, label %B6

B5:
  %r16 = load i32, ptr %r2
  %r17 = add i32 0, 1 ; loadint
  %r18 = sub i32 %r16, %r17
  store i32 %r18, ptr %r2
  %r19 = load i32, ptr %r4
  %r20 = add i32 0, 4 ; loadint
  %r21 = load i32, ptr %r2
  %r22 = mul i32 %r21, %r20
  %r23 = add i32 %r1, %r22
  %r24 = load i32, ptr %r23
  %r25 = add i32 %r19, %r24
  store i32 %r25, ptr %r4
  br label %B4

B6:
  %r26 = load i32, ptr %r4
  %r27 = add i32 0, 79 ; loadint
  %r28 = srem i32 %r26, %r27
  ret i32 %r28

}
