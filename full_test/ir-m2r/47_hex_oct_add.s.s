; module
define i32 @main(){
B0:
  %r3 = add i32 0, 15 ; loadint
  %r4 = add i32 0, 12 ; loadint
  %r7 = add i32 %r3, %r4
  %r8 = add i32 0, 61 ; loadint
  %r9 = add i32 %r7, %r8
  ret i32 %r9

}
