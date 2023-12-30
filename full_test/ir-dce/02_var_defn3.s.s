; module
define i32 @main(){
B0:
  %r1 = alloca int, 4
  %r2 = alloca int, 4
  %r3 = alloca int, 4
  %r4 = add i32 0, 1 ; loadint
  store i32 %r4, ptr %r1
  %r5 = add i32 0, 2 ; loadint
  store i32 %r5, ptr %r2
  %r6 = add i32 0, 3 ; loadint
  store i32 %r6, ptr %r3
  %r7 = load i32, ptr %r2
  %r8 = load i32, ptr %r3
  %r9 = add i32 %r7, %r8
  ret i32 %r9

}
