; module
define i32 @main(){
B0:
  %r5 = add i32 0, 10 ; loadint
  %r6 = add i32 0, 4 ; loadint
  %r7 = add i32 0, 2 ; loadint
  %r8 = add i32 0, 2 ; loadint
  %r12 = mul i32 %r5, %r6
  %r13 = add i32 %r7, %r12
  %r15 = sub i32 %r13, %r8
  ret i32 %r15

}
