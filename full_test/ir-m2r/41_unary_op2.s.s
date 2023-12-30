; module
define i32 @main(){
B0:
  %r3 = add i32 0, 56 ; loadint
  %r4 = add i32 0, 4 ; loadint
  %r6 = add i32 0, 4 ; loadint
  %r8 = add i32 0, 0 ; loadint
  %r7 = sub i32 %r8, %r6
  %r9 = sub i32 %r3, %r7
  %r11 = add i32 %r9, %r4
  br label %B1

B1:
  %r14 = add i32 0, 0 ; loadint
  %r13 = icmp eq i32 %r14, %r11
  %r16 = add i32 0, 0 ; loadint
  %r15 = icmp eq i32 %r16, %r13
  %r18 = add i32 0, 0 ; loadint
  %r17 = icmp eq i32 %r18, %r15
  %r20 = add i32 0, 0 ; loadint
  %r19 = sub i32 %r20, %r17
  br i1 %r19, label %B2, label %B3

B2:
  %r21 = add i32 0, 1 ; loadint
  %r23 = add i32 0, 0 ; loadint
  %r22 = sub i32 %r23, %r21
  %r25 = add i32 0, 0 ; loadint
  %r24 = sub i32 %r25, %r22
  %r27 = add i32 0, 0 ; loadint
  %r26 = sub i32 %r27, %r24
  br label %B4

B3:
  %r28 = add i32 0, 0 ; loadint
  %r30 = add i32 %r28, %r4
  br label %B4

B4:
  %r34 = phi i32 [ %r26, %B2 ], [ %r30, %B3 ]
  %r31 = call i32 @putint(i32 %r34)
  %r33 = add i32 0, 0 ; loadint
  ret i32 %r33

}
