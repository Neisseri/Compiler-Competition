; module
define i32 @main(){
B0:
  %r2 = add i32 0, 4 ; loadint
  br label %B1

B1:
  %r27 = phi i32 [ %r1, %B0 ], [ %r26, %B6 ]
  %r24 = phi i32 [ %r1, %B0 ], [ %r7, %B6 ]
  %r22 = phi i32 [ %r2, %B0 ], [ %r21, %B6 ]
  %r4 = add i32 0, 75 ; loadint
  %r5 = icmp slt i32 %r22, %r4
  br i1 %r5, label %B2, label %B3

B2:
  %r7 = add i32 0, 42 ; loadint
  br label %B4

B3:
  ret i32 %r22

B4:
  %r9 = add i32 0, 100 ; loadint
  %r10 = icmp slt i32 %r22, %r9
  br i1 %r10, label %B5, label %B6

B5:
  %r12 = add i32 0, 42 ; loadint
  %r13 = add i32 %r22, %r12
  br label %B7

B6:
  %r26 = phi i32 [ %r27, %B4 ], [ %r25, %B9 ]
  %r21 = phi i32 [ %r22, %B4 ], [ %r23, %B9 ]
  br label %B1

B7:
  %r15 = add i32 0, 99 ; loadint
  %r16 = icmp sgt i32 %r13, %r15
  br i1 %r16, label %B8, label %B9

B8:
  %r18 = add i32 0, 84 ; loadint
  %r19 = add i32 0, 168 ; loadint
  br label %B9

B9:
  %r25 = phi i32 [ %r27, %B7 ], [ %r18, %B8 ]
  %r23 = phi i32 [ %r13, %B7 ], [ %r19, %B8 ]
  br label %B6

}
