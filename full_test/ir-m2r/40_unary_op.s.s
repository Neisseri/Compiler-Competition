; module
define i32 @main(){
B0:
  %r2 = add i32 0, 10 ; loadint
  br label %B1

B1:
  %r5 = add i32 0, 0 ; loadint
  %r4 = icmp eq i32 %r5, %r2
  %r7 = add i32 0, 0 ; loadint
  %r6 = icmp eq i32 %r7, %r4
  %r9 = add i32 0, 0 ; loadint
  %r8 = icmp eq i32 %r9, %r6
  %r11 = add i32 0, 0 ; loadint
  %r10 = sub i32 %r11, %r8
  br i1 %r10, label %B2, label %B3

B2:
  %r12 = add i32 0, 1 ; loadint
  %r14 = add i32 0, 0 ; loadint
  %r13 = sub i32 %r14, %r12
  %r16 = add i32 0, 0 ; loadint
  %r15 = sub i32 %r16, %r13
  %r18 = add i32 0, 0 ; loadint
  %r17 = sub i32 %r18, %r15
  br label %B4

B3:
  %r19 = add i32 0, 0 ; loadint
  br label %B4

B4:
  %r21 = phi i32 [ %r17, %B2 ], [ %r19, %B3 ]
  ret i32 %r21

}
