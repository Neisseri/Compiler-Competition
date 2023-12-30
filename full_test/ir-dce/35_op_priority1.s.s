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
  %r11 = load i32, ptr %r2
  %r12 = mul i32 %r10, %r11
  %r13 = add i32 %r9, %r12
  %r14 = load i32, ptr %r4
  %r15 = sub i32 %r13, %r14
  ret i32 %r15

}
