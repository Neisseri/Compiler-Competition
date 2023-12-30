; module
define i32 @main(){
B14:
  %r1 = call i32 @FourWhile()
  ret i32 %r1

}
define i32 @FourWhile(){
B0:
  %r2 = add i32 0, 5 ; loadint
  %r5 = add i32 0, 6 ; loadint
  %r6 = add i32 0, 7 ; loadint
  %r8 = add i32 0, 10 ; loadint
  br label %B1

B1:
  %r2 = phi i32 [ %r8, %B0 ], [ %r6, %B6 ]
  %r3 = phi i32 [ %r6, %B0 ], [ %r7, %B6 ]
  %r4 = phi i32 [ %r5, %B0 ], [ %r41, %B6 ]
  %r5 = phi i32 [ %r2, %B0 ], [ %r14, %B6 ]
  %r10 = add i32 0, 20 ; loadint
  %r11 = icmp slt i32 %r5, %r10
  br i1 %r11, label %B2, label %B3

B2:
  %r13 = add i32 0, 3 ; loadint
  %r14 = add i32 %r5, %r13
  br label %B4

B3:
  %r45 = add i32 %r4, %r2
  %r46 = add i32 %r5, %r45
  %r48 = add i32 %r46, %r3
  ret i32 %r48

B4:
  %r6 = phi i32 [ %r2, %B2 ], [ %r9, %B9 ]
  %r7 = phi i32 [ %r3, %B2 ], [ %r38, %B9 ]
  %r8 = phi i32 [ %r4, %B2 ], [ %r20, %B9 ]
  %r16 = add i32 0, 10 ; loadint
  %r17 = icmp slt i32 %r8, %r16
  br i1 %r17, label %B5, label %B6

B5:
  %r19 = add i32 0, 1 ; loadint
  %r20 = add i32 %r8, %r19
  br label %B7

B6:
  %r40 = add i32 0, 2 ; loadint
  %r41 = sub i32 %r8, %r40
  br label %B1

B7:
  %r9 = phi i32 [ %r6, %B5 ], [ %r35, %B12 ]
  %r10 = phi i32 [ %r7, %B5 ], [ %r26, %B12 ]
  %r22 = add i32 0, 7 ; loadint
  %r23 = icmp eq i32 %r10, %r22
  br i1 %r23, label %B8, label %B9

B8:
  %r25 = add i32 0, 1 ; loadint
  %r26 = sub i32 %r10, %r25
  br label %B10

B9:
  %r37 = add i32 0, 1 ; loadint
  %r38 = add i32 %r10, %r37
  br label %B4

B10:
  %r11 = phi i32 [ %r9, %B8 ], [ %r32, %B11 ]
  %r28 = add i32 0, 20 ; loadint
  %r29 = icmp slt i32 %r11, %r28
  br i1 %r29, label %B11, label %B12

B11:
  %r31 = add i32 0, 3 ; loadint
  %r32 = add i32 %r11, %r31
  br label %B10

B12:
  %r34 = add i32 0, 1 ; loadint
  %r35 = sub i32 %r11, %r34
  br label %B7

}
