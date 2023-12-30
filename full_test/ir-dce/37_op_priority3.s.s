; module
define i32 @main(){
B0:
  %r1 = alloca int, 4
  %r2 = alloca int, 4
  %r3 = add i32 0, 10 ; loadint
  store i32 %r3, ptr %r1
  %r4 = add i32 0, 30 ; loadint
  store i32 %r4, ptr %r2
  %r5 = load i32, ptr %r1
  %r6 = add i32 0, 5 ; loadint
  %r8 = add i32 0, 0 ; loadint
  %r7 = sub i32 %r8, %r6
  %r9 = sub i32 %r5, %r7
  %r10 = load i32, ptr %r2
  %r11 = add i32 %r9, %r10
  %r12 = add i32 0, 5 ; loadint
  %r14 = add i32 0, 0 ; loadint
  %r13 = sub i32 %r14, %r12
  %r15 = add i32 %r11, %r13
  ret i32 %r15

}
