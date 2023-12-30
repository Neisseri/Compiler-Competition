; module
define i32 @main(){
B0:
  %r3 = add i32 0, 10 ; loadint
  %r4 = add i32 0, 1 ; loadint
  %r6 = add i32 0, 0 ; loadint
  %r5 = sub i32 %r6, %r4
  %r9 = add i32 %r3, %r5
  ret i32 %r9

}
