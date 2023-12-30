; module
define i32 @main(){
B0:
  %r1 = alloca int, 4
  %r2 = alloca int, 4
  %r3 = alloca int, 4
  %r4 = alloca int, 4
  %r5 = add i32 0, 10 ; loadint
  store i32 %r5, ptr %r1
  %r6 = add i32 0, 4 ; loadint
  store i32 %r6, ptr %r2
  %r7 = add i32 0, 2 ; loadint
  store i32 %r7, ptr %r3
  %r8 = add i32 0, 2 ; loadint
  store i32 %r8, ptr %r4
  %r9 = load i32, ptr %r3
  %r10 = load i32, ptr %r1
  %r11 = add i32 %r9, %r10
  %r12 = load i32, ptr %r2
  %r13 = load i32, ptr %r4
  %r14 = sub i32 %r12, %r13
  %r15 = mul i32 %r11, %r14
  ret i32 %r15

}
