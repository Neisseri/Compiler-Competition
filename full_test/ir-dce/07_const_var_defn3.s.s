; module
define i32 @main(){
B0:
  %r1 = alloca const int, 4
  %r2 = add i32 0, 10 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca const int, 4
  %r4 = add i32 0, 5 ; loadint
  store i32 %r4, ptr %r3
  %r5 = load i32, ptr %r3
  ret i32 %r5

}
