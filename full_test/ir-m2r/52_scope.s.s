; module
@a#0 = global int 7, 4
define i32 @main(){
B7:
  %r2 = add i32 0, 0 ; loadint
  %r4 = add i32 0, 0 ; loadint
  br label %B8

B8:
  %r27 = phi i32 [ %r2, %B7 ], [ %r26, %B13 ]
  %r25 = phi i32 [ %r4, %B7 ], [ %r16, %B13 ]
  %r6 = add i32 0, 100 ; loadint
  %r7 = icmp slt i32 %r25, %r6
  br i1 %r7, label %B9, label %B10

B9:
  br label %B11

B10:
  br label %B14

B11:
  %r8 = call i32 @func()
  %r9 = add i32 0, 1 ; loadint
  %r10 = icmp eq i32 %r8, %r9
  br i1 %r10, label %B12, label %B13

B12:
  %r12 = add i32 0, 1 ; loadint
  %r13 = add i32 %r27, %r12
  br label %B13

B13:
  %r26 = phi i32 [ %r27, %B11 ], [ %r13, %B12 ]
  %r15 = add i32 0, 1 ; loadint
  %r16 = add i32 %r25, %r15
  br label %B8

B14:
  %r18 = add i32 0, 100 ; loadint
  %r19 = icmp slt i32 %r27, %r18
  br i1 %r19, label %B15, label %B16

B15:
  %r21 = add i32 0, 1 ; loadint
  %r20 = call i32 @putint(i32 %r21)
  br label %B17

B16:
  %r23 = add i32 0, 0 ; loadint
  %r22 = call i32 @putint(i32 %r23)
  br label %B17

B17:
  %r24 = add i32 0, 0 ; loadint
  ret i32 %r24

}
define i32 @func(){
B0:
  %r2 = loadaddr @a#0
  %r3 = load i32, ptr %r2
  %r5 = add i32 0, 1 ; loadint
  br label %B1

B1:
  %r8 = icmp eq i32 %r5, %r3
  br i1 %r8, label %B2, label %B3

B2:
  %r10 = add i32 0, 1 ; loadint
  %r11 = add i32 %r5, %r10
  %r12 = add i32 0, 1 ; loadint
  ret i32 %r12

B3:
  %r13 = add i32 0, 0 ; loadint
  ret i32 %r13

}
