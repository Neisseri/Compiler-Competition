; module
define i32 @main(){
B0:
  %r2 = add i32 0, 10 ; loadint
  %r4 = add i32 0, 2 ; loadint
  %r5 = mul i32 %r2, %r4
  %r6 = add i32 0, 1 ; loadint
  %r7 = add i32 %r5, %r6
  ret i32 %r7

}
