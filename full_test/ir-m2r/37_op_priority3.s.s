; module
define i32 @main(){
B0:
  %r3 = add i32 0, 10 ; loadint
  %r4 = add i32 0, 30 ; loadint
  %r6 = add i32 0, 5 ; loadint
  %r8 = add i32 0, 0 ; loadint
  %r7 = sub i32 %r8, %r6
  %r9 = sub i32 %r3, %r7
  %r11 = add i32 %r9, %r4
  %r12 = add i32 0, 5 ; loadint
  %r14 = add i32 0, 0 ; loadint
  %r13 = sub i32 %r14, %r12
  %r15 = add i32 %r11, %r13
  ret i32 %r15

}
