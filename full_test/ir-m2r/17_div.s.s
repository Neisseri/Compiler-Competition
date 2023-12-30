; module
define i32 @main(){
B0:
  %r3 = add i32 0, 10 ; loadint
  %r4 = add i32 0, 5 ; loadint
  %r7 = sdiv i32 %r3, %r4
  ret i32 %r7

}
