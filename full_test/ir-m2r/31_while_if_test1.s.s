; module
define i32 @main(){
B13:
  %r1 = call i32 @whileIf()
  ret i32 %r1

}
define i32 @whileIf(){
B0:
  %r2 = add i32 0, 0 ; loadint
  %r4 = add i32 0, 0 ; loadint
  br label %B1

B1:
  %r2 = phi i32 [ %r4, %B0 ], [ %r5, %B7 ]
  %r3 = phi i32 [ %r2, %B0 ], [ %r21, %B7 ]
  %r6 = add i32 0, 100 ; loadint
  %r7 = icmp slt i32 %r3, %r6
  br i1 %r7, label %B2, label %B3

B2:
  br label %B4

B3:
  ret i32 %r2

B4:
  %r9 = add i32 0, 5 ; loadint
  %r10 = icmp eq i32 %r3, %r9
  br i1 %r10, label %B5, label %B6

B5:
  %r11 = add i32 0, 25 ; loadint
  br label %B7

B6:
  br label %B8

B7:
  %r5 = phi i32 [ %r11, %B5 ], [ %r4, %B11 ]
  %r20 = add i32 0, 1 ; loadint
  %r21 = add i32 %r3, %r20
  br label %B1

B8:
  %r13 = add i32 0, 10 ; loadint
  %r14 = icmp eq i32 %r3, %r13
  br i1 %r14, label %B9, label %B10

B9:
  %r15 = add i32 0, 42 ; loadint
  br label %B11

B10:
  %r17 = add i32 0, 2 ; loadint
  %r18 = mul i32 %r3, %r17
  br label %B11

B11:
  %r4 = phi i32 [ %r15, %B9 ], [ %r18, %B10 ]
  br label %B7

}
