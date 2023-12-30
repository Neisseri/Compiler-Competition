; module
define i32 @main(){
B12:
  %r1 = call i32 @ifWhile()
  ret i32 %r1

}
define i32 @ifWhile(){
B0:
  %r2 = add i32 0, 0 ; loadint
  %r4 = add i32 0, 3 ; loadint
  br label %B1

B1:
  %r6 = add i32 0, 5 ; loadint
  %r7 = icmp eq i32 %r2, %r6
  br i1 %r7, label %B2, label %B3

B2:
  br label %B5

B3:
  br label %B8

B4:
  %r5 = phi i32 [ %r16, %B7 ], [ %r3, %B10 ]
  %r6 = phi i32 [ %r2, %B7 ], [ %r4, %B10 ]
  ret i32 %r5

B5:
  %r2 = phi i32 [ %r4, %B2 ], [ %r13, %B6 ]
  %r9 = add i32 0, 2 ; loadint
  %r10 = icmp eq i32 %r2, %r9
  br i1 %r10, label %B6, label %B7

B6:
  %r12 = add i32 0, 2 ; loadint
  %r13 = add i32 %r2, %r12
  br label %B5

B7:
  %r15 = add i32 0, 25 ; loadint
  %r16 = add i32 %r2, %r15
  br label %B4

B8:
  %r3 = phi i32 [ %r4, %B3 ], [ %r22, %B9 ]
  %r4 = phi i32 [ %r2, %B3 ], [ %r25, %B9 ]
  %r18 = add i32 0, 5 ; loadint
  %r19 = icmp slt i32 %r4, %r18
  br i1 %r19, label %B9, label %B10

B9:
  %r21 = add i32 0, 2 ; loadint
  %r22 = mul i32 %r3, %r21
  %r24 = add i32 0, 1 ; loadint
  %r25 = add i32 %r4, %r24
  br label %B8

B10:
  br label %B4

}
