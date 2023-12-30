; module
define i32 @main(){
B0:
  %r2 = add i32 0, 0 ; loadint
  %r4 = add i32 0, 0 ; loadint
  br label %B1

B1:
  %r18 = phi i32 [ %r4, %B0 ], [ %r13, %B6 ]
  %r19 = phi i32 [ %r2, %B0 ], [ %r16, %B6 ]
  %r6 = add i32 0, 100 ; loadint
  %r7 = icmp slt i32 %r19, %r6
  br i1 %r7, label %B2, label %B3

B2:
  br label %B4

B3:
  ret i32 %r18

B4:
  %r9 = add i32 0, 50 ; loadint
  %r10 = icmp eq i32 %r19, %r9
  br i1 %r10, label %B5, label %B6

B5:
  br label %B3

B6:
  %r13 = add i32 %r18, %r19
  %r15 = add i32 0, 1 ; loadint
  %r16 = add i32 %r19, %r15
  br label %B1

}
