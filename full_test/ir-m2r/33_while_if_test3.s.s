; module
define i32 @main(){
B14:
  %r2 = add i32 0, 2 ; loadint
  %r3 = call i32 @deepWhileBr(i32 %r2, i32 %r2)
  ret i32 %r3

}
define i32 @deepWhileBr(i32, i32){
B0:
  %r8 = add i32 %r1, %r2
  br label %B1

B1:
  %r6 = %r12
  %r7 = %r13
  %r8 = phi i32 [ %r8, %B0 ], [ %r13, %B6 ]
  %r10 = add i32 0, 75 ; loadint
  %r11 = icmp slt i32 %r8, %r10
  br i1 %r11, label %B2, label %B3

B2:
  %r13 = add i32 0, 42 ; loadint
  br label %B4

B3:
  ret i32 %r8

B4:
  %r15 = add i32 0, 100 ; loadint
  %r16 = icmp slt i32 %r8, %r15
  br i1 %r16, label %B5, label %B6

B5:
  %r19 = add i32 %r8, %r13
  br label %B7

B6:
  %r12 = phi i32 [ %r6, %B4 ], [ %r10, %B9 ]
  %r13 = phi i32 [ %r8, %B4 ], [ %r11, %B9 ]
  br label %B1

B7:
  %r21 = add i32 0, 99 ; loadint
  %r22 = icmp sgt i32 %r19, %r21
  br i1 %r22, label %B8, label %B9

B8:
  %r25 = add i32 0, 2 ; loadint
  %r26 = mul i32 %r13, %r25
  br label %B10

B9:
  %r10 = phi i32 [ %r6, %B7 ], [ %r26, %B12 ]
  %r11 = phi i32 [ %r19, %B7 ], [ %r9, %B12 ]
  br label %B6

B10:
  %r27 = add i32 0, 1 ; loadint
  %r28 = add i32 0, 1 ; loadint
  %r29 = icmp eq i32 %r27, %r28
  br i1 %r29, label %B11, label %B12

B11:
  %r31 = add i32 0, 2 ; loadint
  %r32 = mul i32 %r26, %r31
  br label %B12

B12:
  %r9 = phi i32 [ %r19, %B10 ], [ %r32, %B11 ]
  br label %B9

}
