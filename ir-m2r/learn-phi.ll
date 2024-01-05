; module
define i32 @main(){
B0:
  %r2 = add i32 0, 1 ; loadint
  %r4 = add i32 0, 1 ; loadint
  br label %B1

B1:
  %r6 = add i32 0, 0 ; loadint
  %r7 = icmp sgt i32 %r4, %r6
  br i1 %r7, label %B2, label %B3

B2:
  %r8 = add i32 0, 1 ; loadint
  br label %B4

B3:
  %r9 = add i32 0, 1 ; loadint
  %r11 = add i32 0, 0 ; loadint
  %r10 = sub i32 %r11, %r9
  br label %B4

B4:
  %r13 = phi i32 [ %r8, %B2 ], [ %r10, %B3 ]
  ret i32 %r13

}
