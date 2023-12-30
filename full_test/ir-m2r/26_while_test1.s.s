; module
define i32 @main(){
B8:
  %r1 = call i32 @doubleWhile()
  ret i32 %r1

}
define i32 @doubleWhile(){
B0:
  %r2 = add i32 0, 5 ; loadint
  %r4 = add i32 0, 7 ; loadint
  br label %B1

B1:
  %r2 = phi i32 [ %r4, %B0 ], [ %r19, %B6 ]
  %r3 = phi i32 [ %r2, %B0 ], [ %r10, %B6 ]
  %r6 = add i32 0, 100 ; loadint
  %r7 = icmp slt i32 %r3, %r6
  br i1 %r7, label %B2, label %B3

B2:
  %r9 = add i32 0, 30 ; loadint
  %r10 = add i32 %r3, %r9
  br label %B4

B3:
  ret i32 %r2

B4:
  %r4 = phi i32 [ %r2, %B2 ], [ %r16, %B5 ]
  %r12 = add i32 0, 100 ; loadint
  %r13 = icmp slt i32 %r4, %r12
  br i1 %r13, label %B5, label %B6

B5:
  %r15 = add i32 0, 6 ; loadint
  %r16 = add i32 %r4, %r15
  br label %B4

B6:
  %r18 = add i32 0, 100 ; loadint
  %r19 = sub i32 %r4, %r18
  br label %B1

}
