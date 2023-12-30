; module
define i32 @main(){
B9:
  %r1 = call i32 @if_if_Else()
  ret i32 %r1

}
define i32 @if_if_Else(){
B0:
  %r2 = add i32 0, 5 ; loadint
  %r4 = add i32 0, 10 ; loadint
  br label %B1

B1:
  %r6 = add i32 0, 5 ; loadint
  %r7 = icmp eq i32 %r2, %r6
  br i1 %r7, label %B2, label %B3

B2:
  br label %B5

B3:
  %r13 = add i32 0, 15 ; loadint
  %r14 = add i32 %r2, %r13
  br label %B4

B4:
  %r3 = phi i32 [ %r2, %B7 ], [ %r14, %B3 ]
  ret i32 %r3

B5:
  %r9 = add i32 0, 10 ; loadint
  %r10 = icmp eq i32 %r4, %r9
  br i1 %r10, label %B6, label %B7

B6:
  %r11 = add i32 0, 25 ; loadint
  br label %B7

B7:
  %r2 = phi i32 [ %r2, %B5 ], [ %r11, %B6 ]
  br label %B4

}
