; module
define i32 @main(){
B6:
  %r1 = alloca int, 4
  %r2 = add i32 0, 200 ; loadint
  store i32 %r2, ptr %r1
  %r4 = load i32, ptr %r1
  %r3 = call@reverse(i32 %r4)
  %r5 = add i32 0, 0 ; loadint
  ret i32 %r5

}
define void @reverse(i32){
B0:
  %r2 = alloca int, 4
  store i32 %r1, ptr %r2
  %r3 = alloca int, 4
  br label %B1

B1:
  %r4 = load i32, ptr %r2
  %r5 = add i32 0, 1 ; loadint
  %r6 = icmp sle i32 %r4, %r5
  br i1 %r6, label %B2, label %B3

B2:
  %r7 = call i32 @getint()
  store i32 %r7, ptr %r3
  %r9 = load i32, ptr %r3
  %r8 = call i32 @putint(i32 %r9)
  br label %B4

B3:
  %r10 = call i32 @getint()
  store i32 %r10, ptr %r3
  %r12 = load i32, ptr %r2
  %r13 = add i32 0, 1 ; loadint
  %r14 = sub i32 %r12, %r13
  %r11 = call i32 @reverse(i32 %r14)
  %r16 = load i32, ptr %r3
  %r15 = call i32 @putint(i32 %r16)
  br label %B4

B4:
  %r17 = add i32 0, 0 ; loadint
  ret i32 %r17

}
