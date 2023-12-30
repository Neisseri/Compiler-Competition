; module
define i32 @main(){
B0:
  %r1 = alloca int, 4
  %r2 = alloca int, 4
  %r3 = add i32 0, 15 ; loadint
  store i32 %r3, ptr %r1
  %r4 = add i32 0, 12 ; loadint
  store i32 %r4, ptr %r2
  %r5 = load i32, ptr %r1
  %r6 = load i32, ptr %r2
  %r7 = add i32 %r5, %r6
  %r8 = add i32 0, 61 ; loadint
  %r9 = add i32 %r7, %r8
  ret i32 %r9

}
