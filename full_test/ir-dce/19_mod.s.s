; module
define i32 @main(){
B0:
  %r1 = alloca int, 4
  %r2 = add i32 0, 10 ; loadint
  store i32 %r2, ptr %r1
  %r3 = load i32, ptr %r1
  %r4 = add i32 0, 3 ; loadint
  %r5 = sdiv i32 %r3, %r4
  ret i32 %r5

}
