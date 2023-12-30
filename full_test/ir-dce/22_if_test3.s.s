; module
define i32 @main(){
B9:
  %r1 = call i32 @ififElse()
  ret i32 %r1

}
define i32 @ififElse(){
B0:
  %r1 = alloca int, 4
  %r2 = add i32 0, 5 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca int, 4
  %r4 = add i32 0, 10 ; loadint
  store i32 %r4, ptr %r3
  br label %B1

B1:
  %r5 = load i32, ptr %r1
  %r6 = add i32 0, 5 ; loadint
  %r7 = icmp eq i32 %r5, %r6
  br i1 %r7, label %B2, label %B3

B2:
  br label %B4

B3:
  %r15 = load i32, ptr %r1
  ret i32 %r15

B4:
  %r8 = load i32, ptr %r3
  %r9 = add i32 0, 10 ; loadint
  %r10 = icmp eq i32 %r8, %r9
  br i1 %r10, label %B5, label %B6

B5:
  %r11 = add i32 0, 25 ; loadint
  store i32 %r11, ptr %r1
  br label %B7

B6:
  %r12 = load i32, ptr %r1
  %r13 = add i32 0, 15 ; loadint
  %r14 = add i32 %r12, %r13
  store i32 %r14, ptr %r1
  br label %B7

B7:
  br label %B3

}
