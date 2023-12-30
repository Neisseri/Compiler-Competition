; module
define i32 @main(){
B13:
  %r1 = call i32 @whileIf()
  ret i32 %r1

}
define i32 @whileIf(){
B0:
  %r1 = alloca int, 4
  %r2 = add i32 0, 0 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca int, 4
  %r4 = add i32 0, 0 ; loadint
  store i32 %r4, ptr %r3
  br label %B1

B1:
  %r5 = load i32, ptr %r1
  %r6 = add i32 0, 100 ; loadint
  %r7 = icmp slt i32 %r5, %r6
  br i1 %r7, label %B2, label %B3

B2:
  br label %B4

B3:
  %r22 = load i32, ptr %r3
  ret i32 %r22

B4:
  %r8 = load i32, ptr %r1
  %r9 = add i32 0, 5 ; loadint
  %r10 = icmp eq i32 %r8, %r9
  br i1 %r10, label %B5, label %B6

B5:
  %r11 = add i32 0, 25 ; loadint
  store i32 %r11, ptr %r3
  br label %B7

B6:
  br label %B8

B7:
  %r19 = load i32, ptr %r1
  %r20 = add i32 0, 1 ; loadint
  %r21 = add i32 %r19, %r20
  store i32 %r21, ptr %r1
  br label %B1

B8:
  %r12 = load i32, ptr %r1
  %r13 = add i32 0, 10 ; loadint
  %r14 = icmp eq i32 %r12, %r13
  br i1 %r14, label %B9, label %B10

B9:
  %r15 = add i32 0, 42 ; loadint
  store i32 %r15, ptr %r3
  br label %B11

B10:
  %r16 = load i32, ptr %r1
  %r17 = add i32 0, 2 ; loadint
  %r18 = mul i32 %r16, %r17
  store i32 %r18, ptr %r3
  br label %B11

B11:
  br label %B7

}
