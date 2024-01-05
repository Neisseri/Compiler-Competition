; module
define i32 @main(){
B0:
  %r6 = add i32 0, 5 ; loadint
  %r7 = add i32 0, 5 ; loadint
  %r8 = add i32 0, 1 ; loadint
  %r9 = add i32 0, 2 ; loadint
  %r11 = add i32 0, 0 ; loadint
  %r10 = sub i32 %r11, %r9
  %r12 = add i32 0, 2 ; loadint
  br label %B1

B1:
  %r15 = add i32 0, 1 ; loadint
  %r16 = mul i32 %r10, %r15
  %r17 = add i32 0, 2 ; loadint
  %r18 = sdiv i32 %r16, %r17
  %r19 = add i32 0, 0 ; loadint
  %r20 = icmp slt i32 %r18, %r19
  br i1 %r20, label %B2, label %B3

B2:
  %r36 = add i32 0, 1 ; loadint
  br label %B4

B3:
  %r24 = sub i32 %r6, %r7
  %r25 = add i32 0, 0 ; loadint
  %r26 = icmp ne i32 %r24, %r25
  br i1 %r26, label %B5, label %B6

B4:
  %r43 = phi logic_expr@#21 i32 [ %r42, %B7 ]
  %r41 = phi logic_expr@#13 i32 [ %r36, %B2 ], [ %r42, %B7 ]
  br i1 %r41, label %B8, label %B9

B5:
  %r28 = add i32 0, 3 ; loadint
  %r29 = add i32 %r8, %r28
  %r30 = add i32 0, 2 ; loadint
  %r31 = srem i32 %r29, %r30
  %r32 = add i32 0, 0 ; loadint
  %r33 = icmp ne i32 %r31, %r32
  br label %B7

B6:
  %r34 = add i32 0, 0 ; loadint
  br label %B7

B7:
  %r42 = phi logic_expr@#21 i32 [ %r33, %B5 ], [ %r34, %B6 ]
  br label %B4

B8:
  %r38 = call i32 @putint(i32 %r12)
  br label %B9

B9:
  %r40 = add i32 0, 0 ; loadint
  ret i32 %r40

}
