; module
define i32 @main(){
B0:
  %r2 = add i32 0, 10 ; loadint
  %r4 = add i32 0, 2 ; loadint
  %r5 = sub i32 %r2, %r4
  ret i32 %r5

}
