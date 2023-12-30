; module
define i32 @main(){
B0:
  %r5 = add i32 0, 10 ; loadint
  %r6 = add i32 0, 4 ; loadint
  %r7 = add i32 0, 2 ; loadint
  %r8 = add i32 0, 2 ; loadint
  %r11 = add i32 %r7, %r5
  %r14 = sub i32 %r6, %r8
  %r15 = mul i32 %r11, %r14
  ret i32 %r15

}
