; module
define i32 @main(){
B8:
  %r1 = call i32 @doubleWhile()
  ret i32 %r1

}
define i32 @doubleWhile(){
B0:
  %r1 = alloca int, 4
  %r2 = add i32 0, 5 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca int, 4
  %r4 = add i32 0, 7 ; loadint
  store i32 %r4, ptr %r3
  br label %B1

B1:
  %r5 = load i32, ptr %r1
  %r6 = add i32 0, 100 ; loadint
  %r7 = icmp slt i32 %r5, %r6
  br i1 %r7, label %B2, label %B3

B2:
  %r8 = load i32, ptr %r1
  %r9 = add i32 0, 30 ; loadint
  %r10 = add i32 %r8, %r9
  store i32 %r10, ptr %r1
  br label %B4

B3:
  %r20 = load i32, ptr %r3
  ret i32 %r20

B4:
  %r11 = load i32, ptr %r3
  %r12 = add i32 0, 100 ; loadint
  %r13 = icmp slt i32 %r11, %r12
  br i1 %r13, label %B5, label %B6

B5:
  %r14 = load i32, ptr %r3
  %r15 = add i32 0, 6 ; loadint
  %r16 = add i32 %r14, %r15
  store i32 %r16, ptr %r3
  br label %B4

B6:
  %r17 = load i32, ptr %r3
  %r18 = add i32 0, 100 ; loadint
  %r19 = sub i32 %r17, %r18
  store i32 %r19, ptr %r3
  br label %B1

}
