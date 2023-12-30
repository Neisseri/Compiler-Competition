declare void @putint(i32)

; module
define i32 @main(){
B16:
  %r2 = add i32 0, 2 ; loadint
  %r3 = call i32 @deepWhileBr(i32 %r2, i32 %r2)
  %r6 = call i32 @putint(i32 %r3)
  %r8 = add i32 0, 2 ; loadint
  ret i32 %r8

}
define i32 @deepWhileBr(i32 %r1, i32 %r2){
B2:
  %r8 = add i32 %r1, %r2
  br label %B3

B3:
  %r42 = phi i32 [ %r1, %B2 ], [ %r41, %B8 ]
  %r39 = phi i32 [ %r1, %B2 ], [ %r13, %B8 ]
  %r36 = phi i32 [ %r8, %B2 ], [ %r35, %B8 ]
  %r10 = add i32 0, 75 ; loadint
  %r11 = icmp slt i32 %r36, %r10
  br i1 %r11, label %B4, label %B5

B4:
  %r13 = add i32 0, 42 ; loadint
  br label %B6

B5:
  ret i32 %r36

B6:
  %r15 = add i32 0, 100 ; loadint
  %r16 = icmp slt i32 %r36, %r15
  br i1 %r16, label %B7, label %B8

B7:
  %r19 = add i32 %r36, %r13
  br label %B9

B8:
  %r41 = phi i32 [ %r42, %B6 ], [ %r40, %B11 ]
  %r35 = phi i32 [ %r36, %B6 ], [ %r38, %B11 ]
  br label %B3

B9:
  %r21 = add i32 0, 99 ; loadint
  %r22 = icmp sgt i32 %r19, %r21
  br i1 %r22, label %B10, label %B11

B10:
  %r25 = add i32 0, 2 ; loadint
  %r26 = mul i32 %r13, %r25
  br label %B12

B11:
  %r40 = phi i32 [ %r42, %B9 ], [ %r26, %B14 ]
  %r38 = phi i32 [ %r19, %B9 ], [ %r37, %B14 ]
  br label %B8

B12:
  %r28 = add i32 0, 0 ; loadint
  %r27 = call i32 @get_one(i32 %r28)
  %r29 = add i32 0, 1 ; loadint
  %r30 = icmp eq i32 %r27, %r29
  br i1 %r30, label %B13, label %B14

B13:
  %r32 = add i32 0, 2 ; loadint
  %r33 = mul i32 %r26, %r32
  br label %B14

B14:
  %r37 = phi i32 [ %r19, %B12 ], [ %r33, %B13 ]
  br label %B11

}
define i32 @get_one(i32 %r1){
B0:
  %r3 = add i32 0, 1 ; loadint
  ret i32 %r3

}
