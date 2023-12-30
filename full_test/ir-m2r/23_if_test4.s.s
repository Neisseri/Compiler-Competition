; module
define i32 @main(){
B9:
  %r1 = call i32 @if_ifElse_()
  ret i32 %r1

}
define i32 @if_ifElse_(){
B0:
  %r2 = add i32 0, 5 ; loadint
  %r4 = add i32 0, 10 ; loadint
  br label %B1

B1:
  %r6 = add i32 0, 5 ; loadint
  %r7 = icmp eq i32 %r2, %r6
  br i1 %r7, label %B2, label %B3

B2:
  br label %B4

B3:
  %r3 = phi i32 [ %r2, %B1 ], [ %r2, %B7 ]
  ret i32 %r3

B4:
  %r9 = add i32 0, 10 ; loadint
  %r10 = icmp eq i32 %r4, %r9
  br i1 %r10, label %B5, label %B6

B5:
  %r11 = add i32 0, 25 ; loadint
  br label %B7

B6:
  %r13 = add i32 0, 15 ; loadint
  %r14 = add i32 %r2, %r13
  br label %B7

B7:
  %r2 = phi i32 [ %r11, %B5 ], [ %r14, %B6 ]
  br label %B3

}
