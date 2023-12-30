; module
define i32 @main(){
B0:
  %r1 = alloca int, 4
  %r2 = alloca int, 4
  %r3 = add i32 0, 10 ; loadint
  store i32 %r3, ptr %r1
  %r4 = add i32 0, 1 ; loadint
  %r6 = add i32 0, 0 ; loadint
  %r5 = sub i32 %r6, %r4
  store i32 %r5, ptr %r2
  %r7 = load i32, ptr %r1
  %r8 = load i32, ptr %r2
  %r9 = add i32 %r7, %r8
  ret i32 %r9

}
