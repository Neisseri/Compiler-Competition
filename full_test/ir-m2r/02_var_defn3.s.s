; module
define i32 @main(){
B0:
  %r4 = add i32 0, 1 ; loadint
  %r5 = add i32 0, 2 ; loadint
  %r6 = add i32 0, 3 ; loadint
  %r9 = add i32 %r5, %r6
  ret i32 %r9

}
