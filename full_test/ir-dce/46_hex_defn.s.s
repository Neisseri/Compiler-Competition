; module
define i32 @main(){
B0:
  %r1 = alloca int, 4
  %r2 = add i32 0, 15 ; loadint
  store i32 %r2, ptr %r1
  %r3 = load i32, ptr %r1
  ret i32 %r3

}
